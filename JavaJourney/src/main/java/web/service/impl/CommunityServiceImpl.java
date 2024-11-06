package web.service.impl;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CommunityDao;
import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
import web.dto.FreeBoardComment;
import web.dto.Member;
import web.service.face.CommunityService;
import web.util.Paging;

@Service
@Slf4j
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired private CommunityDao dao;
	

	//자유게시판--------------------------------------------------------------------------------
	@Override
	public Paging getFreeBoardPaging(Paging curPage, String search, String category) {
		log.info("{}",search);
		log.info("{}",category);
		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		if(category == null || "".equals(category)||"all".equals(category)) {
			category = "N";
		}else if(category.equals("cafe")) {
			category="카페";
		}else {
			category="원두";
		}
		if(search == null || "".equals(search)) {
			search = "N";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("category", category);

		int totalCnt = dao.getFreeBoardTotalCnt(map);
		
		log.info("totalCNT{}",totalCnt);
		
		Paging paging = new Paging(curPage.getCurPage(),totalCnt);
		
		return paging;
	}
	
	@Override
	public List<FreeBoard> getFreeBoardList(Paging paging, String search,String category) {
		
		if(category == null || "".equals(category)||"all".equals(category)) {
			category = "N";
		}else if(category.equals("cafe")) {
			category="카페";
		}else {
			category="원두";
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("search", search);
		map.put("category", category);
		List<FreeBoard> freeBoardList = dao.selectFreeBoardListAll(map);
		for(FreeBoard f : freeBoardList) {
			f.setFreeBoardCommentCount(dao.selectFreeBoardCommentCnt(f));
			f.setFreeBoardRecommendCount(dao.getFreeBoardRecCountByFreeBoardNo(f));
		}
		
		return freeBoardList;
	}
	
	@Override
	public FreeBoard getFreeBoardView(FreeBoard freeBoard) {
		freeBoard = dao.selectFreeBoardByFreeBoardNo(freeBoard);
		return freeBoard;
	}
	
	@Override
	public Member getMemberByFreeBoardNo(FreeBoard freeBoard) {
		return dao.selectMemberByFreeBoardNo(freeBoard);
	}
	@Override
	public void dropFreeBoard(FreeBoard freeBoard) {
		
		List<FreeBoardComment> cList = dao.selectFreeBoardCommentByFreeBoardNo(freeBoard);
		for(FreeBoardComment c:cList) {
			dao.deleteFreeBoardCommentByFreeBoardCommentNo(c);
		}
		dao.deleteFreeBoardByFreeBoardNo(freeBoard);
	}
	@Override
	public void freeBoardHitUp(FreeBoard freeBoard) {
		dao.updateFreeBoardHitByFreeBoardNo(freeBoard);
	}
	
	@Override
	public List<FreeBoardComment> getFreeBoardCommentList(FreeBoard freeBoard) {
		return dao.selectFreeBoardCommentByFreeBoardNo(freeBoard);
	}
	
	@Override
	public void joinFreeBoardComment(FreeBoard freeBoard, FreeBoardComment freeBoardComment, HttpSession session) {
		freeBoardComment.setFreeBoardNo(freeBoard.getFreeBoardNo());
		
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoardComment.setUserNo(member.getUserNo());
		freeBoardComment.setUserNick(member.getUserNick());
		dao.insertFreeBoardComment(freeBoardComment);
		
	}
	
	@Override
	public void dropFreeBoardComment(FreeBoardComment freeBoardComment) {
		dao.deleteFreeBoardCommentByFreeBoardCommentNo(freeBoardComment);
	}
	
	@Override
	public void joinFreeBoard(FreeBoard freeBoard, HttpSession session) {
		if(freeBoard.getFreeBoardCategory().equals("cafe")) {
			freeBoard.setFreeBoardCategory("카페");
		}else {
			freeBoard.setFreeBoardCategory("원두");
			
		}
		if(freeBoard.getFreeBoardMapX() == null || freeBoard.getFreeBoardMapY()==null) {
			freeBoard.setFreeBoardMapX("37.68023654904071");
			freeBoard.setFreeBoardMapY("127.27331371310157");
		}
		
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoard.setUserNick(member.getUserNick());
		freeBoard.setUserNo(member.getUserNo());
		log.info("{}",freeBoard);
		dao.insertFreeBoard(freeBoard);
	}
	
	@Override
	public void changeFreeBoard(FreeBoard freeBoard) {
		dao.updateFreeBoardByFreeBoardNo(freeBoard);
	}
	
	@Override
	public boolean isFreeBoardRec(FreeBoard freeBoard, HttpSession session) {
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoard.setUserNo(member.getUserNo());
		int res = dao.selectFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
		if(res>0) {

			dao.deleteFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
			return false;
		}else {
			dao.insertFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
			return true;
		}
	}
	
	@Override
	public boolean isFreeBoardRecCheck(FreeBoard freeBoard, HttpSession session) {
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoard.setUserNo(member.getUserNo());
		int res = dao.selectFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public int getFreeBoardRecCount(FreeBoard freeBoard) {
		return dao.getFreeBoardRecCountByFreeBoardNo(freeBoard);
	}

	
	//자유게시판--------------------------------------------------------------------------------
	
	//=================== 이루니 ===================
	@Override
	public List<CafeRev> getCafeReviewList(String category, String order, String search, Paging paging) {
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("category", category);
		param.put("order", order);
		param.put("search", search);
		param.put("paging", paging);
		
		List<CafeRev> list = dao.selectCafeReview(param);
		
		return list;
	}
	
	@Override
	public List<CafeRevComm> getCafeReviewCommentList(CafeRev revNo) {
		
		return dao.selectCafeReviewCommentListByCafeReviewNo(revNo);
	}
	
	@Override
	public CafeRev getCafeReviewInfo(CafeRev revNo) {
		
		return dao.selectCafeReviewInfo(revNo);
	}
	
	@Override
	public String getCafeName(Cafe cafeNo) {
		
		return dao.selectCafeNameByCafeNo(cafeNo);
	}
	
	@Override
	public int getUserNo(String userId) {
		
		return dao.selectUsernoByUserid(userId);
	}
	
	@Override
	public void joinCafeReview(CafeRev cafeRev) {
		
		int res = dao.insertCafeReview(cafeRev);
		
	}
	
	@Override
	public String getWriterId(CafeRev cafeRev) {

		return dao.selectWriterId(cafeRev);
	}
	
	@Override
	public void dropCafeReview(CafeRev cafeRev) {
		
		dao.deleteCafeReviewByCafeNo(cafeRev);
		
	}
	
	@Override
	public void changeCafeReview(CafeRev cafeRev) {
		
		int res = dao.updateCafeReviewByCafeNo(cafeRev);
	}
	
	@Override
	public Paging getCafeReviewPaging(Paging curPage, String category, String order, String search) {
		
		//수정해야
		
		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		if(category == null || "".equals(category)||"all".equals(category)) {
			category = "N";
		}else if(category.equals("cafe")) {
			category="카페";
		}else {
			category="원두";
		}
		if(search == null || "".equals(search)) {
			search = "N";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("category", category);

		int totalCnt = dao.getFreeBoardTotalCnt(map);
		
		log.info("totalCNT{}",totalCnt);
		
		Paging paging = new Paging(curPage.getCurPage(),totalCnt);
		
		return paging;
		
	}
	
}



















