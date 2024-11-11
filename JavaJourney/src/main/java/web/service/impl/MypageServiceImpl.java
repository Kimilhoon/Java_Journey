package web.service.impl;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MypageDao;
import web.dto.BeanWish;
import web.dto.CafeWish;
import web.dto.Member;
import web.service.face.MypageService;

@Service
@Slf4j
public class MypageServiceImpl implements MypageService {
	
	@Autowired private MypageDao dao;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진주-----------------------------------

	@Override
	public Member findByUserId(String userId) {
		return dao.findByUserId(userId);
	}


	@Override
	public Member findByUserNo(Integer userNo) {
		return dao.findByUserNo(userNo);
	}


	@Override
	public void myinfoUpdate(Member member) {
		dao.myinfoUpdate(member);
	}


	@Override
	public Map<String, Object> checkNick(Member checkNickParam) {
		int cnt = dao.selectByMemberNick(checkNickParam);
		
		Map<String, Object> checkNickResult = new HashMap<String, Object>();
		if(cnt>0) {
			checkNickResult.put("duplicateNick", true);
		} else {
			checkNickResult.put("duplicateNick", false);
		}
		
		return checkNickResult;
	}
	
	@Override
	public List<CafeWish> selectByLikeCafe(int userNo) {
		return dao.selectByUserLikeCafe(userNo);
	}
	
	@Override
	public List<BeanWish> selectByLikeBean(int userNo) {
		return dao.selectByUserLikeBean(userNo);
	}
}
