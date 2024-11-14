package web.service.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.BeanRev;
import web.dto.BeanSub;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;
import web.dto.Member;
import web.dto.MemberQuizResult;
import web.dto.MyRecipe;
import web.util.Paging;

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

	/**
	 * 세션에서 가져온 userNo에 맞는 회원 삭제
	 * @param userNo
	 */
	public void leaveMember(Integer userNo);
	
	/**
	 * 세션에서 가져온 userNo에 맞는 회원의 취향결과보기
	 * @param userNo 
	 * @return
	 */
	public List<MemberQuizResult> selectByUserNoQuizeResult(int userNo);
	
	/**
	 * 세션에서 가져온 userNo에 맞는 회원의 구독정보보기
	 * @param userNo
	 * @return
	 */
	public List<BeanSub> selectMyBeanSub(int userNo);


	
	
	
}
