package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.service.face.CafeService;
import web.service.impl.CafeServiceImpl;

@Controller
@RequestMapping("/cafe")
@Slf4j
public class CafeController {
	
	@Autowired private CafeService service = new CafeServiceImpl();
	
	@GetMapping("/best")
	public void BestCafeForm() {
		
	} // BestCafeForm() end

	@GetMapping("/all")
	public void AllCafeForm() {
		
	} // AllCafeForm() end

//	@GetMapping("/info")
//	public void CafeInfoForm(Cafe param) {
//		
//	} // CafeInfoForm(Cafe param) end
	
	
} // class end
