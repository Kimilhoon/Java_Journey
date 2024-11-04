package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.service.face.BeanService;
import web.service.impl.BeanServiceImpl;

@Controller
@RequestMapping("/bean")
@Slf4j
public class BeanController {
	
	@Autowired private BeanService service = new BeanServiceImpl();
	
	@GetMapping("/best")
	public void BestBeanForm() {
		
	} // BestBeanForm() end

	@GetMapping("/all")
	public void AllBeanForm() {
		
	} // AllBeanForm() end

//	@GetMapping("/info")
//	public void BeanInfoForm(Bean param) {
//		
//	} // BeanInfoForm(Bean param) end
	
} // class end
