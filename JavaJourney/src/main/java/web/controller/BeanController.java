package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void AllBeanForm(Paging param, Model model, 
			@RequestParam(required = false) String cupnote, 
			@RequestParam(required = false) String keyword) {
		log.info("cupnote: {}", cupnote);
		log.info("keyword: {}", keyword);
		
		// 전달파라미터를 이용해서 현재 페이징 객체 알아내기
		Paging paging = service.getPaging( param, cupnote, keyword );
		log.info("paging : {}",paging);
		
		List<Bean> list = service.getAllBean( paging, cupnote, keyword );

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("cupnote", cupnote);
		model.addAttribute("keyword", keyword);
		
	} // AllBeanForm() end
	
	
	@GetMapping("/info")
	public void BeanInfoForm(Bean param, Model model) {
		log.info("param: {}", param);
		Bean beanInfo = service.getBeanInfo( param );
		
		log.info("beanInfo: {}", beanInfo);
		
		model.addAttribute("beanInfo", beanInfo);
		
	} // BeanInfoForm(Bean param) end
	
	
	@PostMapping("/info")
	public void BeanInfoFormProc(int beanNo, int userNo) {
		log.info("beanNo: {}", beanNo);
		log.info("userNo: {}", userNo);

	}
	
} // class end
