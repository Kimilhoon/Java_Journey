package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CafeDao;
import web.service.face.CafeService;

@Service
@Slf4j
public class CafeServiceImpl implements CafeService {
	
	@Autowired private CafeDao dao;
	
}
