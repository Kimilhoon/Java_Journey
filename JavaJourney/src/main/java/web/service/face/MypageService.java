package web.service.face;

import java.util.List;

import web.dto.BeanWish;
import web.dto.CafeWish;

public interface MypageService {
	
	/**
	 * 내가 찜한 카페 목록 조회하기
	 * @param i 
	 * @param i 
	 * @return
	 */
	List<CafeWish> selectByLikeCafe(int userNo);
	
	/**
	 * 내가찜한 원두 목록 조회하기
	 * @param userNo
	 * @return
	 */
	List<BeanWish> selectByLikeBean(int userNo);
	
	
	
}
