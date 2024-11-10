package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.BeanRev;
import web.dto.Cafe;
import web.service.face.BeanService;
import web.service.face.CafeService;

@Controller
@RequestMapping("/main")
@Slf4j
public class MainController {
	
	@Autowired CafeService cafeservice;
	@Autowired BeanService beanservice;
	
	@GetMapping("")
	public void mainForm(
			Model model
			) {
		
//		List<Cafe> cafeBestList = cafeservice.getBest();
//		log.info("cafeBestList : {}",cafeBestList);
		
//		List<BeanRev> beanBestList = beanservice.getBest();
//		log.info("beanBestList : {}",beanBestList);
		
//		model.addAttribute("cafeBestList",cafeBestList);
//		model.addAttribute("beanBestList",beanBestList);
		
	}
	
	@GetMapping("/admin")
	public void adminmenuForm() {}
	
	
	
}
