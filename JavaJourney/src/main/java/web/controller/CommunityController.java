package web.controller;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
			Bean bean
			) {
		
		log.info("bena : {}", bean);
		System.out.println("이미지 크기: " + bean.getBeanInfo());
		service.insertBean(bean);
	}

	
}



























