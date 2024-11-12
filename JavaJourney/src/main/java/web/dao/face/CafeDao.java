package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Cafe;
import web.util.Paging;

@Mapper
public interface CafeDao {

	/**
	 * 추천카페 목록 조회
	 * 
	 * @return Best3 카페 조회
	 */
	public List<Cafe> selectBest();

	/**
	 * 전체 게시글 수 조회하기
	 * @param map - 검색 조건
	 * @return 테이블의 전체 행 수 
	 */
	public int selectCntAll(HashMap<String,String> map);

	/**
	 * 전체 카페 목록 조회
	 * @param map - 페이징, 검색어를 담은 객체
	 * @return 필터링 된 전체 Cafe 리스트
	 */
	public List<Cafe> selectAll(HashMap<String,Object> map);

	/**
	 * 카페 상세페이지 내용 조회
	 * @param cafe - cafeNo 정보
	 * @return 카페 정보
	 */
	public Cafe selectByCafeNo(Cafe cafe);




	
	
}
