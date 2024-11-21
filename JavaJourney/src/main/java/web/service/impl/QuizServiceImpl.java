package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.QuizDao;
import web.dto.Bean;
import web.dto.Member;
import web.dto.QuizResult;
import web.service.face.QuizService;

@Service
@Slf4j
public class QuizServiceImpl implements QuizService {
	
	@Autowired private QuizDao dao;

	@Override
	public Member selectUserNoByUserId(String userId) {
		return dao.selectUserNoByUserId(userId);
	} // selectUserNoByUserId(String userId) end

	
	@Override
	public boolean insertQuizResult(QuizResult param) {
		dao.insertQuizResult(param);
		return true;
	}
	
	
	@Override
	public List<Bean> getBeanByCupnoteNo(QuizResult param) {
		return dao.selectBeanByCupnoteNo(param);
	}



	
} // class end
