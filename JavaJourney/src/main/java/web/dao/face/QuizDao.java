package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Bean;
import web.dto.Member;
import web.dto.QuizResult;

@Mapper
public interface QuizDao {

	/**
	 * userId로 userNo 조회하기
	 * 
	 * @param userId - 전달받은 userId
	 * @return userNo
	 */
	public Member selectUserNoByUserId(String userId);


	/**
	 * 퀴즈 저장
	 * 
	 * @param param - 전달받은 퀴즈 정보
	 */
	public void insertQuizResult(QuizResult param);

	
	/**
	 * 전달된 데이터로 원두 조회
	 * 
	 * @param param - 전달된 퀴즈 데이터
	 * @return 조회된 원두
	 */
	public List<Bean> selectBeanByCupnoteNo(QuizResult param);


	/**
	 * 전달된 quizResultNo에 beanNo 업데이트
	 * 
	 * @param param - 전달된 데이터
	 */
	public void updateBeanNoByQuizResultNo(QuizResult param);


	/**
	 * 전달된 데이터 삽입하기
	 * 
	 * @param map
	 */
	public void insertMemberQuizResult(HashMap<String, Integer> map);


	/**
	 * 전달된 데이터로 변경하기
	 * 
	 * @param map
	 */
	public void updateMemberQuizResult(HashMap<String, Integer> map);


	/**
	 * 퀴즈 결과 있고 없음 확인
	 * 
	 * @param param
	 * @return
	 */
	public int countQuizResultNo(HashMap<String, Integer> map);


	/**
	 * 퀴즈 결과가 있으면 삭제하기
	 * 
	 * @param map
	 */
	public void deleteMemberQuizResult(HashMap<String, Integer> map);



	
	
	
	
} // interface end
