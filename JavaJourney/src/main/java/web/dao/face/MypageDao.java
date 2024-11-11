package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.BeanWish;
import web.dto.CafeWish;

@Mapper
public interface MypageDao {
	
	/**
	 * 유저가 찜한 카페 DB에서 조회하기
	 * @param userNo 
	 * @return
	 */
	List<CafeWish> selectByUserLikeCafe(int userNo);
	
	/**
	 * 유저가 찜한 원두 DB에서 조회하기
	 * @param userNo
	 * @return
	 */
	List<BeanWish> selectByUserLikeBean(int userNo);
	
	
	
}
