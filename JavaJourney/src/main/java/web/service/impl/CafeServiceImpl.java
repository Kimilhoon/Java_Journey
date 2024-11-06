package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CafeDao;
import web.dto.Cafe;
import web.service.face.CafeService;
import web.util.Paging;

@Service
@Slf4j
public class CafeServiceImpl implements CafeService {
	
	@Autowired private CafeDao dao;

	@Override
	public List<Cafe> getBest() {
		return dao.selectBest();
	}

	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회하기
		int totalCount = dao.selectCntAll();
		
		//페이징 계산하기
		Paging paging = new Paging(curPage, totalCount);
		
		return paging;
	}

	@Override
	public List<Cafe> getAllCafe() {
		return dao.selectAll();
	}
	
}
