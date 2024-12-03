package web.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import web.dto.BeanSub;
import web.dto.Member;
import web.manager.service.face.ManagerService;
import web.util.Paging;

@Controller
@RequestMapping("/manager")
@Slf4j
public class ManagerController {
//	
	@Autowired private ManagerService service;
	
	@GetMapping("/menu")
	public void menuForm(
			) {
	}
	
	@GetMapping("/user")
	public void userForm(
			HttpServletRequest req,
			Model model,
			String search
			) {
		log.info("req : {}", req);
		log.info("search : {}", search);
		Paging paging = service.getPaging(req, search);
		
//		List<Member> memberList = service.selectAll(paging); //모두검색
		
	    List<Member> memberList;
	    if (search != null && !search.trim().isEmpty()) {
	        // 검색어가 있을 경우
	        memberList = service.searchByUserNick(search, paging);
	    } else {
	        // 검색어가 없을 경우
	        memberList = service.selectAll(paging);
	    }
		
		log.info("memberList: {}",memberList);
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("paging",paging);
		model.addAttribute("search", search);
	}
	
	@GetMapping("/usercancel")
	@ResponseBody
	public Map<String, Object> userCancelProcAjax(
			@RequestParam("userNo") List<Integer> userNo
			) {
		Map<String, Object> result = new HashMap<>();
		
		log.info("userNo : {}", userNo);
		boolean isCanceled = service.userCancelByUserNo(userNo);
		
		if( isCanceled ) {
			result.put("status", "success");
			result.put("message", "사용자가 성공적으로 비활성화(삭제)되었습니다");
			result.put("redirectUrl", "/manager/user");
		} else {
			result.put("status", "fail");
			result.put("message", "사용자는 이미 비활성화 상태입니다");
		}
		return result;
	}
	
	@GetMapping("/userrevive")
	@ResponseBody
	public Map<String, Object> userReviveProcAjax(
			@RequestParam("userNo") List<Integer> userNo
			){
		Map<String, Object> result = new HashMap<>();
		log.info("userNo : {}", userNo);
		boolean isRevived = service.userReviveByUserNo(userNo);

		if( isRevived ) {
			result.put("status", "success");
			result.put("message", "사용자가 성공적으로 활성화되었습니다");
			result.put("redirectUrl", "/manager/user");
		} else {
			result.put("status", "fail");
			result.put("message", "사용자는 이미 활성화 상태입니다");
		}
		return result;
		
	}
	
	@GetMapping("/subuser")
	public void subuserFoem(
			HttpServletRequest req,
			Model model,
			BeanSub beanSub,
			String search
			) {
		log.info("req : {}", req);
		Paging paging = service.getBeanSubPaging(req, search);
		
//		List<BeanSub> beanSubList = service.selectBeanSubAll(paging);
		
	    List<BeanSub> beanSubList;
	    if (search != null && !search.trim().isEmpty()) {
	        // 검색어가 있을 경우
	    	beanSubList = service.searchsubuserByUserNick(search, paging);
	    } else {
	        // 검색어가 없을 경우
	    	beanSubList = service.selectBeanSubAll(paging);
	    }
		
		log.info("beanSubList: {}",beanSubList);
		
		model.addAttribute("beanSubList",beanSubList);
		model.addAttribute("paging",paging);
		model.addAttribute("search", search);
		
	}
	
	@GetMapping("/subcancel")
	@ResponseBody
	public Map<String, Object> subCancelProcAjax(
		@RequestParam("subNo") List<Integer> subNo,
		@RequestParam("btnValue") String btnValue
			) {
		log.info("subNo : {}", subNo);
		log.info("btnValue : {}", btnValue);
		Map<String, Object> result = new HashMap<>();
		
		if( btnValue.equals("cancel") ) {
			log.info("cancel : {}", btnValue);
		boolean isSubCancel = service.subCancelBySubNo(subNo);
		if( isSubCancel ) {
			result.put("status", "success");
			result.put("message", "구독을 취소/원복 하였습니다");
		} else {
			result.put("status", "fail");
			result.put("message", "알수 없는 이유로 작업이 취소되었습니다");
		}
		
	  }// if btnValue.equals("cancel") End
		
		return result;
  }
}