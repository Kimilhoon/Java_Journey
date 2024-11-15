package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CreateCafeDao;
import web.dto.Cafe;
import web.dto.CafeImg;
import web.service.face.CreateCafeService;

@Service
@Slf4j
public class CreateCafeServiceImpl implements CreateCafeService{

	@Autowired CreateCafeDao dao;

	@Override
	public void insertCafe(Cafe cafe, CafeImg cafeImg) {
		log.info("insertcafeImg:{}", cafe);
		dao.insertCafeImg(cafeImg);
		
		int selectedCafeImgNo = dao.selectByLatest();
		log.info("selectedCafeImgNo : {}",selectedCafeImgNo);
		
		cafe.setImgNo(selectedCafeImgNo);
		log.info("cafe : {}",cafe);
		
		dao.insertCafe(cafe);
	}

//	@Override
//	public Cafe view(Cafe cafe) {
//		return dao.selectByCafeNo(cafe);
//	}

	@Override
	public Cafe view(Cafe cafe) {
		return dao.selectByCafeNo(cafe);
	}
	
	@Override
	public void update(Cafe cafe) {
		dao.update(cafe);
	}
	
	@Override
	public void delete(Cafe cafe) {
		dao.delete(cafe);
	}

}
