package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
import web.dto.BeanRev;
import web.dto.BeanSub;
import web.dto.BeanWish;
import web.dto.Member;
import web.service.face.BeanService;
import web.util.Paging;

@Controller
@RequestMapping("/bean")
@Slf4j
public class BeanController {
	
	@Autowired private BeanService service;
	
	@GetMapping("/best")
	public void BestBeanForm(Model model) {
		
		List<Bean> list = service.getBeanTop();
		
		log.info("listbean: {}", list);
		
		model.addAttribute("list", list);
		
		Bean count = service.getBeanCount();
		
		model.addAttribute("count", count);
		
	} // BestBeanForm() end
	
	// /bean/best
	// --------------------------------------------------------------------------------------

	@GetMapping("/all")
	public void AllBeanForm(Paging param, Model model, 
			@RequestParam(required = false) String cupnote, 
			@RequestParam(required = false) String keyword) {
//		log.info("cupnote: {}", cupnote);
//		log.info("keyword: {}", keyword);
		
		// 전달파라미터를 이용해서 현재 페이징 객체 알아내기
		Paging paging = service.getPaging( param, cupnote, keyword );
//		log.info("paging : {}",paging);
		
		List<Bean> list = service.getAllBean( paging, cupnote, keyword );
//		log.info("list: {}", list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("cupnote", cupnote);
		model.addAttribute("keyword", keyword);
		
		
	} // AllBeanForm() end
	
	// /bean/all
	// --------------------------------------------------------------------------------------
	
	@GetMapping("/info")
	public void BeanInfoForm(Bean param, Model model,
			@SessionAttribute(value = "userId", required = false) String userId) {
		log.info("param: {}", param);
		Bean beanInfo = service.getBeanInfo( param );
		
		log.info("beanInfo: {}", beanInfo);
		
		model.addAttribute("beanInfo", beanInfo);
		
		// 평균 별점 구하기
		BeanRev sp = service.getStarPoint(param);
//		log.info("sp: {}", sp);
		
		model.addAttribute("starPoint", sp);
		
		if (userId == null) {
	        // 세션에 userId가 없을 때 처리
	        log.warn("User is not logged in or session has expired.");
	        return;
	    } // if (userId == null) end
		
		Member userNo = service.selectUserNoByUserId(userId);
		log.info("userNo: {}", userNo.getUserNo());
		model.addAttribute("userNo", userNo.getUserNo());
		
		// 리뷰 보여주기
		List<BeanRev> list = service.selectAllRev(param);
		
		log.info("list: {}", list);
		
		model.addAttribute("list", list);
		
		boolean isWish = service.checkUserWish(beanInfo.getBeanNo(), userNo.getUserNo());
		model.addAttribute("isWish", isWish);
		
	} // BeanInfoForm(Bean param) end
	
	
	@PostMapping("/info")
	public ResponseEntity<?> BeanInfoFormProc(@RequestBody BeanWish beanWish) {
		
		log.info("beanNo: {}", beanWish.getBeanNo());
	    log.info("userNo: {}", beanWish.getUserNo());
	    log.info("action: {}", beanWish.getAction());

		
//		BeanWish bean = service.selectUserNoByUserId(userId);
		
//		log.info("bean: {}", bean);
		
//		service.insertWish(beanWish);
		
//		beanWish.setBeanNo(beanWish.getBeanNo());
//		beanWish.setUserNo(beanWish.getUserNo());
	    
	    Map<String, Integer> params = new HashMap<>();
	    params.put("beanNo", beanWish.getBeanNo());
	    params.put("userNo", beanWish.getUserNo());
	    
	    try {
	    
			if( "add".equals(beanWish.getAction()) ){
				service.addWish(params);
			} else if ("remove".equals(beanWish.getAction())) {
		        service.removeWish(params);
		    }
			
			// 응답 데이터 설정
	        Map<String, String> response = new HashMap<>();
	        response.put("status", "success");
	        response.put("message", beanWish.getAction().equals("add") ? "찜 상태가 추가되었습니다." : "찜 상태가 취소되었습니다.");

			
			return ResponseEntity.ok().body(response);
			
    		} catch (Exception e) {
    			// 예외 처리
    			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed");
		    
		}
		
	    
	} // BeanInfoFormProc end

	// /bean/info
	// --------------------------------------------------------------------------------------
	
	@GetMapping("/sub")
	   public void BeanSub(Bean param, 
	         @SessionAttribute(value = "userId", required = false) String userId, 
	         Model model) {
	       
	      // 원두 정보 불러오기
	      Bean bean = service.getBeanByBeanNo(param);
	      // 멤버 정보 불러오기
	      Member member = service.getMemberByUserId(userId);
	      
	      model.addAttribute("bean", bean);
	      model.addAttribute("member", member);
	      
	      // 랜덤 값 생성
	      String randomUUID = UUID.randomUUID().toString().split("-")[4];
	      model.addAttribute("randomUUID", randomUUID);
	       
	   } // BeanSub(Bean param, Model model) end

	@PostMapping("/sub/payment/complete")
	public String BeanSub(@RequestBody BeanSub beanSub) {
		
		log.info("BeanSub: {}", beanSub);
		
		service.beanSubscribe(beanSub);
		
		log.info("Redirecting to /bean/sub/succ after bean subscription.");
		
		return "/bean/sub/succ";
	} // BeanSub(@RequestBody BeanSub beanSub) end
	
	@GetMapping("/sub/succ")
	public String BeanSubSucc(BeanSub param, Model model) {
		
		BeanSub beanSub = new BeanSub();
		beanSub.setBeanNo(param.getBeanNo());
		beanSub.setBeanName(param.getBeanName());
		beanSub.setUserName(param.getUserName());
		
		
		
		model.addAttribute("beanSub", beanSub);
		
		log.info("beanSub: {}", beanSub);
		
		
		return "bean/sub/succ";
	} // BeanSubSucc() end
	
	@GetMapping("/sub/fail")
	public void BeanSubFail(Bean param, Model model) {
		
		Bean beanNo = new Bean();
		beanNo.setBeanNo(param.getBeanNo());
		
		model.addAttribute("bean", beanNo);
	}
	
	// /bean/sub
	// --------------------------------------------------------------------------------------
	
	// compare
	@GetMapping("/compare")
    public void getComparePage(Model model) {
		
        List<Bean> list = service.getBeanList();
        
        model.addAttribute("list", list);
        
    }
	
	@PostMapping("/compare")
	public ResponseEntity<Bean> getBeanDetails(@RequestBody Map<String, Integer> payload, Model model) {
	    int beanNo = payload.get("beanNo");

	    // Bean 객체 가져오기
	    Bean bean = service.getBeanInfoByBeanNo(beanNo);

	    // Bean 객체가 null이 아니라면 기본값을 설정
	    if (bean != null) {
	        setDefaultValues(bean);  // null인 필드에 기본값 설정
	        return ResponseEntity.ok(bean); // 성공적으로 Bean 객체 반환
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); // Bean을 찾지 못한 경우
	    }
	}

	// Bean 객체의 필드가 null일 경우 기본값을 설정하는 메소드
	private void setDefaultValues(Bean bean) {
	    if (bean.getBeanName() == null) {
	        bean.setBeanName("정보 없음");
	    }
	    if (bean.getOrigin() == null) {
	        bean.setOrigin("정보 없음");
	    }
	    if (bean.getBeanComm() == null) {
	        bean.setBeanComm("정보 없음");
	    }
	    if (bean.getBeanInfo() == null) {
	        bean.setBeanInfo("정보 없음");
	    }
	    if (bean.getBeanPrice() == 0) {
	        bean.setBeanPrice(-1);  // 기본값 설정 (가격이 없다면)
	    }
	    if (bean.getBeanStoredName() == null) {
	        bean.setBeanStoredName("정보 없음");
	    }
	    if (bean.getBeanOriginName() == null) {
	        bean.setBeanOriginName("정보 없음");
	    }
	    if (bean.getCupNoteName() == null || bean.getCupNoteName().length == 0) {
	        bean.setCupNoteName(new String[]{"정보 없음"});
	    }
	    if (bean.getRevStarPoint() == 0) {
	        bean.setRevStarPoint(-1);  // 기본값 설정
	    }
	    if (bean.getReviewCount() == 0) {
	        bean.setReviewCount(-1);  // 기본값 설정
	    }
	    if (bean.getAvgRevStarPoint() == 0.0) {
	        bean.setAvgRevStarPoint(0.0);  // 기본값 설정
	    }
	    if (bean.getGram() == 0) {
	        bean.setGram(-1);  // 기본값 설정
	    }
	    if (bean.getUserNo() == 0) {
	        bean.setUserNo(-1);  // 기본값 설정
	    }
	    if (bean.getUserId() == null) {
	        bean.setUserId("정보 없음");
	    }
	    if (bean.getUserNick() == null) {
	        bean.setUserNick("정보 없음");
	    }
	    if (bean.getUserEmail() == null) {
	        bean.setUserEmail("정보 없음");
	    }
	    if (bean.getUserName() == null) {
	        bean.setUserName("정보 없음");
	    }
	    if (bean.getUserPhone() == null) {
	        bean.setUserPhone("정보 없음");
	    }
	    if (bean.getUserPostcode() == null) {
	        bean.setUserPostcode("정보 없음");
	    }
	    if (bean.getUserAdd1() == null) {
	        bean.setUserAdd1("정보 없음");
	    }
	    if (bean.getUserAdd2() == null) {
	        bean.setUserAdd2("정보 없음");
	    }
	    if (bean.getCupNoteNo() == 0) {
	        bean.setCupNoteNo(-1);  // 기본값 설정
	    }
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class end
