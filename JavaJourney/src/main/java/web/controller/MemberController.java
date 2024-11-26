package web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;
import web.dto.Member;
import web.service.face.MemberService;
import web.service.impl.KakaoApi;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private KakaoApi kakaoApi;
	
	//이메일인증 의존성주입
	@Autowired 
	private JavaMailSender mailSender;
	
	@GetMapping("/join")
	public void joinForm() {
		
	}
	
	@PostMapping("/join")
	public String joinProc(Member member) {
		service.join(member);
		
		return "redirect:./login";
	}
	
	@GetMapping("/checkId")
	public ResponseEntity<Map<String, Object>> checkId(@RequestParam("userId") String userId){
		Member checkIdParam = new Member();
		checkIdParam.setUserId(userId);
		
		Map<String, Object> checkIdResult = service.checkId(checkIdParam);
		
		
		return ResponseEntity.ok(checkIdResult);
	}
	
	@GetMapping("/checkNick")
	public ResponseEntity<Map<String, Object>> checkNick(@RequestParam("userNick") String userNick){
		Member checkNickParam = new Member();
		checkNickParam.setUserNick(userNick);
		
		Map<String, Object> checkNickResult = service.checkNick(checkNickParam);
		
		
		return ResponseEntity.ok(checkNickResult);
	}
	
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String loginForm(Member member, HttpSession session) {
		log.info("login param : {}", member);
		
		boolean isLogin = service.login(member);


		if(isLogin) {
			log.info("로그인 성공");
			
			member= service.info(member);
			
			log.info("info member : {}", member);
			
	       if ("Y".equals(member.getStatus())) {
			session.setAttribute("isLogin", true);
			session.setAttribute("userId", member.getUserId());
			session.setAttribute("userNick", member.getUserNick());
			session.setAttribute("userNo", member.getUserNo());
			
			return "redirect:/main";
	       } else {
	    	   log.info("로그인 실패 : 비활성화된 계정");
	    	   session.setAttribute("loginError", "탈퇴한 회원입니다");
				return "redirect:/member/login";
	       }
		
		}else {
			log.info("로그인 실패");
			
//			session.invalidate();
			session.setAttribute("loginError", "아이디 또는 비밀번호를 확인해주세요");
			
			return "redirect:/member/login";
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@GetMapping("/idfind")
	public void idfind() {}
	
	@PostMapping("/idfind")
	@ResponseBody //JSON 형식으로 응답을 보내기
	public String searchId(Member member) throws JsonProcessingException {
		String userId = service.searchId(member);
		
		ObjectMapper mapper = new ObjectMapper(); // Java 객체를 JSON 형식으로 바꾸는 역할
		Map<String, String> resultMap = new HashMap<String, String>();
		
		if(userId != null) {
			resultMap.put("msg", "succ");
			resultMap.put("searchId", userId);
		} else {
			resultMap.put("msg", "fail");
		}
		
		//Map을 JSON 형식으로 변환
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultMap);
		
		return jsonStr;
	}

	
	@GetMapping("/pwfind")
	public void pwfind() {}
	
	@PostMapping("/pwfind")
	@ResponseBody
	public String searchPw(Member member) throws JsonProcessingException {
		String userPw = service.searchPw(member);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> resultMap = new HashMap<String, String>();
		
		if(userPw != null) {
			resultMap.put("msg", "succ");
			resultMap.put("searchPw", userPw);
		} else {
			resultMap.put("msg", "fail");
		}
		
		String jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultMap);
		
		return jsonStr;
	}
	
	//임시비밀번호
	@GetMapping("/tempPw")
	@ResponseBody //json통신위해 작성
	public String tempPw(String userEmail) throws Exception{
		log.info("userEmail:{}", userEmail);
		
	
		//임시비밀번호 생성
		String uuid = UUID.randomUUID().toString();
		String checkNum = uuid.replaceAll("-", "").substring(0, 8);  // 하이픈 제거 후 8자리로 잘라내기
		System.out.println("임시비밀번호 :"+ checkNum);
		
		
		//이메일 전송 내용
		String toMail = userEmail;         //받는 이메일
		String title = "JAVA JOURNEY 임시 비밀번호 인증 이메일 입니다.";
		String content = 
						"임시 비밀번호는 " + checkNum + "입니다.<br>" + 
						"반드시 새 비밀번호로 변경하여 주세요.";
	
		//이메일 전송 코드
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		log.info("checkNum&userEmail:{}", checkNum);		
		log.info("checkNum&userEmail:{}", userEmail);		
		service.updatePw(checkNum, userEmail);
		
		return checkNum;
		
	}	
	

//@GetMapping("/test")
//public void test() {}
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody //json통신위해 작성
	public String mailCheck(String userEmail) throws Exception{
//		log.info("userEmail:{}", userEmail);
		
	
		//인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 :"+ checkNum);
		
		
		//이메일 전송 내용
		String toMail = userEmail;         //받는 이메일
		String title = "JAVA JOURNEY 회원가입 인증 이메일 입니다.";
		String content = 
						"인증 번호는 " + checkNum + "입니다.\n\n" + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	
		//이메일 전송 코드
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
		return num; // String 타입으로 변환 후 반환
	}
	

	//========================================[ 카카오 로그인 ]========================================
	
	@RequestMapping("/kakao/login")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
		
		// 1. 인증코드 요청 전달 
		String access_token = kakaoApi.getAccessToken(code);
		
		// 2. 인증코드로 토큰 전달
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(access_token);
		
		if(userInfo.get("nickname") != null) {
			session.setAttribute("userNick", userInfo.get("nickname"));
			session.setAttribute("access_token", access_token);
			session.setAttribute("userId", userInfo.get("userId"));
			session.setAttribute("userNo", userInfo.get("userNo"));
			session.setAttribute("isLogin", true);
			session.setAttribute("isKakao", true);
		}
		
		model.addAttribute("userNick", userInfo.get("nickname"));
		return "redirect: /main";
		
	}
	
	@RequestMapping("/kakao/logout")
	public String kakaoLogout(HttpSession session) {
		
		kakaoApi.kakaoLogout((String) session.getAttribute("access_token"));
		session.removeAttribute("access_token");
		session.removeAttribute("userId");
		session.invalidate();
		
		return "redirect: /main";
	}
	
	//네이버 로그인 =======================================================================
	@GetMapping("/naver/login")
	public String naverLogin(HttpSession session,HttpServletRequest request) {
		
				String clientId = "pbxVOw3sgvBhBzt9HayL";//애플리케이션 클라이언트 아이디값";
			    String clientSecret = "FuIdnBni_S";//애플리케이션 클라이언트 시크릿값";
			    String code = request.getParameter("code");
			    String state = request.getParameter("state");
			    String redirectURI=null;
			    StringBuffer res = new StringBuffer();
				try {
					redirectURI = URLEncoder.encode("http://localhost:8088/main", "UTF-8");
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
			    String apiURL;
			    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			    apiURL += "client_id=" + clientId;
			    apiURL += "&client_secret=" + clientSecret;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&code=" + code;
			    apiURL += "&state=" + state;
			    String access_token = "";
			    String refresh_token = "";
			    System.out.println("apiURL="+apiURL);
			    try {
			      URL url = new URL(apiURL);
			      HttpURLConnection con = (HttpURLConnection)url.openConnection();
			      con.setRequestMethod("GET");
			      int responseCode = con.getResponseCode();
			      BufferedReader br;
			      System.out.print("responseCode="+responseCode);
			      if(responseCode==200) { // 정상 호출
			        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			      } else {  // 에러 발생
			        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			      }
			      String inputLine;
			      
			      while ((inputLine = br.readLine()) != null) {
			        res.append(inputLine);
			      }
			      br.close();
			      if(responseCode==200) {
			        System.out.println(res.toString());
			      }
			    } catch (Exception e) {
			      System.out.println(e);
			    }
				//------------------------------
			    
			    String res1 = res.toString();
		        // responseCode와 JSON 부분 분리
		        int splitIndex = res1.indexOf("{"); // JSON 시작 위치
		        String responseCodePart = res1.substring(0, splitIndex); // "responseCode=200"
		        String jsonPart = res1.substring(splitIndex);           // "{\"access_token\": ...}"
		        System.out.println();
		        // responseCode 값 추출
//		        String responseCode = responseCodePart.split("=")[1];

		        // Gson을 사용하여 JSON 데이터 파싱
		        Gson gson = new Gson();
		        JsonObject jsonObject = gson.fromJson(jsonPart, JsonObject.class);

		        // 각각의 값을 추출하여 문자열로 저장
		        String accessToken = jsonObject.get("access_token").getAsString();
		        String refreshToken = jsonObject.get("refresh_token").getAsString();
		        String tokenType = jsonObject.get("token_type").getAsString();
		        String expiresIn = jsonObject.get("expires_in").getAsString();

		        // 결과 출력
		        System.out.println("accessToken: " + accessToken);
		        System.out.println("refreshToken: " + refreshToken);
		        System.out.println("tokenType: " + tokenType);
		        System.out.println("expiresIn: " + expiresIn);
			    
			    
			    
			    
			    
			    String token = accessToken; // 네이버 로그인 접근 토큰;
		        String header = "Bearer " + token; // Bearer 다음에 공백 추가


		        String apiURL1 = "https://openapi.naver.com/v1/nid/me";


		        Map<String, String> requestHeaders = new HashMap<>();
		        requestHeaders.put("Authorization", header);
		        String responseBody = get(apiURL1,requestHeaders);


		        System.out.println(responseBody);
		        
		        // JSON 형식의 문자열 데이터
		        String json = responseBody;
		        // Gson 객체 생성

		        // JSON 문자열을 JsonObject로 변환
		        jsonObject = gson.fromJson(json, JsonObject.class);

		        // 최상위 값 추출
		        String resultCode = jsonObject.get("resultcode").getAsString();
		        String message = jsonObject.get("message").getAsString();

		        // 중첩된 "response" 객체 추출
		        JsonObject responseObject = jsonObject.getAsJsonObject("response");
		        String id = responseObject.get("id").getAsString();
		        String nickname = responseObject.get("nickname").getAsString();
		        String email = responseObject.get("email").getAsString();
		        String mobile = responseObject.get("mobile").getAsString();
		        String mobileE164 = responseObject.get("mobile_e164").getAsString();
		        String name = responseObject.get("name").getAsString();

		        // 결과 출력
		        System.out.println("resultCode: " + resultCode);
		        System.out.println("message: " + message);
		        System.out.println("id: " + id);
		        System.out.println("nickname: " + nickname);
		        System.out.println("email: " + email);
		        System.out.println("mobile: " + mobile);
		        System.out.println("mobile_e164: " + mobileE164);
		        System.out.println("name: " + name);

		        // 필요한 경우 각각의 값 문자열로 저장
		        String resultCodeStr = resultCode;
		        String messageStr = message;
		        String idStr = id;
		        String nicknameStr = nickname;
		        String emailStr = email;
		        String mobileStr = mobile;
		        String mobileE164Str = mobileE164;
		        String nameStr = name;
		        
		        Member member = new Member();
		        member.setBusinessNo("null");
		        member.setSocialNo(1);
		        member.setStatus("Y");
		        member.setUserAdd1("네이버 로그인");
		        member.setUserAdd2("네이버로그인");
		        member.setUserEmail(emailStr);
		        member.setUserId(idStr);
		        member.setUserName(nameStr);
		        member.setUserNick(nicknameStr);
		        member.setUserPhone(mobileStr);
		        member.setUserPostcode("네이버로그인");
		        member.setUserPw("naverLoginPW");
		        
		        Map<String, Object> map = service.checkId(member);
		        if((boolean)map.get("duplicate")) {
		        	
	    			member= service.info(member);
	    			
	    			log.info("info member : {}", member);
	    			
	    	       if ("Y".equals(member.getStatus())) {
	    			session.setAttribute("isLogin", true);
	    			session.setAttribute("userId", member.getUserId());
	    			session.setAttribute("userNick", member.getUserNick());
	    			session.setAttribute("userNo", member.getUserNo());
	    			
	    			return "redirect:/main";
	    	       } else {
	    	    	   log.info("로그인 실패 : 비활성화된 계정");
	    	    	   session.setAttribute("loginError", "탈퇴한 회원입니다");
	    				return "redirect:/member/login";
	    	       }
		    		
		        }else {
		        	
		        	service.join(member);
		        	member= service.info(member);
	    			
	    			log.info("info member : {}", member);
	    			
	    	       if ("Y".equals(member.getStatus())) {
	    			session.setAttribute("isLogin", true);
	    			session.setAttribute("userId", member.getUserId());
	    			session.setAttribute("userNick", member.getUserNick());
	    			session.setAttribute("userNo", member.getUserNo());
	    			
	    			return "redirect:/main";
	    	       } else {
	    	    	   log.info("로그인 실패 : 비활성화된 계정");
	    	    	   session.setAttribute("loginError", "탈퇴한 회원입니다");
	    				return "redirect:/member/login";
	    	       }
		        	
		        }
		        
		
	}
	//네이버 로그인 메소드==========================================================================================
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    //네이버 로그인 메소드==========================================================================================
	
	
	
	
	
	
	
	
}
