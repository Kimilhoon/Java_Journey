package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Bean;
import web.dto.BeanRev;
import web.util.Paging;

@Mapper
public interface BeanDao {

	/**
	 * 총 게시글 수 조회
	 * @param map - 검색 조건
	 * 
	 * @return 테이블의 전체 행수
	 */
	public int selectCntAll(HashMap<String, String> map);


	/**
	 * 카테고리와 검색어로 필터링된 bean 리스트
	 * 
	 * @param map - 페이징, 검색어를 담은 객체
	 * @return 필터링된 bean 리스트
	 */
	public List<Bean> selectAll(HashMap<String, Object> map);


	/**
	 * beanNo로 원두 정보 조회
	 * 
	 * @param param - beanNo
	 * @return 원두 정보
	 */
	public Bean selectByBeanNo(Bean param);

	
	
	
} // interface end
