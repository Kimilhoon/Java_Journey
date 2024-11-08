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
	public void insertBean(BeanImg beanImg, Bean bean) {
		//과정
		//글작성시 Bean과 BeanImg데이터를 받음
		//BeanImg를 먼저 DB에 삽입 -> 삽입된 FK를 최신순으로 rownum으로 받음 -> FK를 bean에 set해서 삽입
			log.info("insertbean: {}",bean);
			dao.insertBeanImg(beanImg);
			int selectedbeanImgNo = dao.selectByLatest();
			log.info("selectedbeanImgNo : {}",selectedbeanImgNo);
			bean.setBeanImgNo(selectedbeanImgNo);
			log.info("bean : {}",bean);
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