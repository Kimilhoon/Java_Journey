package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.service.face.MypageService;
import web.service.impl.MypageServiceImpl;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MypageController {
	
	private MypageService service = new MypageServiceImpl();
	
}
