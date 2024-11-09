package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CreateBeanDao;
import web.dto.Bean;
import web.dto.BeanImg;
import web.dto.BeanTaste;
import web.dto.CupNote;
import web.service.face.CreateBeanService;

@Service
@Slf4j
public class CreateBeanServiceImpl implements CreateBeanService{

	@Autowired CreateBeanDao dao; 

	@Override
	public void insertBean(BeanImg beanImg, Bean bean, List<Integer> cupNote) {
		//과정
		//글작성시 Bean, BeanImg, cupNoteName데이터를 받음
		//BeanImg를 먼저 DB에 삽입 -> 삽입된 FK를 최신순으로 rownum으로 받음 -> FK를 bean에 set해서 삽입
		//cupNoteName과 원두번호를 BeanTaste DB에 삽입
		
		log.info("insertBeanImg: {}",bean);
		dao.insertBeanImg(beanImg);

		int selectedbeanImgNo = dao.selectByLatest();
		log.info("selectedbeanImgNo : {}",selectedbeanImgNo);

		
		//삭제예정------------------------------------------
//		dao.insertCupNoteName(cupNote);
		//삭제예정------------------------------------------
		
		bean.setBeanImgNo(selectedbeanImgNo);
		log.info("bean : {}",bean);

		dao.insertBeanData(bean);
		
		log.info("cupNoteName[0] : {}",cupNote.get(0));
		log.info("cupNoteName[1] : {}",cupNote.get(1));
		
		BeanTaste beanTaste = new BeanTaste(); 
		beanTaste.setBeanNo(bean.getBeanNo());
//		beanTaste.setCupNoteNo(cupNote.get(0));
//		beanTaste.setCupNoteNo(cupNote.get(1));
		 
		log.info("beanTaste : {}",beanTaste);
		
		for (Integer cupNoteName : cupNote) {
			beanTaste.setCupNoteNo(cupNoteName);
			log.info("for each [] beanTaste : {}",beanTaste);
			dao.insertBeanTaste(beanTaste);
		}
		
	}

	@Override
	public Bean updateBean(BeanImg beanImg, Bean bean, CupNote cupNote) {
		log.info("updateBeanImg: {}",beanImg);
		dao.updateBeanImg(beanImg);
		
		log.info("updateCupNoteName : {}",cupNote);
		dao.updateCupNoteName(cupNote);

		log.info("updatebean: {}",bean);
		return dao.updateBeanData(bean);	
	}

	@Override
	public void beanDelete(int beanNo, int beanImg, int cupNoteNo) {
		log.info("No: {}", beanNo); log.info("No: {}", beanImg); log.info("No: {}", cupNoteNo);
		dao.deleteByBeanNo(beanNo);
		dao.deleteByBeanImgNo(beanImg);
		dao.deleteByCupNoteNo(cupNoteNo);
		log.info("deletecupNoteNo: {}", cupNoteNo);
	}


}