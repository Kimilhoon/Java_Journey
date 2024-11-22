package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Cafe;
import web.dto.CafeImg;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.service.face.CreateCafeService;

@Controller
@Slf4j
@RequestMapping("/create")
public class CreateCafeController {
	
	@Autowired CreateCafeService service;
	
	@GetMapping("/cafe")
	public void write() {}
	
	@PostMapping("/cafe")
	public String writeProc(Cafe cafe, CafeImg cafeImg) {
		log.info("cafe:{}", cafe);
		
		service.insertCafe(cafe, cafeImg);
		
		return "redirect:/cafe/all";
	}
	
	@GetMapping("/cafeUpdate")
	public String update(Cafe cafe, Model model) {
		
		cafe = service.view(cafe);
		model.addAttribute("cafe", cafe);
		
		
		return "/create/cafeUpdate";
	}
	
	@PostMapping("/cafeUpdate")
	public String updateProc(Cafe cafe, Model model, CafeImg cafeImg) {
		log.info("cafe:{}", cafe);
		log.info("cafe:{}", cafeImg);
		
		service.update(cafe, cafeImg);
		return "redirect:/cafe/info?cafeNo=" + cafe.getCafeNo();
	}
	
	
	@RequestMapping("/cafeDelete")
	public String deleteCafe(Cafe cafe, HttpSession session) {
		
		service.updateCafeStatus(cafe.getCafeNo());
		
		return "redirect:/cafe/all";
	}
	
	

	
	

}
