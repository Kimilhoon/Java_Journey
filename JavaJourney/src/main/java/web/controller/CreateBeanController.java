package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
import web.dto.BeanImg;
import web.dto.CupNote;
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
			Bean bean,
			CupNote cupNote
			) {
		log.info("insertbena : {}", bean);
		log.info("insertbenaImg : {}", beanImg);
		log.info("insertcupNote : {}", cupNote);
		
		service.insertBean(beanImg, bean, cupNote);
		return "redirect:/bean/all";
	}
	
	@GetMapping("/update")
	public void beanUpdateForm() {}

	@PostMapping("/update")
	public String beanUpdateProc(
			BeanImg beanImg,
			Bean bean,
			CupNote cupNote
			) {
		log.info("insertbena : {}", bean);
		log.info("insertbenaImg : {}", beanImg);
		log.info("insertcupNote : {}", cupNote);
		
		Bean updateBean = service.updateBean(beanImg, bean, cupNote);
		log.info("updateBean-controller : {}", updateBean);
		
		return "redirect:/bean/info?=" + updateBean.getBeanNo();
	}
	
	@RequestMapping("/delete")
	public String beanDeleteProc(
			Bean bean,
			BeanImg beanImg,
			CupNote cupNote
			) {
		log.info("deleteBean : {}", bean.getBeanNo());
		log.info("deleteBeanImg : {}", beanImg.getBeanImgNo());
		log.info("deleteCupeNote : {}", cupNote.getCupNoteNo());
		service.beanDelete(bean.getBeanNo()
				, beanImg.getBeanImgNo(), cupNote.getCupNoteNo());
		return "redirect:/bean/all";
	}
}
