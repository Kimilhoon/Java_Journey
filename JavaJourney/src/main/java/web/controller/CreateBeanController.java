package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
import web.dto.BeanImg;
import web.service.face.CreateBeanService;

@Controller
@Slf4j
@RequestMapping("/create")
public class CreateBeanController {
	
	@Autowired CreateBeanService service;
	
	@GetMapping("/bean")
	public void beanWriteForm() {}
	
	@GetMapping("/selectimage")
	public void selecteImagejspForm(
		BeanImg beanImg,
		Model model
			) {
		List<BeanImg> imgList = service.selectAllImg();
		log.info("imgList : {}",imgList);
		
		model.addAttribute("imgList",imgList);
	}
	
	@PostMapping("/bean")
	public void beanWriteProc(
			Bean bean
			) {
		
		log.info("bena : {}", bean);
		System.out.println("이미지 크기: " + bean.getBeanInfo());
		service.insertBean(bean);
	}

}
