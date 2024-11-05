package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CommunityDao;
import web.dto.Bean;
import web.service.face.CommunityService;

@Service
@Slf4j
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired private CommunityDao dao;
//	@Autowired private ServletContext context;
	
	@Override
	public void insertBean(Bean bean) {
		log.info("bean: {}",bean);
		dao.insertBeanData(bean);
	}
}
