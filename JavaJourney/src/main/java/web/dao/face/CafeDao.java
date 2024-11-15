package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.Member;
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
	 * 총 카페 수 조회하기
	 * 
	 * @return 총 카페 수
	 */
	public Cafe selectCafeCount();

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

	/**
	 * 카페 번호를 전달받아 카페 별점 평균 구하기
	 * @param cafe - 카페번호
	 * @return 카페 평균 별점
	 */
	public CafeRev selectStarPoint(Cafe cafe);

	/**
	 * 유저 아이디로 유저 넘버 조회
	 * @param userId - 전달받은 유저 아이디
	 * @return 유저 넘버
	 */
	public Member selectByUserId(String userId);

	/**
	 * 모든 카페 리뷰 조회 
	 * @param cafe - 카페 번호
	 * @return 조회된 리뷰 내용
	 */
	public List<CafeRev> selectAllRev(Cafe cafe);

	/**
	 * 찜 추가 
	 * @param cafeNo
	 * @param userNo
	 */
	public void addWish(Map<String, Integer> params);

	/**
	 * 찜 삭제 
	 * @param cafeNo
	 * @param userNo
	 */
	public void removeWish(Map<String, Integer> params);





	
	
}
