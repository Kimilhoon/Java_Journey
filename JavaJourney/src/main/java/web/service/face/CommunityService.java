package web.service.face;

import java.util.List;

import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;
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
	public List<FreeBoard> getCafeReviewList(String category, String order, String search, Paging paging);
	
	public List<FreeBoard> getFreeBoardList();

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
	
	
	
}
