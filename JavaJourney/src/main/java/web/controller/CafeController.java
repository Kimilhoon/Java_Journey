package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.extern.slf4j.Slf4j;
import web.dto.BeanRev;
import web.dto.BeanWish;
import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.Member;
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
		
		Cafe count = service.getCafeCount();
		model.addAttribute("count", count);
		
	} // BestCafeForm() end

	@GetMapping("/all")
	public void AllCafeForm(Model model, Cafe cafe, Paging param,
			@RequestParam(required =false) String location, 
			@RequestParam(required =false) String keyword) {
		log.info("/cafe/all [GET}");
		log.info("location: {}", location);
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
		model.addAttribute("location", location);
		model.addAttribute("keyword", keyword);
		
		log.info("AllCafeForm 호출 성공");
	} // AllCafeForm() end
	
	
	@GetMapping("/info")
	public void CafeInfoForm(Cafe cafe, Model model,
			@SessionAttribute(value = "userId", required = false) String userId) {
		log.info("/cafe/info [GET]");
		
		//서비스에서 카페 상세 정보를 조회
		Cafe cafeInfo = service.getCafeInfo(cafe);
		
		//조회한 카페 정보를 모델에 추가
		model.addAttribute("cafeInfo", cafeInfo);
		
		// 평균 별점 구하기
		CafeRev sp = service.getStarPoint(cafe);
//		log.info("sp: {}", sp);
		
		model.addAttribute("starPoint", sp);
		
		if (userId == null) {
	        // 세션에 userId가 없을 때 처리
	        log.warn("User is not logged in or session has expired.");
	        return;
	    } // if (userId == null) end
		
		Member userNo = service.selectUserNoByUserId(userId);
//		log.info("userNo: {}", userNo.getUserNo());
		model.addAttribute("userNo", userNo.getUserNo());
		
		// 리뷰 보여주기
		List<CafeRev> list = service.selectAllRev(cafe);
		
		log.info("list: {}", list);
		
		model.addAttribute("list", list);
		
	} // CafeInfoForm(Cafe) end
	
	@PostMapping("/info")
	public void CafeInfoFormProc(@RequestBody CafeWish cafeWish) {
		log.info("cafeNo: {}", cafeWish.getCafeNo());
		log.info("userNo: {}", cafeWish.getUserNo());
		log.info("action: {}", cafeWish.getAction());
		
		Map<String, Integer> params = new HashMap<>();
	    params.put("cafeNo", cafeWish.getCafeNo());
	    params.put("userNo", cafeWish.getUserNo());
	    
		if( "add".equals(cafeWish.getAction()) ){
			service.addWish(params);
		} else if ("remove".equals(cafeWish.getAction())) {
	        service.removeWish(params);
	    }
		
	}
	
	
} // class end
