package web.service.face;

import java.util.List;

import web.dto.FreeBoard;

public interface CommunityService {
	
	/**
	 * 협약 카페리뷰 리스트 불러오기
	 * 
	 * @param order - 정렬순
	 * @param search - 검색
	 * @return 카페리뷰 리스트
	 */
	public List<FreeBoard> getCafeReviewList(String order, String search);
	
	
	public List<FreeBoard> getFreeBoardList();
	
	
	
}
