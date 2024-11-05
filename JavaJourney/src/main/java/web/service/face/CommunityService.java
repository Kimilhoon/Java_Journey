package web.service.face;

import java.util.List;

import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
import web.dto.Member;
import web.util.Paging;

public interface CommunityService {
	
	/**
	 * 협약 카페리뷰 리스트 불러오기
	 * 
	 * @param category - 카테고리
	 * @param order - 정렬순
	 * @param search - 검색
	 * @return 카페리뷰 리스트
	 */
	public List<FreeBoard> getCafeReviewList(String category, String order, String search);
	
	

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
	 * 
	 * 조건에 따른 자유게시판 리스트 조회
	 * 
	 * @param paging - 카테고리, 검색어로 필터링한 페이징 객체
	 * @param search - 검색어
	 * @return - 필터링된 자유게시판 리스트
	 */
	public List<FreeBoard> getFreeBoardList(Paging paging , String search);
	
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
	
	
	
}
