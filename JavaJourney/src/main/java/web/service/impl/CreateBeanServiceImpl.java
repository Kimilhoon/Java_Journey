package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CreateBeanDao;
import web.dto.Bean;
import web.service.face.CreateBeanService;

@Service
@Slf4j
public class CreateBeanServiceImpl implements CreateBeanService{

	@Autowired CreateBeanDao dao; 
	
		@Override
		public void insertBean(Bean bean) {
			log.info("bean: {}",bean);
			dao.insertBeanData(bean);
	}
	
}
