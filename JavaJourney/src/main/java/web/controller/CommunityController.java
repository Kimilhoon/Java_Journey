package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
			Bean bean
			) {
		log.info("bena : {}", bean);// 파일용량이 작을수록 데이터가 넘어오는게 확인 가능
		service.insertBean(bean);
	}

	
}



























