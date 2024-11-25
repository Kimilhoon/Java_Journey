package web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

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
	
//	@GetMapping("/quizResult")
//	public void quizFormProc(@RequestBody QuizResult param, 
//			@SessionAttribute(value = "userId", required = false) String userId,
//			Model model, HttpServletResponse resp) {
//		
//		// 컵 노트 번호를 받아와서 빈 조회하기
//		List<Bean> list = service.getBeanByCupnoteNo(param);
//		
//		log.info("list: {}", list);
//
//		model.addAttribute("list", list);
//		
//		
//		// 원두 조회 전 퀴즈결과 저장하기
//		boolean isResult = service.insertQuizResult(param);
//		
//		Gson gson = new Gson();
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("isResult", isResult);
//		map.put("list", list);
//		
//		resp.setCharacterEncoding("utf-8");
//		
//		try {
//			resp.getWriter().append(gson.toJson(map));
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//			
//		} // try end
//		
//		
//	} // quizForm() end
	
	@PostMapping("/quizForm")
	public void quizResult(@SessionAttribute(value = "userId", required = false) String userId,
			@RequestBody QuizResult param, Model model, HttpServletResponse resp) {
		
		log.info("QuizResult QuizResult QuizResult QuizResult QuizResult{}", param);
		
		if (userId == null) {
	        // 세션에 userId가 없을 때 처리
	        log.warn("User is not logged in or session has expired.");
	        return;
	    } // if (userId == null) end
		
		// 컵 노트 번호를 받아와서 빈 조회하기
		List<Bean> list = service.getBeanByCupnoteNo(param);
		
		log.info("list: {}", list);

		model.addAttribute("list", list);
		
		Member userNo = service.selectUserNoByUserId(userId);
		log.info("userNo: {}", userNo.getUserNo());
		model.addAttribute("userNo", userNo.getUserNo());
		
		// 원두 조회 전 퀴즈결과 저장하기
		boolean isResult = service.insertQuizResult(param);
		
		// 삽입된 퀴즈 넘버 가져오기
		int quizResultNo = param.getQuizResultNo();
		
		log.info("isResult: {}", isResult);
		log.info("quizResultNo: {}", quizResultNo);
		
		Gson gson = new Gson();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("isResult", isResult);
		map.put("list", list);
		map.put("quizResultNo", quizResultNo);
		
		resp.setCharacterEncoding("utf-8");
		
		try {
			resp.getWriter().append(gson.toJson(map));
			
		} catch (IOException e) {
			e.printStackTrace();
			
		} // try end
		
	} // quizResult() end
	
	@PostMapping("/resultbean")
	public ResponseEntity<Void> resultbeanProc(QuizResult param, @SessionAttribute(value = "userNo", required = false) int userNo) {
		log.info("paramparamparamparam: {}", param);
		log.info("userNo: {}", userNo);
		
		// quizResult테이블에 beanNo 업데이트
		service.updateBeanNo(param);
		
		// memberQuizResult에 결과값 삽입하기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo", userNo);
		map.put("quizResult", param.getQuizResultNo());
		
		boolean isResult = service.countQuizResultNo(map);
		
		log.info("isResult: {}", isResult);
		
		log.info("map: {}", map);
		
		if( !isResult ) {
			service.insertMemberQuizResult(map);
			
		} else {
			service.deleteMemberQuizResult(map);
			
			service.insertMemberQuizResult(map);
			
		} // if( !isResult ) end
		
		// AJAX 요청에 대해서는 리다이렉트를 반환하지 않고 성공 응답 처리
	    return ResponseEntity.ok().build();
		
	} // resultbeanProc() end
	
	
	
} // class end
