package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.BeanDao;
import web.dto.Bean;
import web.dto.BeanRev;
import web.service.face.BeanService;
import web.util.Paging;

@Service
@Slf4j
public class BeanServiceImpl implements BeanService {
	
	@Autowired private BeanDao dao;
	
	@Override
	public Paging getPaging(Paging param, String cupnote, String keyword) {
		
//		int cpage = param.getCurPage(); // int 타입
//		String page = String.valueOf(cpage); // int를 String으로 변환
//		int curPage = 0;
//		
//		if( page != null && !"".equals(page) ) {
//			curPage = Integer.parseInt(page);
//		
//		} else {
//			log.info("curPage값이 null 이거나 비어있습니다");
//		
//		} // if( page != null && !"".equals(page) )
		
		if( cupnote == null || "".equals(cupnote) ) {
			cupnote = "N";
		} else if( cupnote.equals("1") ) {
			cupnote = "새콤";
		} else if( cupnote.equals("2") ) {
			cupnote = "달콤";
		} else if( cupnote.equals("3") ) {
			cupnote = "쌉쌀";
		} else if( cupnote.equals("4") ) {
			cupnote = "고소";
		} else if( cupnote.equals("5") ) {
			cupnote = "은은한";
		} else if( cupnote.equals("6") ) {
			cupnote = "향긋한";
		} else if( cupnote.equals("7") ) {
			cupnote = "진한";
		} else if( cupnote.equals("8") ) {
			cupnote = "부드러운";
		} // if( cupnote == null || "".equals(cupnote) ) end
		
		if( keyword == null || "".equals(keyword) ) {
			keyword = "N";
		} // if( keyword == null || "".equals(keyword) ) end
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cupnote", cupnote);
		map.put("keyword", keyword);
			
		// 총 게시글 수 조회 하기
		int totalCount = dao.selectCntAll(map);
		log.info("totalCount: {}", totalCount);
		
		// 페이징 계산하기
//		param.setCurPage(curPage);
		param.setTotalCount(totalCount);
//		param.setListCount(4);
//		param.setPageCount(2);
		Paging paging = new Paging(param.getCurPage(), totalCount, 8, 5);
		
		log.info("paging: {}", paging);
		
		return paging;
	} // getPaging(Paging param) end

	
	@Override
	public List<Bean> getAllBean(Paging paging, String cupnote, String keyword) {
		
		if( cupnote == null || "".equals(cupnote) ) {
			cupnote = "N";
		} else if( cupnote.equals("1") ) {
			cupnote = "새콤";
		} else if( cupnote.equals("2") ) {
			cupnote = "달콤";
		} else if( cupnote.equals("3") ) {
			cupnote = "쌉쌀";
		} else if( cupnote.equals("4") ) {
			cupnote = "고소";
		} else if( cupnote.equals("5") ) {
			cupnote = "은은한";
		} else if( cupnote.equals("6") ) {
			cupnote = "향긋한";
		} else if( cupnote.equals("7") ) {
			cupnote = "진한";
		} else if( cupnote.equals("8") ) {
			cupnote = "부드러운";
		} // if( cupnote == null || "".equals(cupnote) ) end
		
		if( keyword == null || "".equals(keyword) ) {
			keyword = "N";
		} // if( keyword == null || "".equals(keyword) ) end		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("cupnote", cupnote);
		map.put("keyword", keyword);
		
		List<Bean> list = dao.selectAll(map);
		
		return list;
		
	} // getAllBean() end


	@Override
	public Bean getBeanInfo(Bean param) {
		
		return dao.selectByBeanNo(param);
		
	} // getBeanInfo(Bean param) end
	
	
	
} // class end
