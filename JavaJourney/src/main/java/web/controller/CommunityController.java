package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.service.face.CommunityService;
import web.service.impl.CommunityServiceImpl;

@Controller
@RequestMapping("/comm")
@Slf4j
public class CommunityController {
	
	private CommunityService service = new CommunityServiceImpl();
	
}
