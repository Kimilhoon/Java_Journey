package web.service.face;

import java.util.List;

import web.dto.BeanRev;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;

import java.util.Map;

import web.dto.Member;
import web.dto.MyRecipe;

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
	 * 내가 찜한 카페 목록 조회하기
	 * @param i 
	 * @param i 
	 * @return
	 */
	List<CafeWish> selectByLikeCafe(int userNo);
	
	/**
	 * 내가찜한 원두 목록 조회하기
	 * @param userNo
	 * @return
	 */
	List<BeanWish> selectByLikeBean(int userNo);

	/**
	 * 유저번호에 해당하는 카페리뷰 리스트 가져오기
	 * @param userNo
	 * @return
	 */
	public List<CafeRev> selectCafeRevByUserNo(int userNo);

	/**
	 * 유저번호에 해당하는 원두리뷰 리스트 가져오기
	 * @param userNo
	 * @return
	 */
	public List<BeanRev> selectBeanRevByUserNo(int userNo);

	/**
	 * 유저번호에 해당하는 자유게시판 리스트 가져오기
	 * @param userNo
	 * @return
	 */
	public List<FreeBoard> selectFreeBoardByUserNo(int userNo);

	/**
	 * 유저번호에 해당하는 나만의레시피 리스트 가져오기
	 * @param userNo
	 * @return
	 */
	public List<MyRecipe> selectMyRecipeByUserNo(int userNo);

	
	
	
}
