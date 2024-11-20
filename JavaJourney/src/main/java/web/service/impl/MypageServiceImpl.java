package web.service.impl;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MypageDao;
import web.dto.BeanRev;
import web.dto.BeanSub;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;
import web.dto.Member;
import web.dto.MemberQuizResult;
import web.dto.MyRecipe;
import web.service.face.MypageService;
import web.util.Paging;

@Service
@Slf4j
public class MypageServiceImpl implements MypageService {
	
	@Autowired private MypageDao dao;

	@Override
	public List<MemberQuizResult> selectByUserNoQuizeResult(int userNo) {
		return dao.selectMyQuizeResult(userNo);
	}
	
	@Override
	public List<BeanSub> selectMyBeanSub(int userNo) {
		return dao.selectMyBeanSubResult(userNo);
	}
	
	@Override
	public void subCancelBySubNo(List<Integer> subNo) {
		for(Integer No : subNo) {
			dao.subCancel(No);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	public List<CafeWish> selectByLikeCafe(int userNo, String searchText) {
		return dao.selectByUserLikeCafe(userNo, searchText);
	}
	
	@Override
	public List<BeanWish> selectByLikeBean(int userNo) {
		return dao.selectByUserLikeBean(userNo);
	}

	@Override
	public List<CafeRev> selectCafeRevByUserNo(int userNo) {
		return dao.selectCafeRevByUserNo(userNo);
	}


	@Override
	public List<BeanRev> selectBeanRevByUserNo(int userNo) {
		return dao.selectBeanRevByUserNo(userNo);
	}


	@Override
	public List<FreeBoard> selectFreeBoardByUserNo(int userNo) {
		return dao.selectFreeBoardByUserNo(userNo);
	}


	@Override
	public List<MyRecipe> selectMyRecipeByUserNo(int userNo) {
		return dao.selectMyRecipeByUserNo(userNo);
	}

	@Override
	@Transactional
	public void outMember(int userNo) {
		dao.changeStatus(userNo);
	}








}
