package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CreateBeanDao;
import web.dto.Bean;
import web.dto.BeanImg;
import web.service.face.CreateBeanService;

@Service
@Slf4j
public class CreateBeanServiceImpl implements CreateBeanService{

	@Autowired CreateBeanDao dao; 
	
	@Override
	public List<BeanImg> selectAllImg() {
		return dao.selectAllimg();
	}
	
	@Override
	public void insertBean(Bean bean) {
			log.info("insertbean: {}",bean);
			dao.insertBeanData(bean);
	}
	
	@Override
	public Bean updateBean(Bean bean) {
			log.info("updatebean: {}",bean);
			return dao.updateBeanData(bean);	
	}
	
	@Override
	public void beanDelete(int beanNo) {
		log.info("deletebeanNo: {}", beanNo);
		dao.deleteByBeanNo(beanNo);
	}
	
	
}