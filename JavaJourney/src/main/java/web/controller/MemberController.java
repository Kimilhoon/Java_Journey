package web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import web.dto.Member;
import web.service.face.MemberService;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
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
			
			session.setAttribute("isLogin", true);
			session.setAttribute("userId", member.getUserId());
			session.setAttribute("userNick", member.getUserNick());
			
			return "redirect:/main";
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
	
	@PostMapping("/test")
	public void testd() {}
	
	
	//본인인증
//	@PostMapping("/certifications")
	
	
	
	
	
}
