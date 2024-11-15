package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.Member;
import web.util.Paging;

public interface CafeService {

	/**
	 * 베스트 3 카페 조회
	 * @return - 조회된 3개 카페
	 */
	public List<Cafe> getBest();

	/**
	 * 총 카페 수 조회하기
	 * 
	 * @return 총 카페 수
	 */
	public Cafe getCafeCount();

	/**
	 * 페이지 객체 생성
	 * @param param - 요청 정보 객체
	 * @param location - 지역 카테고리 설정
	 * @param keyword - 검색할 단어 
	 * @return 페이징 계산 완료된 Paging객체
	 */
	public Paging getPaging(Paging param, String location, String keyword);

	/**
	 * 전체 카페 조회
	 * @param keyword - 검색할 단어
	 * @param location - 지역 카테고리
	 * @param paging - 검색&카테고리 필터링된 페이징 객체
	 * @return - 조회된 카페
	 */
	public List<Cafe> getAllCafe(Paging paging, String location, String keyword);

	/**
	 * CafeNo 전달 받아 Cafe 상세내용 조회
	 * 
	 * @param cafe - 전달받은 cafeNo
	 * @return Cafe 상세 정보 
	 */
	public Cafe getCafeInfo(Cafe cafe);

	/**
	 * 카페 번호를 전달받아 평균 별점 구하기 
	 * @param cafe - 전달받은 카페 번호
	 * @return 카페 별점 평균
	 */
	public CafeRev getStarPoint(Cafe cafe);

	/**
	 * UserId를 통해 UserNo를 찾음  
	 * @param userId - 전달 받은 userId
	 * @return userNo
	 */
	public Member selectUserNoByUserId(String userId);

	/**
	 * 모든 카페 리뷰 조회하기
	 * @param cafe - 
	 * @return 카페 리뷰 내용
	 */
	public List<CafeRev> selectAllRev(Cafe cafe);
	
	/**
	 * 유저, 카페 번호 조회해서 찜 추가
	 * @param cafeNo
	 * @param userNo
	 */
	public void addWish(Map<String, Integer> params);

	/**
	 * 유저, 카페 번호 조회해서 찜 삭제
	 * @param cafeNo
	 * @param userNo
	 */
	public void removeWish(Map<String, Integer> params);






}
