package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import web.dto.Cafe;
import web.service.face.CafeService;
import web.service.impl.CafeServiceImpl;
import web.util.Paging;

@Controller
@RequestMapping("/cafe")
@Slf4j
public class CafeController {
	
	@Autowired private CafeService service;
	
	@GetMapping("/best")
	public void BestCafeForm(Model model, Cafe cafe) {
		log.info("/cafe/best [GET]");
		
		//찜 추천 Best 3 카페 보여주기
		List<Cafe> BestCafeList = service.getBest();
		model.addAttribute("BestCafeList", BestCafeList);

		
	} // BestCafeForm() end

	@GetMapping("/all")
	public void AllCafeForm(Model model, Cafe cafe, 
			@RequestParam(name = "curPage", defaultValue = "1")int curPage) {
		log.info("/cafe/all [GET}");
		
		//전달파라미터 이용한 현재 페이징 객체 알아내기
		Paging paging = service.getPaging(curPage);
		//페이징 객체 Model값으로 전달
		model.addAttribute("paging", paging);
				
		//전체 페이지 조회
		List<Cafe> AllCafeList = service.getAllCafe();
		model.addAttribute("AllCafeList", AllCafeList);
		
	} // AllCafeForm() end
//
//	@GetMapping("/info")
//	public void CafeInfoForm(Cafe param) {
//		
//	} // CafeInfoForm(Cafe param) end
	
	
} // class end
