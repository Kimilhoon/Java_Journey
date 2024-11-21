package web.dao.face;

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



	
	
	
	
} // interface end
