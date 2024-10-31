package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CHTestController {

	@RequestMapping("/test/hello")
	public void hello() {
		log.info("hello");
	}
	
}
