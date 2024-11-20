package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
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

@Mapper
public interface MypageDao {
	
	//진주 --------------------------------------
	
	/**
	 * 아이디로 회원정보 찾기
	 * @param userId
	 * @return
	 */
	public Member findByUserId(String userId);

	/**
	 * 회원번호로 회원정보 찾기
	 * @param userNo
	 * @return
	 */
	public Member findByUserNo(Integer userNo);


	/**
	 * 회원 정보 수정하기
	 * @param member
	 * @return
	 */
	public void myinfoUpdate(Member member);

	/**
	 * 닉네임 중복체크
	 * @param checkNickParam
	 * @return
	 */
	public int selectByMemberNick(Member checkNickParam);
	
	/**
	 * 유저가 찜한 카페 DB에서 조회하기(+검색어가 있다면 && 조회)
	 * @param userNo 
	 * @return
	 */
	List<CafeWish> selectByUserLikeCafe(@Param("userNo") int userNo,@Param("searchText") String searchText);
	
	/**
	 * 유저가 찜한 원두 DB에서 조회하기
	 * @param userNo
	 * @return
	 */
	List<BeanWish> selectByUserLikeBean(int userNo);

	/**
	 * 유저번호에 해당하는 카페리뷰글 보기
	 * @param userNo
	 * @return
	 */
	public List<CafeRev> selectCafeRevByUserNo(int userNo);

	/**
	 * 유저번호에 해당하는 원두리뷰글 보기
	 * @param userNo
	 * @return
	 */
	public List<BeanRev> selectBeanRevByUserNo(int userNo);

	/**
	 * 유저번호에 해당하는 자유게시판글 보기
	 * @param userNo
	 * @return
	 */
	public List<FreeBoard> selectFreeBoardByUserNo(int userNo);

	/**
	 * 유저번호에 해당하는 나만의레시피 글 보기
	 * @param userNo
	 * @return
	 */
	public List<MyRecipe> selectMyRecipeByUserNo(int userNo);

	/**
	 * 회원번호에 해당하는 회원 지우기
	 * @param member
	 */
	public void deleteMemberByUserNo(Integer userNo);
	
	/**
	 * 나의 취향결과 DB에서 조회하기
	 * @param userNo 
	 * @return
	 */
	public List<MemberQuizResult> selectMyQuizeResult(int userNo);
	
	/**
	 * 나의 구독정보를 DB에서 조회하기
	 * @param userNo
	 * @return
	 */
	public List<BeanSub> selectMyBeanSubResult(int userNo);
	
	/**
	 * 구독정보에서 구독번호를 넘겨받아 구독원두를 취소하는 표시로 만들기
	 * @param no
	 */
	public void subUpdateCancel(Integer No);

	/**
	 * 카테고리와 검색어로 필터링된 게시글 수
	 * @param map - 카테고리, 검색어 정보를 담은 객체
	 * @return 필터링된 게시글 수
	 */
//	public int getMyViewTotalCnt(HashMap<String, String> map);

	/**
	 * 필터링된 bean 리스트
	 * @param map
	 * @return
	 */
//	public List<Map<String, Object>> selectAll(HashMap<String, Object> map);



	
	
	
	
}
