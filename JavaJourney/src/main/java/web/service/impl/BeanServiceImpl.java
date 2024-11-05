package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.BeanDao;
import web.dto.Bean;
import web.service.face.BeanService;
import web.util.Paging;

@Service
@Slf4j
public class BeanServiceImpl implements BeanService {
	
	@Autowired private BeanDao dao;
	
	@Override
	public Paging getPaging(Paging param) {
		
		int cpage = param.getCurPage(); // int 타입
		String page = String.valueOf(cpage); // int를 String으로 변환
		int curPage = 0;
		
		if( page != null && !"".equals(page) ) {
			curPage = Integer.parseInt(page);
		
		} else {
			log.info("curPage값이 null 이거나 비어있습니다");
		
		} // if( page != null && !"".equals(page) )
			
		// 총 게시글 수 조회 하기
		int totalCount = dao.selectCntAll();
		
		// 페이징 계산하기
		param.setCurPage(curPage);
		param.setTotalCount(totalCount);
		param.setListCount(8);
		param.setPageCount(2);
		
		log.info("paging: {}", param);
		
		return param;
	} // getPaging(Paging param) end

	
	@Override
	public List<Bean> getAllBean(Paging paging) {
		
		return dao.selectAll(paging);
		
	} // getAllBean() end
	
} // class end
