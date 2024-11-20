package web.controller;

import java.util.ArrayList;
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
			Bean bean,
			@RequestParam("cupNoteName") List<Integer> cupNotes
			) {
		log.info("insertbean : {}", bean);
		log.info("insertbeanImg : {}", beanImg);
		log.info("insertcupNote : {}", cupNotes);
		
		service.insertBean(beanImg, bean, cupNotes);
		return "redirect:/bean/all";
	}
	
	@GetMapping("/beanupdate")
	public void beanUpdateForm(
			Bean bean,
			Model model
			) {
		log.info("benaNo : {}", bean.getBeanNo());
		List<Bean> ListNo = service.selectBeanNo(bean.getBeanNo());
		
		List<Integer> cupNote = new ArrayList<>();
		cupNote.add(0, ListNo.get(0).getCupNoteNo());
		cupNote.add(1, ListNo.get(1).getCupNoteNo());
		
		model.addAttribute("ListNo",ListNo);
		model.addAttribute("cupNote",cupNote);
	}
	
	@PostMapping("/beanupdate")
	public String beanUpdateProc(
			BeanImg BeanImg,
			Bean bean,
			@RequestParam("cupNoteName") List<Integer> cupNotes
			) {
		log.info("updateBeanImg : {}", BeanImg);
		log.info("updatebena : {}", bean);
		log.info("updatecupNote : {}", cupNotes);
		
		service.updateBean(BeanImg, bean, cupNotes);
		
		return "redirect:/bean/info?beanNo=" + bean.getBeanNo();
	}
	
	@GetMapping("/beandelete")
	public String beanDeleteProc(
			Bean bean
			) {
		log.info("deleteBeanNo : {}", bean.getBeanNo());
		service.beanDelete(bean.getBeanNo());
		return "redirect:/bean/all";
	}
}
