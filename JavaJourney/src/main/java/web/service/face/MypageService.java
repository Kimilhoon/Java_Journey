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
	 * @param userNo - 세션에서 불러온 회원번호
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
	 * @return 유저번호에 해당하는 카페리뷰 리스트
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
	 * 세션에서 가져온 userNo에 맞는 회원의 취향결과보기
	 * @param userNo 
	 * @return
	 */
	public List<MemberQuizResult> selectByUserNoQuizeResult(int userNo);
	
	/**
	 * 마이페이지의 구독정보에서 현재페이지를 전달받음
	 * @param beanSub 
	 * @param curPage 
	 * @param curPage
	 * @return
	 */
	public Paging getBeanSubPage(Paging curPage, int userNo);
	
	/**
	 * 세션에서 가져온 userNo에 맞는 회원의 구독정보보기
	 * 페이징 해주기...
	 * @param userNo
	 * @param paging 
	 * @return
	 */
	public List<BeanSub> selectMyBeanSub(int userNo, Paging paging);
	
	/**
	 * Ajax로 전달받은 subNo <Integer> 배열로 구독 취소하기 -> 구독취소여부 Y(구취)로 바꾸기 기존은 N(구독중)
	 * @param subNo
	 */
	public void updateSubCancelBySubNo(List<Integer> subNo);

	/**
	 * 탈퇴하기를 누르면 STATUS 변경 (Y->N)
	 * userNick='(탈퇴한회원)'으로 변경
	 * @param userNo - 로그인 되어있는 유저번호
	 */
	public void outMember(int userNo);

	/**
	 * 탈퇴하기 누르면
	 * 대댓글 닉네임을 '(탈퇴한회원)'으로 변경
	 * @param userNick
	 */
	public void updateCommNickTag(String userNick);
	
	/**
	 * 자기가 작성한 리뷰를 조회
	 * @param userNo
	 * @return
	 */
	public List<BeanRev> selectMyRev(int userNo);






	
	
	
}
