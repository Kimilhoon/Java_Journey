package web.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

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
		public String freeBoardWriteProc(FreeBoard freeBoard,HttpSession session) {
			service.joinFreeBoard(freeBoard,session);
			
			return "redirect:./list";
		}
		
		@GetMapping("/freeboard/update")
		public void freeBoardUpdateForm(FreeBoard freeBoard, Model model) {
			freeBoard = service.getFreeBoardView(freeBoard);
			model.addAttribute("freeBoardView", freeBoard);
			Member member = service.getMemberByFreeBoardNo(freeBoard);
			model.addAttribute("member", member);
		}
		@PostMapping("/freeboard/update")
		public void freeBoardUpdateProc(FreeBoard freeBoard) {
			log.info("{}",freeBoard);
			service.changeFreeBoard(freeBoard);
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
		
		@GetMapping("freeboard/recommend")
		public void freeBoardRecommend(FreeBoard freeBoard, HttpSession session,HttpServletResponse resp) {
			boolean isRec = service.isFreeBoardRec(freeBoard,session);
			int recCount = service.getFreeBoardRecCount(freeBoard);
			
			Gson gson = new Gson();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("isRec", isRec);
			map.put("recCount", recCount);
			try {
				resp.getWriter().append(gson.toJson(map));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		@GetMapping("/freeboard/reccheck")
		public void freeBoardRecCheck(FreeBoard freeBoard, HttpSession session,HttpServletResponse resp) {
			boolean isRec = service.isFreeBoardRecCheck(freeBoard,session);
			int recCount = service.getFreeBoardRecCount(freeBoard);
			
			Gson gson = new Gson();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("isRec", isRec);
			map.put("recCount", recCount);
			try {
				resp.getWriter().append(gson.toJson(map));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
	
	//--------------------------------------------------------------------------------------
	//이루니
	
	@GetMapping("/creview/list")
	public void cafeReviewForm(Model model, String category, String order, String search, Paging curPage) {
		
		Paging paging = service.getCafeReviewPaging(curPage, category, order, search);
		
		List<CafeRev> creviewList = service.getCafeReviewList(category, order, search, paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("creviewList", creviewList);
		
	}
	
	@GetMapping("/creview/view")
	public void cafeReviewView(Model model, HttpSession session, CafeRev revNo) {
		
		//댓글 리스트
		List<CafeRevComm> crevcommList = service.getCafeReviewCommentList(revNo);
		
//		log.info("revNo: {}", revNo);
		
		//카페 상세 정보
		CafeRev cafeRev = service.getCafeReviewInfo(revNo);
		
		//로그인한 유저id
		String userId = (String) session.getAttribute("userId");	
		
		//작성한 유저id
		String writerId = service.getWriterId(cafeRev);
		
		//로그인한 유저의 사업자번호
		String userBN = service.getBusinessNoFromMember(userId);
		
		//해당 리뷰의 해당하는 카페의 사업자번호
		String cafeBN = service.getBusinessNoFromCafeReviewNo(revNo);
		
		//로그인한 유저와 카페의 사업자번호가 일치하면 소유자 트루, 아님 폴스 반환
		if( userBN == cafeBN ) {
			model.addAttribute("isOwner", true);
		} else {
			model.addAttribute("isOwner", false);
		}
//		log.info("cafeRev: {}", cafeRev);
		
		model.addAttribute("crevcommList", crevcommList);
		model.addAttribute("cafeRev", cafeRev);
		model.addAttribute("userId", userId);
		model.addAttribute("writerId", writerId);
		
	}
	
	@RequestMapping("/creview/comm")
	public String cafeReviewComm(Model model, CafeRev revNo, CafeRevComm cafeCommCont, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		
		service.writeCafeReviewComm(revNo, cafeCommCont, userId);
		
		return "redirect: ./view?revNo=" + revNo.getRevNo();
	}
	
	@GetMapping("/creview/write")
	public void cafeReviewWrite(Model model, Cafe cafeNo) {
		
		String cafeName = service.getCafeName(cafeNo);
		
		model.addAttribute("cafeName", cafeName);
		model.addAttribute("cafeNo", cafeNo);
		
	}
	
	@PostMapping("/creview/write")
	public String cafeReviewWriteProc(CafeRev cafeRev, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		int userNo = service.getUserNo(userId);
		cafeRev.setUserNo(userNo);
		service.joinCafeReview(cafeRev);
		
		return "redirect: ./list";
	}
	
	@RequestMapping("/creview/delete")
	public String cafeReviewDelete(CafeRev cafeRev) {
		
		service.dropCafeReview(cafeRev);
			
		return "redirect: ./list";
	}
	
	@GetMapping("/creview/update")
	public void cafeReviewUpdate(Model model, CafeRev cafeNo) {
		CafeRev cafeRev = service.getCafeReviewInfo(cafeNo);
		
		model.addAttribute("cafeRev", cafeRev);
	}
	
	@PostMapping("/creview/update")
	public String cafeReviewUpdateProc(CafeRev cafeRev) {
		log.info("dddd{}",cafeRev);
		service.changeCafeReview(cafeRev);
		
		return "redirect: ./view?revNo=" + cafeRev.getRevNo();
	}

	
}



























