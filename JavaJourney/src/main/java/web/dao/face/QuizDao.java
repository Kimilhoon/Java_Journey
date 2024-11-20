package web.dao.face;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Member;

@Mapper
public interface QuizDao {

	/**
	 * userId로 userNo 조회하기
	 * 
	 * @param userId - 전달받은 userId
	 * @return userNo
	 */
	public Member selectUserNoByUserId(String userId);
	
	
	
} // interface end
