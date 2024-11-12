package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public void AllCafeForm(Model model, Cafe cafe, Paging param,
			@RequestParam(required =false) String location, 
			@RequestParam(required =false) String keyword) {
		log.info("/cafe/all [GET}");
		log.info("keyword: {}", location);
		log.info("keyword: {}", keyword);
		
		//전달파라미터 이용한 현재 페이징 객체 알아내기
		Paging paging = service.getPaging(param, location, keyword);
		log.info("paging : {}",paging);
//		//페이징 객체 Model값으로 전달
//		model.addAttribute("paging", paging);
				
		//전체 페이지 조회
		List<Cafe> AllCafeList = service.getAllCafe(paging, location, keyword);
		//전체 페이지 모델값으로 전달
		model.addAttribute("AllCafeList", AllCafeList);
		model.addAttribute("paging", paging);
		model.addAttribute("cupnote", location);
		model.addAttribute("keyword", keyword);
		
	} // AllCafeForm() end
	
	
	@GetMapping("/info")
	public void CafeInfoForm(Cafe cafe, Model model) {
		log.info("/cafe/info [GET]");
		
		//서비스에서 카페 상세 정보를 조회
		Cafe cafeInfo = service.getCafeInfo(cafe);
		
		//조회한 카페 정보를 모델에 추가
		model.addAttribute("cafeInfo", cafeInfo);
		
	} // CafeInfoForm(Cafe param) end
	
	@PostMapping("/info")
	public void CafeInfoFormProc(int cafeNo, int userNo) {
		log.info("cafeNo: {}", cafeNo);
		log.info("userNo: {}", userNo);
	}
	
	
} // class end
