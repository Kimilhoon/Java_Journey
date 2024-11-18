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
		
	} // BeanInfoForm(Bean param) end
	
	
	@PostMapping("/info")
	public void BeanInfoFormProc(@RequestBody BeanWish beanWish) {
		
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
	    
		if( "add".equals(beanWish.getAction()) ){
			service.addWish(params);
		} else if ("remove".equals(beanWish.getAction())) {
	        service.removeWish(params);
	    }
		
	    
	} // BeanInfoFormProc end

	// /bean/info
	// --------------------------------------------------------------------------------------
	
	@GetMapping("/sub")
	public void BeanSub(Bean bean, 
			@SessionAttribute(value = "userId", required = false) String userId, 
			Model model) {
	    
		log.info("bean: {}", bean);
		log.info("userId: {}", userId);
//		Bean bean = service.getBeanInfo(param);

//		Map<String, Object> params = new HashMap<String, Object>();
//	    
//		params.put("beanNo", param.getBeanNo());
//		params.put("userId", userId);
//	    
//		List<Map<String, Object>> member = service.getBeanMember(params);
//		
//		// 각 Map에서 userNo 값을 int로 변환
//		for (Map<String, Object> memberMap : member) {
//		    Object userNoObject = memberMap.get("USERNO");
//
//		    // userNo가 BigDecimal 또는 String일 경우 변환
//		    if (userNoObject instanceof BigDecimal) {
//		        memberMap.put("userNo", ((BigDecimal) userNoObject).intValue());
//		    } else if (userNoObject instanceof String) {
//		        try {
//		            memberMap.put("userNo", Integer.parseInt((String) userNoObject));
//		        } catch (NumberFormatException e) {
//		            log.error("userNo 값이 숫자가 아닙니다: " + userNoObject);
//		        }
//		    }
//		}
//		
//		log.info("member: {}", member);
//	    
//		model.addAttribute("bean", bean);
//		model.addAttribute("member", member);
//	    
//		String randomUUID = UUID.randomUUID().toString();
//		model.addAttribute("randomUUID", randomUUID);
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
		
		return "redirect:/bean/sub/succ";
	} // BeanSub(@RequestBody BeanSub beanSub) end
	
	@GetMapping("/sub/succ")
	public void BeanSubSucc() {
		
	}
	
	@GetMapping("/sub/fail")
	public void BeanSubFail(Bean param, Model model) {
		
		Bean beanNo = new Bean();
		beanNo.setBeanNo(param.getBeanNo());
		
		model.addAttribute("bean", beanNo);
	}
	
	// /bean/sub
	// --------------------------------------------------------------------------------------
	
} // class end
