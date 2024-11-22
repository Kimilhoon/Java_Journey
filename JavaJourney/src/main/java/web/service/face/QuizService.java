package web.service.face;

import java.util.List;

import web.dto.Bean;
import web.dto.Member;
import web.dto.QuizResult;

public interface QuizService {

	/**
	 * userId를 가지고 userNo 추출하기
	 * 
	 * @param userId - 전달받은 userId
	 * @return userNo
	 */
	public Member selectUserNoByUserId(String userId);


	/**
	 * 퀴즈 정보 저장하기
	 * 
	 * @param param - 전달 받은 데이터
	 * @return 
	 */
	public boolean insertQuizResult(QuizResult param);

	
	/**
	 * 전달 받은 데이터로 원두 검색하기
	 * 
	 * @param param - 전달받은 데이터
	 * @return 조회된 원두
	 */
	public List<Bean> getBeanByCupnoteNo(QuizResult param);



	
	
	
} // interface end
