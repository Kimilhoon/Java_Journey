package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.extern.slf4j.Slf4j;
import web.dto.Member;
import web.dto.QuizResult;
import web.service.face.QuizService;

@Controller
@RequestMapping("/quiz")
@Slf4j
public class QuizController {
	
	@Autowired
	private QuizService service;
	
	@GetMapping("/quizForm")
	public void quizForm() {
		
	} // quizForm() end
	
	@PostMapping("/quizForm")
	public void quizFormProc(@RequestBody QuizResult quizResult, 
			@SessionAttribute(value = "userId", required = false) String userId,
			Model model) {
		
		if (userId == null) {
	        // 세션에 userId가 없을 때 처리
	        log.warn("User is not logged in or session has expired.");
	        return;
	    } // if (userId == null) end
		
		Member userNo = service.selectUserNoByUserId(userId);
		log.info("userNo: {}", userNo.getUserNo());
		model.addAttribute("userNo", userNo.getUserNo());
		
	} // quizForm() end
	
	@GetMapping("/quizResult")
	public void quizResult() {
		
	} // quizForm() end
	
} // class end
