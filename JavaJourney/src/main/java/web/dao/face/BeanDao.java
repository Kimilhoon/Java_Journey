package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Bean;
import web.dto.BeanWish;
import web.dto.Member;

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

	// /bean/all
	// --------------------------------------------------------------------------------------

	/**
	 * beanNo로 원두 정보 조회
	 * 
	 * @param param - beanNo
	 * @return 원두 정보
	 */
	public Bean selectByBeanNo(Bean param);


	/**
	 * 유저 아이디로 유저 넘버 조회
	 * 
	 * @param userId - 전달받은 유저 아이디
	 * @return 유저 넘버
	 */
	public Member selectByUserId(String userId);


	/**
	 * 찜 추가
	 * 
	 * @param beanNo
	 * @param userNo
	 */
	public void addWish(Map<String, Integer> params);


	/**
	 * 찜 삭제
	 * 
	 * @param beanNo
	 * @param userNo
	 */
	public void removeWish(Map<String, Integer> params);


	/**
	 * 찜 추가
	 * 
	 * @param bean - 전달 받은 원두, 유저 NO
	 */
//	public void insertWish(BeanWish beanWish);

	// /bean/info
	// --------------------------------------------------------------------------------------

	
	
} // interface end
