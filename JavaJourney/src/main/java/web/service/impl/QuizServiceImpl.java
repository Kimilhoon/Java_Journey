package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.QuizDao;
import web.service.face.QuizService;

@Service
@Slf4j
public class QuizServiceImpl implements QuizService {
	
	@Autowired private QuizDao dao;
	
}
