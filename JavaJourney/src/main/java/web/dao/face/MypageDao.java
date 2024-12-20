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
	 * 나의 취향결과 DB에서 조회하기
	 * @param userNo 
	 * @return
	 */
	public List<MemberQuizResult> selectMyQuizeResult(int userNo);
	
	/**
	 * 유저가 구독한 원두 전체 데이터 개수 조회
	 * @param userNo
	 * @return
	 */
	public int getBeanSubTotalCnt(int userNo);
	
	/**
	 * 나의 구독정보를 DB에서 조회하기
	 * @param userNo
	 * @param paging 
	 * @return
	 */
	public List<BeanSub> selectMyBeanSubResult(HashMap<String, Object> map);
	
	/**
	 * 구독정보에서 구독번호를 넘겨받아 구독원두를 취소하는 표시로 만들기
	 * @param no
	 */
	public void subUpdateCancel(Integer No);

	/**
	 * 탈퇴하기를 누르면 status를 Y에서 N으로 바꿔준다
	 * 로그인 불가능하게 (N)비활성화시킴 (탈퇴기능)
	 * 닉네임을 '(탈퇴한 회원)'으로 변경
	 * @param userNo
	 */
	public void changeStatus(int userNo);

	/**
	 * FREEBOARDCOMMENT.userNick 변경 (댓글닉네임)
	 * @param userNo
	 */
	public void changeFreeNick(int userNo);

	/**
	 * MYRECIPECOMMENT.userNick 변경 (댓글닉네임)
	 * @param userNo
	 */
	public void changeMyrepNick(int userNo);

	/**
	 *  FREEBOARDCOMMENT.FREEBOARDCOMMNICKTAG (대댓글닉네임)
	 * @param userNick
	 */
	public void changeFreeCommNickTag(String userNick);

	/**
	 * MYRECIPECOMMENT.MYRIPCOMMNICKTAG 변경 (대댓글닉네임)
	 * @param userNick
	 */
	public void changeMyrecipeCommNickTag(String userNick);
	
	/**
	 * 내가 작성한 리뷰 글 DB 조회
	 * @param userNo
	 * @return
	 */
	public List<BeanRev> selectMyRevData(int userNo);






	
	
	
	
}
