package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import web.dto.Bean;
import web.dto.BeanRev;
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
	public void BeanInfoFormProc(
				@RequestBody BeanWish beanWish
				) {
		
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

	
	
	// /bean/sub
	// --------------------------------------------------------------------------------------
	
} // class end
