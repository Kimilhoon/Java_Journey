package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import web.dto.BeanRev;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;
import web.dto.Member;
import web.dto.MyRecipe;

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
	
	
	
	
}
