package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/main")
@Slf4j
public class MainController {
	
	@GetMapping("")
	public void mainForm() {}
	
	@GetMapping("/admin")
	public void adminmenuForm() {}
	
	
	
}
