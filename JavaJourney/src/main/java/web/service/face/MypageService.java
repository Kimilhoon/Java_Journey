package web.service.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.BeanWish;
import web.dto.CafeWish;
import web.dto.Member;

public interface MypageService {


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진주---------------------------------------
	

	/**
	 * 아이디로 회원정보 불러오기
	 * @param userId
	 * @return
	 */
	public Member findByUserId(String userId);

	/**
	 * 유저번호로 회원정보 불러오기
	 * @param userNo
	 * @return
	 */
	public Member findByUserNo(Integer userNo);

	/**
	 * 회원 정보 수정하기
	 * @param member
	 */
	public void myinfoUpdate(Member member);

	/**
	 * 닉네임 중복 체크
	 * @param checkNickParam
	 * @return
	 */
	public Map<String, Object> checkNick(Member checkNickParam);
	
	/**
	 * 내가 찜한 카페 목록 조회하기(+검색어가 있다면 && 로 조회)
	 * @param userNo
	 * @param searchText 
	 * @return
	 */
	public List<CafeWish> selectByLikeCafe(@Param("userNo") int userNo, @Param("searchText") String searchText);
	
	/**
	 * 내가찜한 원두 목록 조회하기
	 * @param userNo
	 * @return
	 */
	public List<BeanWish> selectByLikeBean(int userNo);
	
	
	
	
}
