package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.service.face.QuizService;
import web.service.impl.QuizServiceImpl;

@Controller
@RequestMapping("/quiz")
@Slf4j
public class QuizController {
	
	private QuizService service = new QuizServiceImpl();
	
}