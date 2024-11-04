package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.service.face.MemberService;
import web.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/Member")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service = new MemberServiceImpl();
	
}
