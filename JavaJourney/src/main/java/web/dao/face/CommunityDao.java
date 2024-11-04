package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.FreeBoard;

@Mapper
public interface CommunityDao {

	/**
	 * db에 저장된 카페 리뷰 리스트 불러오
	 * 
	 * @param param - 사용자가 선택한 정렬방법, 검색어
	 * @return 해당 정보가 담긴 리스트
	 */
	public List<FreeBoard> selectCafeReview(HashMap<String, String> param);
	
	
	
}
