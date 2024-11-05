package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
import web.service.face.CommunityService;

@Controller
@RequestMapping("/comm")
@Slf4j
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	@GetMapping("/bean/write")
	public void beanWriteForm() {}

	@PostMapping("/bean/write")
	public void beanWriteProc(
		@RequestParam("beanName") String beanName ,
		@RequestParam("origin") String origin ,
		@RequestParam("beanComm") String beanComm ,
		@RequestParam("beanInfo") MultipartFile beanInfo ,
		@RequestParam("beanPrice") int beanPrice ,
		@RequestParam("businessNo") int businessNo
			) {
		Bean bean = new Bean();
		bean.setBeanName(beanName);
		bean.setOrigin(origin);
		bean.setBeanComm(beanComm);
		bean.setBeanInfo(beanInfo);
		bean.setBeanPrice(beanPrice);
		bean.setBusinessNo(businessNo);
		
		log.info("beanController : {}",bean);
		
//		service.insertBean(bean);
	}

	
	
	
}



























