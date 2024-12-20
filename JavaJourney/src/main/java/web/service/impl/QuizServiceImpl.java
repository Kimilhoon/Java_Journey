package web.service.impl;

import java.util.HashMap;
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


	
	@Override
	public void updateBeanNo(QuizResult param) {
		dao.updateBeanNoByQuizResultNo(param);
	}


	@Override
	public void insertMemberQuizResult(HashMap<String, Integer> map) {
		dao.insertMemberQuizResult(map);
	}


	@Override
	public boolean countQuizResultNo(HashMap<String, Integer> map) {
		int count = dao.countQuizResultNo(map);
		
		log.info("countQuizResultNo: {}", count);
		
		return count > 0;
	}


	@Override
	public void deleteMemberQuizResult(HashMap<String, Integer> map) {
		dao.deleteMemberQuizResult(map);
	}



	
} // class end
