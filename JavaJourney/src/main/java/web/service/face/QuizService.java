package web.service.face;

import java.util.HashMap;
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


	/**
	 * 전달받은 quizResultNo에 beanNo 업데이드
	 * 
	 * @param param - 전달 받은 데이터
	 */
	public void updateBeanNo(QuizResult param);


	/**
	 * 전달 받은 데이터 삽입하기
	 * 
	 * @param map - 전달받은 데이터
	 */
	public void insertMemberQuizResult(HashMap<String, Integer> map);


	/**
	 * 수행한 퀴즈가 있는지 없는지 확인
	 * 
	 * @param param
	 * @return
	 */
	public boolean countQuizResultNo(HashMap<String, Integer> map);


	/**
	 * 퀴즈 결과가 있으면 삭제하기
	 * 
	 * @param map
	 */
	public void deleteMemberQuizResult(HashMap<String, Integer> map);



	
	
	
} // interface end
