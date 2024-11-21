package web.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	private KakaoApi kakaoApi = new KakaoApi();
	
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
	

@GetMapping("/test")
public void test() {}
	
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
	
	@RequestMapping("/kakao/login")
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		// 1. 인증코드 요청 전달 
		String access_token = kakaoApi.getAccessToken(code);
		
		// 2. 인증코드로 토큰 전달
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(access_token);
		
		if(userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_token", access_token);
			session.setAttribute("isLogin", true);
		}
		mav.addObject("userId", userInfo.get("email"));
		mav.setViewName("main");
		return mav;
		
	}
	
	@RequestMapping("/kakao/logout")
	public ModelAndView kakaoLogout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		kakaoApi.kakaoLogout((String) session.getAttribute("access_token"));
		session.removeAttribute("access_token");
		session.removeAttribute("userId");
		mav.setViewName("main");
		
		return mav;
	}
	
	
	
	
}
