package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
import web.service.face.CommunityService;
import web.util.Paging;

@Controller
@RequestMapping("/comm")
@Slf4j
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	//--------------------------------------------------------------------------------------
	//동쥬니
	
	@GetMapping("/freeboard/list")
	public void freeBoardForm() {
		List<FreeBoard> freeBoardList = service.getFreeBoardList(); 
		
	}
	
	@GetMapping("/myrecipe")
	public void mr() {}
	
	//--------------------------------------------------------------------------------------
	//이루니
	
	@GetMapping("/creview/list")
	public void cafeReviewForm(Model model, String category, String order, String search, Paging paging) {
		
		List<FreeBoard> creviewList = service.getCafeReviewList(category, order, search, paging);
		
		model.addAttribute("creviewList", creviewList);
		
	}
	
	@GetMapping("/creview/view")
	public void cafeReviewView(Model model, CafeRev revNo) {
		
		List<CafeRevComm> crevcommList = service.getCafeReviewCommentList(revNo);
		
		CafeRev cafeRev = service.getCafeReviewInfo(revNo);
		
		model.addAttribute("crevcommList", crevcommList);
		model.addAttribute("cafeRev", cafeRev);
		
	}
	
	
	
	
	
}




























