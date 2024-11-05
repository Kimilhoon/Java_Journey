package web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("writerId", member.getUserId());
			
		}else {
			log.info("로그인 실패");
			
			session.invalidate();
		}
		
		return "redirect:/main/main";

	}
	
	
	
	
}
