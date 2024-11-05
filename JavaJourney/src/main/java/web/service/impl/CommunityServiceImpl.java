package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CommunityDao;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
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

		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		if(category == null || "".equals(category)) {
			category = "N";
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
	public List<FreeBoard> getFreeBoardList(Paging paging, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<FreeBoard> freeBoardList = dao.selectFreeBoardListAll(map);
		
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
	
	//자유게시판--------------------------------------------------------------------------------
	@Override
	public List<FreeBoard> getCafeReviewList(String category, String order, String search) {
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("category", category);
		param.put("order", order);
		param.put("search", search);
		
		List<FreeBoard> list = dao.selectCafeReview(param);
		
		return list;
	}
	
	@Override
	public List<CafeRevComm> getCafeReviewCommentList(CafeRev revNo) {
		
		List<CafeRevComm> list = dao.selectCafeReviewCommentListByCafeReviewNo(revNo);
		
		return list;
	}
	
	@Override
	public CafeRev getCafeReviewInfo(CafeRev revNo) {
		
		CafeRev cafeRev = dao.selectCafeReviewInfo(revNo);
		
		return cafeRev;
	}
	
	
}



















