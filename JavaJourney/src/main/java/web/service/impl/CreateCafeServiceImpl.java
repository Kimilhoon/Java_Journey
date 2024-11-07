package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CreateCafeDao;
import web.dto.Cafe;
import web.service.face.CreateCafeService;

@Service
@Slf4j
public class CreateCafeServiceImpl implements CreateCafeService{

	@Autowired CreateCafeDao dao;

	@Override
	@Transactional
	public void insertCafe(Cafe cafe) {
		
		dao.write(cafe);
	}
}