package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/test")
public class TestController {
	
	@GetMapping("/test")
	public void test() {
		log.info("test 접속!");
	}
	@GetMapping("/testDJ")
	public void testDH() {}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/testCH")
	public void m() {}
}
