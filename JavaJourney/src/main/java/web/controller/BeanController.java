package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
import web.service.face.BeanService;
import web.util.Paging;

@Controller
@RequestMapping("/bean")
@Slf4j
public class BeanController {
	
	@Autowired private BeanService service;
	
	@GetMapping("/best")
	public void BestBeanForm() {
		
		
	} // BestBeanForm() end

	@GetMapping("/all")
	public void AllBeanForm(Paging param, Model model) {
		
		// 전달파라미터를 이용해서 현재 페이징 객체 알아내기
		Paging paging = service.getPaging( param );
		log.info("paging : {}",paging);
		
		model.addAttribute("paging", paging);
		
		List<Bean> list = service.getAllBean( paging );

		model.addAttribute("list", list);
		
	} // AllBeanForm() end

	@GetMapping("/info")
	public void BeanInfoForm(Bean param) {
		
	} // BeanInfoForm(Bean param) end
	
} // class end
