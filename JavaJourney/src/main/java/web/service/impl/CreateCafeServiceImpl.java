package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CreateCafeDao;
import web.dto.Cafe;
import web.dto.CafeImg;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.service.face.CreateCafeService;

@Service
@Slf4j
public class CreateCafeServiceImpl implements CreateCafeService{

	@Autowired CreateCafeDao dao;

	@Override
	@Transactional
	public void insertCafe(Cafe cafe, CafeImg cafeImg) {
		log.info("insertcafeImg:{}", cafe);
		dao.insertCafeImg(cafeImg);
		
		int selectedCafeImgNo = dao.selectByLatest();
		log.info("selectedCafeImgNo : {}",selectedCafeImgNo);
		
		cafe.setImgNo(selectedCafeImgNo);
		log.info("cafe : {}",cafe);
		
		dao.insertCafe(cafe);
	}

	@Override
	public Cafe view(Cafe cafe) {
		return dao.selectByCafeNo(cafe);
	}
	
	@Override
	@Transactional
	public void update(Cafe cafe, CafeImg cafeImg) {
		dao.insertCafeImg(cafeImg);
		int selectedCafeImgNo = dao.selectByLatest();
		cafe.setImgNo(selectedCafeImgNo);
		
		dao.updateCafe(cafe);
	}
	
	@Override
	public void deleteCafe(int cafeNo) {
		dao.updateCafeStatus(cafeNo);
	}
	
//	@Override
//	@Transactional
//	public void delete(Cafe cafe, CafeImg cafeImg, CafeRev cafeRev, CafeRevComm cafeRevComm) {
//		dao.deleteCafeRev(cafeRev);
//		dao.deleteCafeRevComm(cafeRevComm);
//		dao.deleteCafe(cafe);
//	}
	
	
//	@Override
//	@Transactional
//	public void delete(Cafe cafe, CafeImg cafeImg, CafeRev cafeRev, CafeRevComm cafeRevComm) {
//		dao.deleteCafeRev(cafeRev);
//		dao.deleteCafeRevComm(cafeRevComm);
//		dao.deleteCafe(cafe);
//		dao.deleteCafeImg(cafeImg);
//	}



}
