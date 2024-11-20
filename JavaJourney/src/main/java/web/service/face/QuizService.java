package web.service.face;

import web.dto.Member;

public interface QuizService {

	/**
	 * userId를 가지고 userNo 추출하기
	 * 
	 * @param userId - 전달받은 userId
	 * @return userNo
	 */
	public Member selectUserNoByUserId(String userId);
	
	
	
} // interface end
