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
import web.service.face.CommunityService;

@Service
@Slf4j
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDao dao;
	
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
	public List<FreeBoard> getFreeBoardList() {
		return null;
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



















