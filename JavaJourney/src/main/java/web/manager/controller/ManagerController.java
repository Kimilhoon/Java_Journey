package web.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.manager.service.face.ManagerService;
import web.manager.service.impl.ManagerServiceImpl;

@Controller
@RequestMapping("/manager")
@Slf4j
public class ManagerController {
	
	private ManagerService service = new ManagerServiceImpl();
	
}
