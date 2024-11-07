package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Cafe;
import web.dto.CafeImg;
import web.service.face.CreateCafeService;

@Controller
@Slf4j
@RequestMapping("/create")
public class CreateCafeController {
	
	@Autowired CreateCafeService service;
	
	@GetMapping("/cafe")
	public void write() {}
	
	@PostMapping("/cafe")
	public String writeProc(Cafe cafe) {
		service.insertCafe(cafe);
		
		return "redirect:/manager/menu";
	}
	
	@GetMapping("/selectCafeImg")
	public void selectCafeImg(CafeImg cafeImg, Model model) {
		List<CafeImg> imgList = service.selectAllImg();
		
		model.addAttribute("imgList", imgList);
	}
	
	

}
