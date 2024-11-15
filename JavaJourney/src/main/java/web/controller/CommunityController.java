package web.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;
import web.dto.Bean;
import web.dto.BeanRev;
import web.dto.BeanRevComm;
import web.dto.BeanSub;
import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.CupNote;
import web.dto.Event;
import web.dto.Extraction;
import web.dto.FreeBoard;
import web.dto.FreeBoardComment;
import web.dto.Grind;
import web.dto.Member;
import web.dto.MyRecipe;
import web.dto.MyRecipeComment;
import web.dto.MyRecipeFile;
import web.dto.Notice;
import web.dto.QuizResult;
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
		public void freeBoardCommentInsert(FreeBoardComment freeBoardComment, HttpSession session) {
			service.joinFreeBoardComment(freeBoardComment,session);
			
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
		
		@PostMapping("/freeboard/commentupdate")
		public String freeBoardCommentUpdate(FreeBoardComment freeBoardComment) {
			
			service.changeFreeBoardComment(freeBoardComment);
			
			return "redirect: ./view?freeBoardNo="+freeBoardComment.getFreeBoardNo();

		}
		
		// 공지사항 --------------------------------------------------------------------------
		@GetMapping("/notice/list")
		public void noticeList(Model model,Paging curPage,String search) {
			Paging paging = service.getNoticePaging(curPage,search);
			List<Notice> noticeList = service.getNoticeList(paging,search);
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("paging", paging);
			model.addAttribute("search", search);
			
			
		}
		
		@GetMapping("/notice/view")
		public void noticeView(Notice notice,Model model) {
			notice = service.getNotice(notice);
			model.addAttribute("notice",notice);
			
		}
		// FAQ --------------------------------------------------------------------------
		@GetMapping("/faq/list")
		public void fatList() {}
		
		// 나만의 레시피 --------------------------------------------------------------------------
		
		@GetMapping("/myrecipe/list")
		public void myrecipe(Paging curPage, String search,Model model) {
			Paging paging = service.getMyRecipePaging(curPage,search);
			List<MyRecipe> myRecipeList = service.getMyRecipeList(paging,search);
			model.addAttribute("myRecipeList", myRecipeList);
			model.addAttribute("paging", paging);
			model.addAttribute("search", search);
			
		}
		
		@GetMapping("/myrecipe/write")
		public void myRecipeForm(MyRecipe myRecipe,HttpSession session,Model model) {
			Member member = service.getMemberByUserId((String)session.getAttribute("userId"));
			log.info("{}",member);
			List<List<QuizResult>> list = service.getQuizResultByUserNo(member);
			List<CupNote> clist = service.getCupNoteNameList();
			List<Grind> glist = service.getGrindList();
			List<Extraction> elist = service.getExtractionList();
			List<Bean> blist = service.getBeanList();
			
			model.addAttribute("qList", list);
			model.addAttribute("cList", clist);
			model.addAttribute("gList", glist);
			model.addAttribute("eList", elist);
			model.addAttribute("bList", blist);
			
		}
		
		@PostMapping("/myrecipe/write")
		public String writeProc(HttpSession session, MyRecipe myRecipe, MultipartFile file) {
			log.info("{}",myRecipe);
			service.uploadMyRecipe(session,myRecipe,file);
			
			return"redirect:./list";
		}
		
		@GetMapping("/myrecipe/view")
		public void myRipView(MyRecipe myRecipe, Model model,HttpSession session) {
			MyRecipe myRecipeView = service.getMyRecipeInfo(myRecipe);
			model.addAttribute("myRecipeView", myRecipeView);
			Member member = service.getMemberByUserNo(myRecipeView);
			model.addAttribute("member", member);
			List<MyRecipeComment> commentList = service.getMyRecipeCommentList(myRecipe);
			model.addAttribute("myRecipeCommentList", commentList);
		}
		
		@GetMapping("/myrecipe/hit")
		public void myRecipeHit(MyRecipe myRecipe) {
			service.myRrcipeHitUp(myRecipe);
		}
		
		@GetMapping("myrecipe/update")
		public void myRecipeUpdate(MyRecipe myRecipe, Model model,HttpSession session) {
			Member member = service.getMemberByUserId((String)session.getAttribute("userId"));
			log.info("{}",member);
			List<List<QuizResult>> list = service.getQuizResultByUserNo(member);
			List<CupNote> clist = service.getCupNoteNameList();
			
			model.addAttribute("qList", list);
			model.addAttribute("cList", clist);
			MyRecipe myRecipeView = service.getMyRecipeInfo(myRecipe);
			model.addAttribute("myRecipeView", myRecipeView);
		}
		
		@PostMapping("/myrecipe/update")
		public String myRecipeUpdateProc(  MyRecipe myRecipe, MultipartFile file) {
			log.info("레시피레시피레시피레시피{}",myRecipe);
			service.changeMyRecipe(myRecipe,file);
			return "redirect:./view?myRipNo="+myRecipe.getMyRipNo();
		}
		
		@GetMapping("/myrecipe/download")
		public String myRecipeFileDownload(MyRecipe myRecipe, Model model) {
			MyRecipeFile myRecipeFile = service.getMyRecipeFile(myRecipe);
			
			model.addAttribute("myRecipeFileDownload", myRecipeFile);
			
			return "downView";
		}
		
		@GetMapping("/myrecipe/getcupnote")
		public void getCup(Bean bean,HttpServletResponse resp) {
			List<CupNote> cupList = service.getCupList(bean);
			Gson gson = new Gson();
			HashMap<String, List<CupNote>> map = new HashMap<String, List<CupNote>>();
			map.put("cupList", cupList);
			resp.setCharacterEncoding("utf-8");
			try {
				resp.getWriter().append(gson.toJson(map));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		@GetMapping("/myrecipe/commentinsert")
		public void myRecipeCommentInsert(MyRecipeComment myRecipeComment,HttpSession session) {
			service.joinMyRecipeComment(myRecipeComment,session);
		}
		
		@GetMapping("/myrecipe/commentdelete")
		public void myRecipeCommentDelete(MyRecipeComment myRecipeComment) {
			service.dropMyRecipeComment(myRecipeComment);
		}
		@PostMapping("/myrecipe/commentupdate")
		public String myRecipeCommentUpdate(MyRecipeComment myRecipeComment) {
			service.changeMyRecipeComment(myRecipeComment);
			
			return "redirect: ./view?myRipNo="+myRecipeComment.getMyRipNo();
		}
		
		@GetMapping("/myrecipe/reccheck")
		public void myRecipeRecCheck(MyRecipe myRecipe, HttpSession session,HttpServletResponse resp) {
			boolean isRec = service.myRecipeRecommendCheck(myRecipe,session);
			int recCount = service.getMyRecipeRecommendCount(myRecipe);
			Gson gson = new Gson();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("isRec", isRec);
			map.put("recCount", recCount);
			resp.setCharacterEncoding("utf-8");
			try {
				resp.getWriter().append(gson.toJson(map));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		@GetMapping("/myrecipe/recommend")
		public void myRecipeRecommend(MyRecipe myRecipe, HttpSession session,HttpServletResponse resp) {
			boolean isRec = service.myRecipeRecommend(myRecipe,session);
			int recCount = service.getMyRecipeRecommendCount(myRecipe);
			Gson gson = new Gson();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("isRec", isRec);
			map.put("recCount", recCount);
			resp.setCharacterEncoding("utf-8");
			try {
				resp.getWriter().append(gson.toJson(map));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		@GetMapping("/myrecipe/delete")
		public String myRecipeDelete(MyRecipe myRecipe) {
		
			service.dropMyRecipe(myRecipe);
			
			return "redirect:./list";
		}
		
		//이벤트---------------------------------------------------------------------------------------
		
		@GetMapping("/event/event")
		public void event() {}
		
	
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------
	//이루니
	
	@GetMapping("/creview/list")
	public void cafeReviewForm(Model model, String category, String order, String search, Paging curPage) {
		
		Paging paging = service.getCafeReviewPaging(curPage, category, order, search);

		List<CafeRev> creviewList = service.getCafeReviewList(category, order, search, paging);

		model.addAttribute("paging", paging);
		model.addAttribute("category", category);
		model.addAttribute("order", order);
		model.addAttribute("search", search);
		model.addAttribute("creviewList", creviewList);
		
	}
	
	@GetMapping("/creview/view")
	public void cafeReviewView(Model model, HttpSession session, CafeRev revNo) {
		
		//댓글 리스트
		List<CafeRevComm> crevcommList = service.getCafeReviewCommentList(revNo);
		
		//카페 상세 정보
		CafeRev cafeRev = service.getCafeReviewInfo(revNo);
		
		//로그인한 유저id
		String userId = (String) session.getAttribute("userId");	
		
		//작성한 유저id
		String writerId = service.getWriterId(cafeRev);
		
		//작성자 닉네임 불러오기
		String writerNick = service.getwriterNick(writerId);
		
		//로그인한 유저의 사업자번호
		String userBN = service.getBusinessNoFromMember(userId);
		
		if( userBN == null )	userBN = "0";
		
		//해당 리뷰의 해당하는 카페의 사업자번호
		String cafeBN = service.getBusinessNoFromCafeReviewNo(revNo);
		
		model.addAttribute("userBN", userBN);
		model.addAttribute("cafeBN", cafeBN);
		
        // 이전, 다음 게시글 revNo 조회
        Map<String, Integer> prevNextRevNos = service.getPrevNextRevNos(revNo);

        // 모델에 데이터 추가
        model.addAttribute("prevRevNo", prevNextRevNos.get("prevRevNo"));
        model.addAttribute("nextRevNo", prevNextRevNos.get("nextRevNo"));
		
//		String commId = service.getCafeReviewCommentId();
		
		model.addAttribute("crevcommList", crevcommList);
		model.addAttribute("cafeRev", cafeRev);
		model.addAttribute("userId", userId);
		model.addAttribute("writerId", writerId);
		model.addAttribute("writerNick", writerNick);
		
	}
	
	@RequestMapping("/creview/comm")
	public String cafeReviewComm(Model model, CafeRev revNo, CafeRevComm cafeCommCont, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		
		service.writeCafeReviewComm(revNo, cafeCommCont, userId);
		
		return "redirect: ./view?revNo=" + revNo.getRevNo();
	}
	
	@RequestMapping("/creview/comm/update")
	public void cafeReviewCommUpdate(CafeRevComm cafeRevComm) {
		
    	service.changeCafeReviewComment(cafeRevComm);
    	
	}
	
	@RequestMapping("/creview/comm/delete")
	public String cafeReviewCommDelete(CafeRevComm cafeRevCommNo, CafeRev revNo) {
		
		service.dropCafeReviewComment(cafeRevCommNo);
		
		return "redirect: ../view?revNo=" + revNo.getRevNo();
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
	

	//--------------------------------------------------------------------------------------
	//		[ 원두 ]
	//--------------------------------------------------------------------------------------

	@GetMapping("/breview/list")
	public void beanReviewForm(Model model, String category, String order, String search, Paging curPage) {
		
	    Paging paging = service.getBeanReviewPaging(curPage, category, order, search);
	    
	    List<BeanRev> rawBreviewList = service.getBeanReviewList(category, order, search, paging);

	    // Map을 사용하여 글번호로 그룹화하면서 맛과 향을 중복 없이 병합
	    Map<Integer, BeanRev> uniqueBreviewMap = new LinkedHashMap<>();
	    
	    for (BeanRev review : rawBreviewList) {
	        uniqueBreviewMap.computeIfAbsent(review.getRevNo(), key -> {
	            review.setCupNoteNames(new HashSet<>()); // 맛과 향 Set 초기화
	            return review;
	        }).getCupNoteNames().add(review.getCupNoteName()); // 중복되지 않는 맛과 향만 추가
	    }

	    List<BeanRev> breviewList = new ArrayList<>(uniqueBreviewMap.values());
	    model.addAttribute("paging", paging);
	    model.addAttribute("category", category);
	    model.addAttribute("order", order);
	    model.addAttribute("search", search);
	    model.addAttribute("breviewList", breviewList);
	}

	
//	@GetMapping("/breview/list")
//	public void beanReviewForm(Model model, String category, String order, String search, Paging curPage) {
//		
//		Paging paging = service.getBeanReviewPaging(curPage, category, order, search);
//
//		List<BeanRev> breviewList = service.getBeanReviewList(category, order, search, paging);
//		
//	    // Map을 사용하여 글번호로 그룹화하면서 맛과 향을 중복 없이 병합
//	    Map<Integer, BeanRev> uniqueBreviewMap = new LinkedHashMap<>();
//	    
//	    for (BeanRev review : breviewList) {
//	        uniqueBreviewMap.computeIfAbsent(review.getRevNo(), key -> {
//	            review.setCupNoteNames(new HashSet<>()); // 맛과 향 Set 초기화
//	            return review;
//	        }).getCupNoteNames().add(review.getCupNoteName()); // 중복되지 않는 맛과 향만 추가
//	    }
//
//	    List<BeanRev> breviewList = new ArrayList<>(uniqueBreviewMap.values());
//		
//		model.addAttribute("paging", paging);
//		model.addAttribute("category", category);
//		model.addAttribute("order", order);
//		model.addAttribute("search", search);
//		model.addAttribute("breviewList", breviewList);
//		
//		log.info("breviewList: {}", breviewList);
//		
//	}
	
	@GetMapping("/breview/view")
	public void beanReviewView(Model model, HttpSession session, BeanRev revNo) {
		
		//댓글 리스트
		List<BeanRevComm> brevcommList = service.getBeanReviewCommentList(revNo);
		
		log.info("brevcommList: {}", brevcommList);
		
		//원두 상세 정보
		BeanRev beanRev = service.getBeanReviewInfo(revNo);
		
//		log.info("beanRev: {}", beanRev);
		
		List<BeanRev> taste = service.getBeanTasteList(beanRev);
		
		//로그인한 유저id
		String userId = (String) session.getAttribute("userId");	
		
		//작성한 유저id
		String writerId = service.getWriterId(beanRev);
		
		//작성자 닉네임 불러오기
		String writerNick = service.getwriterNick(writerId);
		
		//로그인한 유저의 사업자번호
		String userBN = service.getBusinessNoFromMember(userId);
		
		//해당 리뷰의 해당하는 카페의 사업자번호
		String beanBN = service.getBusinessNoFromBeanReviewNo(revNo);
		
		model.addAttribute("userBN", userBN);
		model.addAttribute("beanBN", beanBN);
		
        // 이전, 다음 게시글 revNo 조회
        Map<String, Integer> prevNextRevNos = service.getPrevNextRevNos(revNo);

        // 모델에 데이터 추가
        model.addAttribute("prevRevNo", prevNextRevNos.get("prevRevNo"));
        model.addAttribute("nextRevNo", prevNextRevNos.get("nextRevNo"));
		
//		String commId = service.getCafeReviewCommentId();
		
		model.addAttribute("brevcommList", brevcommList);
		model.addAttribute("taste", taste);
		model.addAttribute("beanRev", beanRev);
		model.addAttribute("userId", userId);
		model.addAttribute("writerId", writerId);
		model.addAttribute("writerNick", writerNick);
		
	}
	
	@RequestMapping("/breview/comm")
	public String beanReviewComm(Model model, BeanRev revNo, BeanRevComm commCont, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		
		service.writeBeanReviewComm(revNo, commCont, userId);
		
		return "redirect: ./view?revNo=" + revNo.getRevNo();
	}
	
	@RequestMapping("/breview/comm/update")
	public void beanReviewCommUpdate(BeanRevComm commCont) {
		
    	service.changeBeanReviewComment(commCont);
    	
	}
	
	@RequestMapping("/breview/comm/delete")
	public String beanReviewCommDelete(BeanRevComm commNo, BeanRev revNo) {
		
		log.info("commNo: {}", commNo);
		
		service.dropBeanReviewComment(commNo);
		
		return "redirect: ../view?revNo=" + revNo.getRevNo();
	}
	
	@GetMapping("/breview/write")
	public void beanReviewWrite(Model model, BeanSub subNo) {
		
//		log.info("subNo : {}", subNo);
		
		Integer beanNo = service.getBeanNo(subNo.getSubNo());
		String beanName = service.getBeanName(beanNo);
		
		model.addAttribute("beanName", beanName);
		model.addAttribute("beanNo", beanNo);
		model.addAttribute("subNo", subNo);
		
	}
	
	@PostMapping("/breview/write")
	public String beanReviewWriteProc(BeanRev beanRev, BeanSub subNo, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		int userNo = service.getUserNo(userId);
		Integer beanNo = service.getBeanNo(subNo.getSubNo());
		
		log.info("userNo : {}", userNo);
		log.info("beanNo : {}", beanNo);
		
		beanRev.setBeanNo(beanNo);
		beanRev.setUserNo(userNo);
		beanRev.setSubNo(subNo.getSubNo());
		
		service.joinBeanReview(beanRev);
		
		return "redirect: ./list";
	}
	
	@RequestMapping("/breview/delete")
	public String beanReviewDelete(BeanRev beanRev) {
		
		service.dropBeanReview(beanRev);
			
		return "redirect: ./list";
	}
	
	@GetMapping("/breview/update")
	public void beanReviewUpdate(Model model, BeanRev revNo) {
		BeanRev beanRev = service.getBeanReviewInfo(revNo);
		
//		log.info("beanRev: {}", beanRev);
		
		model.addAttribute("beanRev", beanRev);
	}
	
	@PostMapping("/breview/update")
	public String beanReviewUpdateProc(BeanRev beanRev) {
		
		log.info("beanRev: {}", beanRev);
		
		service.changeBeanReview(beanRev);
		
		return "redirect: ./view?revNo=" + beanRev.getRevNo();
	}
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------
	//--------------------------------------------------------------------------------------

	//---이벤트-event(jjy)-----------------------------------------
	@GetMapping("/event/list")
	public void eventForm(
			Model model,
			Event event
			) {
		List<Event> eventList = service.selectByAll();
		model.addAttribute("eventList",eventList);
	}
	
	@GetMapping("/event/info")
	public void eventInfoForm(
			Event event,
			Model model
			) {
		log.info("event : {}", event);
		Event eventView = service.eventInfoByeventNo(event);
		model.addAttribute("eventView",eventView);
	}
	
	@GetMapping("/event/write")
	public void eventWriteForm() {}

	@PostMapping("/event/write")
	public String eventWriteProc(
			Event event
			) {
		log.info("insertevent : {}", event);
		service.insertEvent(event);
		return "redirect:/comm/event/list";
	}
	
	@GetMapping("/event/update")
	public void eventUpdateForm() {}
	
	@PostMapping("/event/update")
	public void eventUpdateProc(
			Event event
			) {
		log.info("updateevent : {}", event);
		
	}
	
	@GetMapping("/event/delete")
	public String eventDelete(
			Event event
			) {
		log.info("event : {}", event);
		service.eventDeleteByEventNo(event);
		return "redirect:/comm/event/list";
	}
	
	

	
	
	
	
}



























