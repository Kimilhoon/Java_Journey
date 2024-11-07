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
	
	@PostMapping("/bean")
	public String beanWriteProc(
			BeanImg beanImg,
			Bean bean
			) {
		log.info("insertbena : {}", bean);
		log.info("insertbenaImg : {}", beanImg);
		
		service.insertBean(beanImg, bean);
		
		return "redirect:/main";
	}
	
	@GetMapping("/update")
	public void beanUpdateForm() {}

	@PostMapping("/update")
	public String beanUpdateProc(
			Bean bean
			) {
		log.info("updatebena : {}", bean);
		Bean updateBean = service.updateBean(bean);
		return "redirect:/bean/info?=" + updateBean.getBeanNo();
	}
	
	@RequestMapping("/delete")
	public String beanDeleteProc(
			Bean bean
			) {
		log.info("deletebean : {}", bean.getBeanNo());
		service.beanDelete(bean.getBeanNo());
		return "redirect:/bean/all";
	}
}
