package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/brand")
@Slf4j
public class BrandController {
	
	@GetMapping("/info")
	public void brandForm() {
		log.info("/brand/info [GET]");
		
//		return "../info";
	}
	
}
