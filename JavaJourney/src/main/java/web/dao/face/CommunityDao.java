package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
import web.dto.FreeBoardComment;
import web.dto.Member;

@Mapper
public interface CommunityDao {

	/**
	 * db에 저장된 카페 리뷰 리스트 불러오기
	 * 
	 * @param param - 사용자가 선택한 정렬방법, 검색어
	 * @return 해당 정보가 담긴 리스트
	 */
	public List<CafeRev> selectCafeReview(HashMap<String, Object> param);

	/**
	 * db에 저장된 해당 카페 리뷰 댓글 불러오기
	 * 
	 * @param revNo - 조회할 카페 리뷰 댓글이 담긴 카페 리뷰번호
	 * @return 해당 정보가 담긴 리스트
	 */
	public List<CafeRevComm> selectCafeReviewCommentListByCafeReviewNo(CafeRev revNo);

	/**
	 * 	db에 저장된 카페 리뷰 정보 불러오기
	 * 
	 * @param revNo - 조회할 카페 리뷰 번호
	 * @return 해당 리뷰 정보가 담긴 객체
	 */
	public CafeRev selectCafeReviewInfo(CafeRev revNo);

	/**
	 * 카페번호를 이용하여 카페 이름 불러오기
	 * 
	 * @param cafeNo - 조회할 카페 번호
	 * @return 조회된 카페 이름
	 */
	public String selectCafeNameByCafeNo(Cafe cafeNo);
	
	
	
	
	
	//자유게시판--------------------------------------------------------------------------------------
	/**
	 * 카테고리와 검색어로 필터링된 프리보드리스트 수
	 * 
	 * @param map - 카테고리,검색어 정보 담은 객체
	 * @return 필터링된 보드 갯수
	 */
	public int getFreeBoardTotalCnt(HashMap<String, String> map);
	
	/**
	 * 카테고리와 검색어로 필터링된 자유게시판 리스트
	 * 
	 * @param map - 페이징, 검색어 정보를 담은 객체
	 * @return - 필터링된 보드 리스트
	 */
	public List<FreeBoard> selectFreeBoardListAll(HashMap<String, Object> map);
	
	/**
	 * 자유게시판 번호로 자유게시판 조회
	 * @param freeBoard - 게시판 넘버를 담은 객체
	 * @return - 조회된 객체
	 */
	public FreeBoard selectFreeBoardByFreeBoardNo(FreeBoard freeBoard);
	
	/**
	 * 자유게시판 쓴 유저 정보 조회
	 * 
	 * 
	 * @param freeBoard - 유저 번호가 있는 자유게시판 객체
	 * @return - 조회된 멤버
	 */
	public Member selectMemberByFreeBoardNo(FreeBoard freeBoard);

	
	/**
	 * 자유게시판 삭제
	 * @param freeBoard - 자유게시판 번호가 담긴 객체
	 */
	public void deleteFreeBoardByFreeBoardNo(FreeBoard freeBoard); 
	
	/**
	 * 자유게시판 조회수 증가
	 * @param freeBoard
	 */
	public void updateFreeBoardHitByFreeBoardNo(FreeBoard freeBoard);
	
	/**
	 * 자유게시판 게시글 댓글 리스트 조회
	 * 
	 * @param freeBoard - 보드넘버
	 * @return - 조회된 댓글리스트
	 */
	public List<FreeBoardComment> selectFreeBoardCommentByFreeBoardNo(FreeBoard freeBoard);
	//자유게시판--------------------------------------------------------------------------------------
}




















