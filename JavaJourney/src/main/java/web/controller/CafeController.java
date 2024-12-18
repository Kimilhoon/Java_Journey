package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
		if (cafeInfo == null) {
			log.error("cafeInfo가 null입니다. 잘못된 cafeNo: {}", cafe.getCafeNo());
			return;
		}
		
		//조회한 카페 정보를 모델에 추가
		model.addAttribute("cafeInfo", cafeInfo);
		
		// 평균 별점 구하기
		CafeRev sp = service.getStarPoint(cafe);
		if (sp == null) {
//			log.warn("별점 정보가 없습니다. cafeNo: {}", cafe.getCafeNo());
		}
//		log.info("sp: {}", sp);
		model.addAttribute("starPoint", sp);
		
		//로그인 여부 확인하기
		if (userId == null) {
			//로그인하지 않은 경우
			log.warn("로그인되지 않았습니다.");
			model.addAttribute("userNo", null); // 로그인하지 않은 경우 userNo를 null로 설정
			model.addAttribute("isWish", false); // 비회원은 찜하기 상태를 false로 설정
		} else {
	        // 로그인한 경우 사용자 번호 조회 및 추가
	        Member userNo = service.selectUserNoByUserId(userId);
	        if(userNo != null) {
	        	model.addAttribute("userNo", userNo.getUserNo());
	        	
	        	//현재 카페에 대한 찜 상태 조회
	        	boolean isWish = service.checkUserWish(cafeInfo.getCafeNo(), userNo.getUserNo());
	        	model.addAttribute("isWish", isWish);
	        } else {
	        	log.warn("userId에 해당하는 사용자 번호를 찾을 수 없습니다. userId: {}", userId);
	        	model.addAttribute("userNo", null);
	            model.addAttribute("isWish", false); // 사용자 정보를 찾지 못한 경우도 찜 상태를 false로 설정
	        }
	    } // if (userId == null) end
		
		// 리뷰 보여주기
		List<CafeRev> list = service.selectAllRev(cafe);
		
		//리스트가 비어있는지 확인
		if (list == null || list.isEmpty()) {
	        log.warn("리뷰 목록이 비어 있습니다. cafeNo: {}", cafe.getCafeNo());
	    } else {
			//태그 제거 처리 추가
	    	for (CafeRev review : list) {
	    		review.setRevContent(stripHtmlTags(review.getRevContent())); // HTML 태그 제거
	    	}
		}
		//모델에 추가
		model.addAttribute("list", list);
		

		//주소 정보 추가
		String savedAddress = cafeInfo.getCafeAdd1(); // 카페 주소
		if (savedAddress == null || savedAddress.isEmpty()) {
	        log.warn("주소 정보가 비어 있습니다. cafeNo: {}", cafe.getCafeNo());
	    }
	    model.addAttribute("savedAddress", savedAddress);

	    log.info("Saved Address: {}", savedAddress);
		
	} // CafeInfoForm(Cafe) end
	
	private String stripHtmlTags(String revContent) {
		if (revContent == null) return "";
		return revContent.replaceAll("<[^>]*>", "").replaceAll("&[^;]+;", ""); // HTML 태그와 특수 문자 제거;
	}

	@PostMapping("/info")
	public ResponseEntity<?> CafeInfoFormProc(@RequestBody CafeWish cafeWish) {

		log.info("cafeNo: {}", cafeWish.getCafeNo());
		log.info("userNo: {}", cafeWish.getUserNo());
		log.info("action: {}", cafeWish.getAction());
		
		Map<String, Integer> params = new HashMap<>();
	    params.put("cafeNo", cafeWish.getCafeNo());
	    params.put("userNo", cafeWish.getUserNo());
	    
	    try {
			if( "add".equals(cafeWish.getAction()) ){
				service.addWish(params);
			} else if ("remove".equals(cafeWish.getAction())) {
		        service.removeWish(params);
		    }
			
			// 응답 데이터 설정
	        Map<String, String> response = new HashMap<>();
	        response.put("status", "success");
	        response.put("message", cafeWish.getAction().equals("add") ? "찜 상태가 추가되었습니다." : "찜 상태가 취소되었습니다.");
	        
	        return ResponseEntity.ok().body(response);
	        
	    	} catch (Exception e) {
				// 예외 처리
		    	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed");
	    	}
	} // CafeInfoFormProc End
	
} // class end
