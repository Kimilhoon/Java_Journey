package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
import web.dto.FreeBoardComment;
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
			List<FreeBoard> freeBoardList = service.getFreeBoardList(paging,search,category);
			
			
			model.addAttribute("freeBoardList", freeBoardList);
			model.addAttribute("paging", paging);
			model.addAttribute("search", search);
			model.addAttribute("category", category);
			
			
			
		}
		@GetMapping("/freeboard/view")
		public void freeBoardView(Model model, FreeBoard freeBoard, HttpSession session) {
			freeBoard = service.getFreeBoardView(freeBoard);
			Member member = service.getMemberByFreeBoardNo(freeBoard);
			model.addAttribute("freeBoardView", freeBoard);
			model.addAttribute("member", member);
			
			List<FreeBoardComment> cList = service.getFreeBoardCommentList(freeBoard);
			model.addAttribute("freeBoardCommentList", cList);
			session.setAttribute("info", "tmpNick");
			
			
			
			
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
		public String freeBoardDeleteForm(FreeBoard freeBoard) {
			service.dropFreeBoard(freeBoard);
			return "redirect:./list";
		}
		
		@GetMapping("/freeboard/hit")
		public void freeBoardHit(FreeBoard freeBoard) {
			log.info("{}",freeBoard.getFreeBoardNo());
			service.freeBoardHitUp(freeBoard);
		}
		
		
		@GetMapping("/freeboard/commentinsert")
		public void freeBoardCommentInsert(FreeBoard freeBoard,FreeBoardComment freeBoardComment, HttpSession session) {
			service.joinFreeBoardComment(freeBoard,freeBoardComment,session);
			
		}
		
		@GetMapping("/freeboard/commentdelete")
		public void freeBoardCommentDelete(FreeBoardComment freeBoardComment) {
			service.dropFreeBoardComment(freeBoardComment);
		}

	
	//--------------------------------------------------------------------------------------
	//이루니
	
	
	@GetMapping("/creview/list")
	public void cafeReviewForm(Model model, String category, String order, String search, Paging paging) {
		
		List<CafeRev> creviewList = service.getCafeReviewList(category, order, search, paging);
		
		model.addAttribute("creviewList", creviewList);
		
	}
	
	@GetMapping("/creview/view")
	public void cafeReviewView(Model model, CafeRev revNo) {
		
		List<CafeRevComm> crevcommList = service.getCafeReviewCommentList(revNo);
		
		CafeRev cafeRev = service.getCafeReviewInfo(revNo);
		
		model.addAttribute("crevcommList", crevcommList);
		model.addAttribute("cafeRev", cafeRev);
		
	}
	
	@GetMapping("/creview/write")
	public void cafeReviewWrite(Model model, Cafe cafeNo) {
		
		String cafeName = service.getCafeName(cafeNo);
		
		model.addAttribute("cafeName", cafeName);
		
	}
	
	@PostMapping("/creview/write")
	public String cafeReviewWriteProc(CafeRev cafeRev, HttpSession session) {
		
		String userId = (String) session.getAttribute("memberid");
		int userNo = service.getUserNo(userId);
		cafeRev.setUserNo(userNo);
		service.joinCafeReview(cafeRev);
		
		return "redirect: ./list";
	}
	
	
	
	
}




























