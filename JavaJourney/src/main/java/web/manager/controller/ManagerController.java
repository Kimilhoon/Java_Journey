package web.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public void menuForm() {}
	
	@GetMapping("/user")
	public void userForm(
			HttpServletRequest req,
			Model model
			) {
		log.info("req : {}", req);
		Paging paging = service.getPaging(req);
		
		List<Member> memberList = service.selectAll(paging);
		log.info("memberList: {}",memberList);
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("paging",paging);
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
			result.put("message", "사용자가 성공적으로 삭제되었습니다");
		} else {
			result.put("status", "fail");
			result.put("message", "구독 번호가 존재하여 삭제가 중단되었습니다");
		}
		return result;
	}
	
	@GetMapping("/subuser")
	public void subuserFoem(
			HttpServletRequest req,
			Model model,
			BeanSub beanSub
			) {
		log.info("req : {}", req);
		Paging paging = service.getBeanSubPaging(req);
		
		List<BeanSub> beanSubList = service.selectBeanSubAll(paging);
		log.info("beanSubList: {}",beanSubList);
		
		model.addAttribute("beanSubList",beanSubList);
		model.addAttribute("paging",paging);
	}
	
}
