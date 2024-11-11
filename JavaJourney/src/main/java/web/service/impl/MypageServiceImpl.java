package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MypageDao;
import web.dto.BeanWish;
import web.dto.CafeWish;
import web.service.face.MypageService;

@Service
@Slf4j
public class MypageServiceImpl implements MypageService {
	
	@Autowired private MypageDao dao;
	
	@Override
	public List<CafeWish> selectByLikeCafe(int userNo) {
		return dao.selectByUserLikeCafe(userNo);
	}
	
	@Override
	public List<BeanWish> selectByLikeBean(int userNo) {
		return dao.selectByUserLikeBean(userNo);
	}
}
