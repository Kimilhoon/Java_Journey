package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CafeDao;
import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.Member;
import web.service.face.CafeService;
import web.util.Paging;

@Service
@Slf4j
public class CafeServiceImpl implements CafeService {
	
	@Autowired private CafeDao dao;
	

	@Override
	public List<Cafe> getCafeTop() {
		return dao.selectCafeTop();
	}
	
	@Override
	public List<Cafe> getBest() {
		return dao.selectBest();
	}
	
	@Override
	public Cafe getCafeCount() {
		return dao.selectCafeCount();
	}

	@Override
	public Paging getPaging(Paging param, String location, String keyword) {
		
		if( location == null || "".equals(location) ) {
			location = "N";
		} else if( location.equals("1") ) {
			location = "강남구";
		} else if( location.equals("2") ) {
			location = "서초구";
		} else if( location.equals("3") ) {
			location = "송파구";
		} else if( location.equals("4") ) {
			location = "종로구";
		} else if( location.equals("5") ) {
			location = "서대문구";
		} else if( location.equals("6") ) {
			location = "마포구";
		} // if( location == null || "".equals(location) ) end
//		if (location == null || "".equals(location)) {
//	        location = "N";
//	    } else if ("1".equals(location)) {
//	        location = "강남구";
//	    } else if ("2".equals(location)) {
//	        location = "서초구";
//	    } else if ("3".equals(location)) {
//	        location = "송파구";
//	    } else if ("4".equals(location)) {
//	        location = "종로구";
//	    } else if ("5".equals(location)) {
//	        location = "서대문구";
//	    } else if ("6".equals(location)) {
//	        location = "마포구";
//	    }
		
		if( keyword == null || "".equals(keyword) ) {
			keyword = "N";
		} // if( keyword == null || "".equals(keyword) ) end
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("location", location);
		map.put("keyword", keyword);
//		map.put("location", String.valueOf(location)); // 문자열로 변환
//	    map.put("keyword", String.valueOf(keyword));   // 문자열로 변환
		
		//총 게시글 수 조회하기
		int totalCount = dao.selectCntAll(map);
		log.info("totalCount: {}", totalCount);
		
		//페이징 계산하기
		param.setTotalPage(totalCount);
		Paging paging = new Paging(param.getCurPage(), totalCount, 8, 10);

		
		log.info("paging: {}", paging);
		
		return paging;
	}

	@Override
	public List<Cafe> getAllCafe(Paging paging, String location, String keyword) {
		
		if( location == null || "".equals(location) ) {
			location = "N";
		} else if( location.equals("1") ) {
			location = "강남구";
		} else if( location.equals("2") ) {
			location = "서초구";
		} else if( location.equals("3") ) {
			location = "송파구";
		} else if( location.equals("4") ) {
			location = "종로구";
		} else if( location.equals("5") ) {
			location = "서대문구";
		} else if( location.equals("6") ) {
			location = "마포구";
		} // if( location == null || "".equals(location) ) end
//		if ("N".equals(location)) {
//	        location = null;
//	    } else if ("1".equals(location)) {
//	        location = "강남구";
//	    } else if ("2".equals(location)) {
//	        location = "서초구";
//	    } else if ("3".equals(location)) {
//	        location = "송파구";
//	    } else if ("4".equals(location)) {
//	        location = "종로구";
//	    } else if ("5".equals(location)) {
//	        location = "서대문구";
//	    } else if ("6".equals(location)) {
//	        location = "마포구";
//	    }
		
		// keyword 처리: "N"이 들어가면 null로 처리
//	    if ("N".equals(keyword) || keyword == null || "".equals(keyword)) {
//	        keyword = null;
		if( keyword == null || "".equals(keyword) ) {
	        keyword = "N";
		} // if( keyword == null || "".equals(keyword) ) end
		
		// HashMap 생성 및 값 설정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("location", location);
		map.put("keyword", keyword);
//		map.put("location", String.valueOf(location)); // 문자열로 변환
//	    map.put("keyword", String.valueOf(keyword));   // 문자열로 변환
		
	    log.info("Processed Location: " + location);
	    log.info("Processed Keyword: " + keyword);
	    log.info("Map Contents: " + map);
	    
		List<Cafe> AllCafeList = dao.selectAll(map);
		
		return AllCafeList;
	}

	@Override
	public Cafe getCafeInfo(Cafe cafe) {
		
		return dao.selectByCafeNo(cafe);
	}

	@Override
	public CafeRev getStarPoint(Cafe cafe) {
		return dao.selectStarPoint(cafe);
	}

	@Override
	public Member selectUserNoByUserId(String userId) {
		return dao.selectByUserId(userId);
	}

	@Override
	public List<CafeRev> selectAllRev(Cafe cafe) {
		return dao.selectAllRev(cafe);
	}

	@Override
	public void addWish(Map<String, Integer> params) {
		dao.addWish(params);
	}

	@Override
	public void removeWish(Map<String, Integer> params) {
		dao.removeWish(params);
	}

	
	
}

