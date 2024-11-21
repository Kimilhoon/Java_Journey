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
		
//		// location이 빈 문자열인 경우 null로 변환
//	    if (location != null && location.trim().isEmpty()) {
//	        location = null;
//	    }
		
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
//		model.addAttribute("location", String.valueOf(location)); // 문자열로 변환
//		model.addAttribute("keyword", String.valueOf(keyword));   // 문자열로 변환
		
		log.info("AllCafeForm 호출 성공");
	} // AllCafeForm() end
	
	
	@GetMapping("/info")
	public void CafeInfoForm(Cafe cafe, Model model,
			@SessionAttribute(value = "userId", required = false) String userId) {
		log.info("/cafe/info [GET]");
		
		//서비스에서 카페 상세 정보를 조회
		Cafe cafeInfo = service.getCafeInfo(cafe);
		if (cafeInfo == null) {
			log.error("cafeInfo가 null입니다. 잘못된 cafeNo: {}", cafe.getCafeNo());
			return;
		}
		
		//조회한 카페 정보를 모델에 추가
		model.addAttribute("cafeInfo", cafeInfo);
		
		// 평균 별점 구하기
		CafeRev sp = service.getStarPoint(cafe);
		if (sp == null) {
			log.warn("별점 정보가 없습니다. cafeNo: {}", cafe.getCafeNo());
		}
//		log.info("sp: {}", sp);
		model.addAttribute("starPoint", sp);
		
		//로그인 여부 확인하기
		if (userId == null) {
			//로그인하지 않은 경우
			log.warn("로그인되지 않았습니다.");
			model.addAttribute("userNo", null); // 로그인하지 않은 경우 userNo를 null로 설정
		} else {
	        // 로그인한 경우 사용자 번호 조회 및 추가
	        Member userNo = service.selectUserNoByUserId(userId);
	        if(userNo != null) {
	        	model.addAttribute("userNo", userNo.getUserNo());
	        } else {
	        	log.warn("userId에 해당하는 사용자 번호를 찾을 수 없습니다. userId: {}", userId);
	        }
	    } // if (userId == null) end
		
//		log.info("userNo: {}", userNo.getUserNo());
		
		// 리뷰 보여주기
		List<CafeRev> list = service.selectAllRev(cafe);
		if (list == null || list.isEmpty()) {
	        log.warn("리뷰 목록이 비어 있습니다. cafeNo: {}", cafe.getCafeNo());
	    }
		
		log.info("list: {}", list);
		
		model.addAttribute("list", list);

		//주소 정보 추가
		String savedAddress = cafeInfo.getCafeAdd1(); // 카페 주소
		if (savedAddress == null || savedAddress.isEmpty()) {
	        log.warn("주소 정보가 비어 있습니다. cafeNo: {}", cafe.getCafeNo());
	    }
	    model.addAttribute("savedAddress", savedAddress);

	    log.info("Saved Address: {}", savedAddress);
		
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
