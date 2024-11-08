package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Cafe;
import web.service.face.CafeService;

@Controller
@RequestMapping("/main")
@Slf4j
public class MainController {
	
	@Autowired CafeService service;
	
	@GetMapping("")
	public void mainForm() {
		
//		List<Cafe> cafeBestList = service.selectBestCafe();
		
	}
	
	@GetMapping("/admin")
	public void adminmenuForm() {}
	
	
	
}
