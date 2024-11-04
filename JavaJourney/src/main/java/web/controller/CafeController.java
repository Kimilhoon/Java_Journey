package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.service.face.CafeService;
import web.service.impl.CafeServiceImpl;

@Controller
@RequestMapping("/cafe")
@Slf4j
public class CafeController {
	
	private CafeService service = new CafeServiceImpl();
	
}
