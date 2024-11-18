package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.extern.slf4j.Slf4j;
import web.service.face.QuizService;

@Controller
@RequestMapping("/quiz")
@Slf4j
public class QuizController {
	
	@Autowired
	private QuizService service;
	
	@GetMapping("/quiz1")
	public void quiz1Form(@SessionAttribute(value = "userId", required = false) String userId) {
		
	} // quizForm() end
	
	@GetMapping("/quiz2")
	public void quzi2Form(@SessionAttribute(value = "userId", required = false) String userId,
			@RequestParam(value = "item", required = false) List<String> item, Model model) {
		
		model.addAttribute("item", item);
		
		// 선택된 체크박스 값 출력
		if (item != null) {
			for (String value : item) {
				log.info("Selected item: {}", value);
			}
		} else {
			log.info("No items selected.");
		}
		
	} // quzi2Form() end
	
	@GetMapping("/quiz3")
	public void quiz3From(@SessionAttribute(value = "userId", required = false) String userId) {
		
	} // quiz3From() end
	
	@GetMapping("/quiz")
	public void quizForm() {
		
	}
	
} // class end
