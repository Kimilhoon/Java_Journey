package web.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
import web.dto.FreeBoardComment;
import web.dto.Member;
import web.util.Paging;


public interface CommunityService {
	
	/**
	 * 협약 카페리뷰 리스트 불러오기
	 * 
	 * @param category - 카테고리
	 * @param order - 정렬순
	 * @param search - 검색
	 * @param paging - 페이징
	 * @return 카페리뷰 리스트
	 */
	public List<CafeRev> getCafeReviewList(String category, String order, String search, Paging paging);
	
	
	/**
	 * 카페 리뷰 댓글 정보 불러오기
	 * 
	 * @param revNo - 조회할 게시글 번호
	 * @return 카페리뷰댓글 리스트
	 */
	public List<CafeRevComm> getCafeReviewCommentList(CafeRev revNo);

	/**
	 * 카페 리뷰 정보 불러오기
	 * 
	 * @param revNo - 조회할 게시글 번호
	 * @return 조회된 카페 리뷰
	 */
	public CafeRev getCafeReviewInfo(CafeRev revNo);

	/**
	 * 카페번호를 이용하여 카페이름 불러오기
	 * 
	 * @param cafeNo - 조회할 카페 번호
	 * @return 카페이름
	 */
	public String getCafeName(Cafe cafeNo);
	
	/**
	 * 
	 * 조건에 따른 자유게시판 리스트 조회
	 * 
	 * @param paging - 카테고리, 검색어로 필터링한 페이징 객체
	 * @param search - 검색어
	 * @return - 필터링된 자유게시판 리스트
	 */
	public List<FreeBoard> getFreeBoardList(Paging paging , String search,String category);
	
	/**
	 * 조건에 따른 페이징 객체 생성
	 * @param curPage - 현재페이지 정보
	 * @param search - 검색어
	 * @param category - 카테고리
	 * @return - 조건에 따른 페이징 객체
	 */
	public Paging getFreeBoardPaging(Paging curPage, String search, String category);
	
	/**
	 * 자유게시판 상세보기
	 * 
	 * @param freeBoard - 보드 넘버가 담긴 자유게시판객체
	 * @return 조회된 자유게시판
	 */
	public FreeBoard getFreeBoardView(FreeBoard freeBoard);
	
	/**
	 * 
	 * 자유게시판 작성자 조회
	 * 
	 * @param freeBoard 유저 넘버가 담긴 보드 객체
	 * @return - 조회된 멤버
	 */
	public Member getMemberByFreeBoardNo(FreeBoard freeBoard);

	/**
	 * 유저 아이디를 이용하여 유저번호 갖고오기
	 * 
	 * @param userid - 유저번호를 조회할 아이디(로그인한 아이디)
	 * @return 유저번호
	 */
	public int getUserNo(String userId);

	/**
	 * 사용자가 입력한 본문 내용을 저장한다
	 * 
	 * @param cafeRev - 사용자가 입력한 본문
	 */
	public void joinCafeReview(CafeRev cafeRev);

	/**
	 * 작성자 아이디 불러오기
	 * 
	 * @param cafeRev - 조회할 게시글
	 * @return 조회된 작성자 아이디
	 */
	public String getWriterId(CafeRev cafeRev);

	/**
	 * 게시글 삭제하기
	 * 
	 * @param cafeRev - 삭제할 게시글 번호를 담은 객체
	 */
	public void dropCafeReview(CafeRev cafeRev);
	
	/**
	 * 자유게시판 삭제
	 * @param freeBoard - 보드넘버를 가진 객체
	 */
	public void dropFreeBoard(FreeBoard freeBoard);
	
	/**
	 * 조회수 증가
	 * @param freeBoard - 보드 넘버 
	 */
	public void freeBoardHitUp(FreeBoard freeBoard);
	
	/**
	 * 
	 * 게시판 댓글 조회
	 * 
	 * @param freeBoard - freeBoard 유저 넘버가 담긴 보드 객체
	 * @return 조회된 댓글 리스트
	 */
	public List<FreeBoardComment> getFreeBoardCommentList(FreeBoard freeBoard);
	
	/**
	 *  자유게시판 댓글 등록
	 * @param freeBoard - 보드번호
	 * @param freeBoardComment - 댓글 내용
	 * @param session - 유저
	 */
	public void joinFreeBoardComment(FreeBoard freeBoard,FreeBoardComment freeBoardComment, HttpSession session);
	
	/**
	 * 댓글번호로 댓글 삭제
	 * @param freeBoardComment - 댓글번호 있는 객체
	 */
	public void dropFreeBoardComment(FreeBoardComment freeBoardComment);
	
	/**
	 * 보드 인서트
	 * @param freeBoard - 제목,컨텐츠,카테고리 있음
	 * @param session - 유저 정보 있음
	 */
	public void joinFreeBoard(FreeBoard freeBoard, HttpSession session);
	
	/**
	 * 보드 수정
	 * @param freeBoard - 보드넘버,제목,내용 있음
	 */
	public void changeFreeBoard(FreeBoard freeBoard);
	
	/**
	 * 자유 게시판 추천
	 * @param freeBoard - 보드넘버
	 * @param session - 아이디 가져올거임
	 * @return
	 */
	public boolean isFreeBoardRec(FreeBoard freeBoard,HttpSession session);
	
	/**
	 * 자유 게시판 추천 체크
	 * @param freeBoard - 보드넘버
	 * @param session - 아이디 가져올거임
	 * @return
	 */
	public boolean isFreeBoardRecCheck(FreeBoard freeBoard,HttpSession session);
	
	/**
	 * 자유 게시판 추천수
	 * @param freeBoard - 보드 넘버 있음
	 * @return
	 */
	public int getFreeBoardRecCount(FreeBoard freeBoard);
	
	/**
	 * 카페 리뷰 수정하기
	 * 
	 * @param cafeRev 수정할 게시글 번호
	 */
	public void changeCafeReview(CafeRev cafeRev);


	/**
	 * 카페리뷰 페이징
	 * 
	 * @param curPage - 현재페이지정보
	 * @param category - 카테고리
	 * @param order - 정렬방법
	 * @param search - 검색어
	 * @return 페이징 객체
	 */
	public Paging getCafeReviewPaging(Paging curPage, String category, String order, String search);
	
}













