package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.FreeBoard;

@Mapper
public interface CommunityDao {

	/**
	 * db에 저장된 카페 리뷰 리스트 불러오기
	 * 
	 * @param param - 사용자가 선택한 정렬방법, 검색어
	 * @return 해당 정보가 담긴 리스트
	 */
	public List<FreeBoard> selectCafeReview(HashMap<String, String> param);

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
	
	
	
}




















