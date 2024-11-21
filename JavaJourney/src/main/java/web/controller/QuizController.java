package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
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
	
//	@PostMapping("/quizForm")
//	public void quizFormProc(@RequestBody QuizResult param, 
//			@SessionAttribute(value = "userId", required = false) String userId,
//			Model model) {
//		
//		log.info("{}", param);
//		
//		if (userId == null) {
//	        // 세션에 userId가 없을 때 처리
//	        log.warn("User is not logged in or session has expired.");
//	        return;
//	    } // if (userId == null) end
//		
//		Member userNo = service.selectUserNoByUserId(userId);
//		log.info("userNo: {}", userNo.getUserNo());
//		model.addAttribute("userNo", userNo.getUserNo());
//		
//		List<Bean> 
//		
//	} // quizForm() end
	
	@RequestMapping("/quizResult")
	public void quizResult(@SessionAttribute(value = "userId", required = false) String userId,
			@RequestBody QuizResult param, Model model) {
		
		log.info("QuizResult QuizResult QuizResult QuizResult QuizResult{}", param);
		
		if (userId == null) {
	        // 세션에 userId가 없을 때 처리
	        log.warn("User is not logged in or session has expired.");
	        return;
	    } // if (userId == null) end
		
		Member userNo = service.selectUserNoByUserId(userId);
		log.info("userNo: {}", userNo.getUserNo());
		model.addAttribute("userNo", userNo.getUserNo());
		
		// 원두 조회 전 퀴즈결과 저장하기
		service.insertQuizResult(param);
		
		// 컵 노트 번호를 받아와서 빈 조회하기
		List<Bean> list = service.getBeanByCupnoteNo(param);
		
	} // quizForm() end
	
} // class end
