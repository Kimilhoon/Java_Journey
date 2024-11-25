package web.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MemberDao;

@Slf4j
@Service
public class KakaoApi {
	
	@Autowired private MemberDao dao;
	
	public HashMap<String, Object> getUserInfo(String accessToken) {
		
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqUrl = "https://kapi.kakao.com/v2/user/me";

	    try {
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder result = new StringBuilder();
	        String line;

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }

	        JsonElement element = JsonParser.parseString(result.toString());
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	        String nickname = properties.has("nickname") ? properties.get("nickname").getAsString() : null;
	        String email = kakaoAccount.has("email") ? kakaoAccount.get("email").getAsString() : null;
	        String name = kakaoAccount.has("name") ? kakaoAccount.get("name").getAsString() : null;
	        String phone_number = kakaoAccount.has("phone_number") ? kakaoAccount.get("phone_number").getAsString() : null;
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        userInfo.put("name", name);
	        userInfo.put("phone_number", phone_number);
	        
	        log.info("userInfo: {}", userInfo);
	        
	        int res = dao.cntByUserEmail(email);
	        
	        log.info("res: {}", res);
	        
	        if( res == 0 ) {
	        	
	        	String userId = UUID.randomUUID().toString().split("-")[4];
	        	String userPw = email.split("@")[0];
	        	userInfo.put("userId", userId);
	        	userInfo.put("userPw", userPw);
	        	
	        	dao.insertKakaoLoginUser(userInfo);
	        	
	        	int userNo = dao.selectUSerNoByKakaoEmail(userInfo);
	        	userInfo.put("userNo", userNo);
	        	
	        } else {
	        	
	        	int userNo = dao.selectUSerNoByKakaoEmail(userInfo);
	        	String userId = dao.selectUSerIdByKakaoEmail(userInfo);
	        	
	        	userInfo.put("userNo", userNo);
	        	userInfo.put("userId", userId);
	        }
	        

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return userInfo;
	}
	
	public String getAccessToken(String code) {
		
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn;
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=a54ccddb4065ad4dbb6ab457409929d7");
			sb.append("&redirect_url=http://localhost:8088/member/kakao/login");
			sb.append("&code=" + code);
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			
			br.close();
			bw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return accessToken;
	}

	public void kakaoLogout(String accessToken) {
	    String reqUrl = "https://kapi.kakao.com/v1/user/logout";

	    try {
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder result = new StringBuilder();
	        String line;

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
}























