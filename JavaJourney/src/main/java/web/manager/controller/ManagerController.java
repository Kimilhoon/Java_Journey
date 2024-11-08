package web.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Member;
import web.manager.service.face.ManagerService;

@Controller
@RequestMapping("/manager")
@Slf4j
public class ManagerController {
//	
	@Autowired private ManagerService service;
	
	@GetMapping("/menu")
	public void menuForm() {}
	
	@GetMapping("/user")
	public void userForm(
			Model model
			) {
		List<Member> memberList = service.selectAll();
		log.info("memberList: {}",memberList);
		
		model.addAttribute("memberList",memberList);
	}
	
	@GetMapping("/subuser")
	public void subuserFoem(
			Model model
			) {
		List<Member> memberList = service.selectAll();
		log.info("memberList: {}",memberList);
		
		model.addAttribute("memberList",memberList);
		
	}
	
}
