package web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
//	@PostMapping("/idfind")
//	public String idfindProc(Member member, Model model
//			, @RequestParam String userName
//			, @RequestParam String userEmail) {
//		
//		member.setUserName(userName);
//		member.setUserEmail(userEmail);
//		
//		Member idfind = service.selectByMemberEmail(member);
//		
//		if(idfind != null) {
//			model.addAttribute("idfind", idfind);
//		} else {
//			model.addAttribute("msg", "조회된 아이디가 없습니다");
//		}
//		
//		return "redirect:./idfind";
//	}
	
//	@PostMapping("/idfind")
//	public String idfindProc() {
//		
//	}
	
	@RequestMapping("/pwfind")
	public void pwfind() {
		
	}
	
	
	
	
}
