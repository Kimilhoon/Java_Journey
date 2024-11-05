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
	
	@Autowired
	private CommunityDao dao;
	
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
	
	
	
}



















