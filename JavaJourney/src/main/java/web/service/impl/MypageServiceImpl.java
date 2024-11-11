package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MypageDao;
import web.dto.Member;
import web.service.face.MypageService;

@Service
@Slf4j
public class MypageServiceImpl implements MypageService {
	
	@Autowired private MypageDao dao;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진주-----------------------------------
//	@Override
//	public Member infoView(Member member) {
//		return dao.selectByUserNo(member);
//	}


//	@Override
//	public Member getInfoByUserNo(Member userNo) {
//		return dao.getInfoByUserNo(userNo);
//	}


//	@Override
//	public Member getInfoByUserNo(int userNo) {
//		return dao.getInfoByUserNo(userNo);
//	}


	@Override
	public Member findByUserId(String userId) {
		return dao.findByUserId(userId);
	}
	
}
