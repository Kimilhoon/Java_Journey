package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
import web.dto.Member;
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
		public void freeBoardListForm(Model model,Paging curPage,String search,String category) {
			Paging paging = service.getFreeBoardPaging(curPage,search,category);
			List<FreeBoard> freeBoardList = service.getFreeBoardList(paging,search); 
			model.addAttribute("freeBoardList", freeBoardList);
			model.addAttribute("paging", paging);
			model.addAttribute("search", search);
			
		}
		@GetMapping("/freeboard/view")
		public void freeBoardView(Model model, FreeBoard freeBoard ) {
			freeBoard = service.getFreeBoardView(freeBoard);
			Member member = service.getMemberByFreeBoardNo(freeBoard);
			model.addAttribute("freeBoardView", freeBoard);
			model.addAttribute("member", member);
			
		}
		
		@GetMapping("/freeboard/write")
		public void freeBoardWriteForm() {}
		
		@PostMapping("/freeboard/write")
		public void freeBoardWriteProc() {
			//로그인 연동 되면 구현
		}
		
		@GetMapping("/freeboard/update")
		public void freeBoardUpdateForm(FreeBoard freeBoard, Model model) {
			freeBoard = service.getFreeBoardView(freeBoard);
			model.addAttribute("freeBoardView", freeBoard);
			Member member = service.getMemberByFreeBoardNo(freeBoard);
			model.addAttribute("member", member);
		}
		@PostMapping("/freeboard/update")
		public void freeBoardUpdateProc() {
			//로그인 연동 되면 구현
		}
		
		@GetMapping("/freeboard/delete")
		public void freeBoardDeleteForm() {}
		
		

	
	
	//--------------------------------------------------------------------------------------
	//이루니
	@GetMapping("/creview/list")
	public void cafeReviewForm(Model model, String order, String search) {}
	
	
	@PostMapping("/creview/list")
	public void cafeReviewForm(Model model, String category, String order, String search) {
		
		List<FreeBoard> creviewList = service.getCafeReviewList(category, order, search);
		
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




























