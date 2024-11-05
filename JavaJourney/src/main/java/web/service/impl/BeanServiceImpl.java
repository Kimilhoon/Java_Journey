package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.BeanDao;
import web.service.face.BeanService;

@Service
@Slf4j
public class BeanServiceImpl implements BeanService {
	
	@Autowired private BeanDao dao;
	
}
