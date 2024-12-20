package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Bean;
import web.dto.BeanRev;
import web.dto.BeanSub;
import web.dto.Member;
import web.util.Paging;

public interface BeanService {
	
	/**
	 * 베스트 원두 가져오기
	 * 
	 * @return - 베스트 원두
	 */
	public List<Bean> getBeanTop();

	
	/**
	 * 총 원두 수 조회하기
	 * 
	 * @return 총 원두의 수
	 */
	public Bean getBeanCount();
	
	// /bean/all
	// --------------------------------------------------------------------------------------

	/**
	 * 페이징 객체 생성
	 * @param param - 요청 정보 객체 
	 * @param keyword - 검색시 찾을 단어
	 * @param cupnote - 카테고리 설정
	 * 
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(Paging param, String cupnote, String keyword);

	
	/**
	 * 모든 원두 조회
	 * @param paging - 카테고리, 검색어로 필터링한 페이징 객체
	 * @param keyword - 검색어
	 * @param cupnote - 카테고리
	 * @return 조회한 원두
	 */
	public List<Bean> getAllBean(Paging paging, String cupnote, String keyword);

	/**
	 * BeanNo를 전달 받아 bean 조회
	 * 
	 * @param param - 전달받은 beanNo
	 * @return 원두 정보
	 */
	public Bean getBeanInfo(Bean param);
	
	
	/**
	 * 원두 번호를 전달 받아 평균 별점 구하기
	 * 
	 * @param param - 전달받은 원두 번호
	 * @return 원두 별점 평균
	 */
	public BeanRev getStarPoint(Bean param);


	/**
	 * 유저 아이디를 통해 유저 넘버를 찾는다
	 * 
	 * @param userId - 전달 받은 유저 아이다
	 * @return 유저 넘버
	 */
	public Member selectUserNoByUserId(String userId);
	
	
	/**
	 * 모든 원두 리뷰 조회하기
	 * @param param 
	 * 
	 * @return 원두 리뷰 내용
	 */
	public List<BeanRev> selectAllRev(Bean param);


	/**
	 * 유저, 원두 번호 조회해서 찜 추가
	 * 
	 * @param beanNo
	 * @param userNo
	 */
	public void addWish(Map<String, Integer> params);


	/**
	 * 유저, 원두 번호 조회해서 찜 삭제
	 * 
	 * @param beanNo
	 * @param userNo
	 */
	public void removeWish(Map<String, Integer> params);
	
	
	/**
	 * beanNo와 userNo를 가져와서 로그인 되어있는지 확인
	 * 
	 * @param beanNo
	 * @param userNo
	 * @return true / false
	 */
	public boolean checkUserWish(int beanNo, int userNo);


	/**
	 * 빈넘버와 유저아이디에 찜 추가
	 * 
	 * @param beanNo - 전달받은 원두, 유저 번호
	 */
//	public void insertWish(BeanWish beanWish);
	
	// /bean/info
	// --------------------------------------------------------------------------------------
	
	/**
	 * 원두 정보 불러오기
	 * 
	 * @param param - 원두 번호
	 * @return 원두 정보
	 */
	public Bean getBeanByBeanNo(Bean param);

 
	/**
	 * 유저 아이디로 멤버 정보 불러오기
	 * 
	 * @param userId - 유저아이디
	 * @return 불러올 멤버 정보
	 */
	public Member getMemberByUserId(String userId);


	/**
	 * 전달 받은 구독 정보로 정보 삽입하기
	 * 
	 * @param beanSub - 구독정보
	 */
	public void beanSubscribe(BeanSub beanSub);

	// /bean/sub
	// --------------------------------------------------------------------------------------
	
	//beanCompare
	
	/**
	 * 모든 원두 정보 불러오기
	 * 
	 * @return - 조회된 원두 리스트
	 */
	public List<Bean> getBeanList();

	/**
	 * 원두번호로 원두 정보 조회
	 * 
	 * @param beanNo
	 * @return
	 */
	public Bean getBeanInfoByBeanNo(int beanNo);
	
} // interface end
