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
	public Paging getBeanSubPage(Paging curPage, int userNo) {
		
		if( curPage.getCurPage() == 0 ) {
			curPage.setCurPage(1);
			//만약 현재페이지가 0이라면 1페이지로 set
		}
		//전체 데이터 수 조회, 유저(userNo)가 구독한 원두 데이터들
		//count(*)하기
		int totalCnt = dao.getBeanSubTotalCnt(userNo);
		
		//페이징 객체 : 현재페이지 / 전체 데이투 수
		// 보여질 글(데이터) 수 / 페이지네이션의 숫자( 하단 페이지 숫자 )
		Paging paging = new Paging(curPage.getCurPage(),totalCnt,5,10);
		
		return paging;
	}
	
	@Override
	public List<BeanSub> selectMyBeanSub(int userNo, Paging paging) {
		//기본적으로 DB필터가 없으니 페이징 매개변수만 넣어줌
		//만약 필터링을 넣어주면 Map을 사용해야할듯?
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("paging", paging);
		
		return dao.selectMyBeanSubResult(map);
	}
	
	@Override
	public void updateSubCancelBySubNo(List<Integer> subNo) {
			for(Integer No : subNo) {
				dao.subUpdateCancel(No);
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
		dao.changeFreeNick(userNo);
		dao.changeMyrepNick(userNo);
	}

	@Override
	public void updateCommNickTag(String userNick) {
		dao.changeFreeCommNickTag(userNick);
		dao.changeMyrecipeCommNickTag(userNick);
	}








}
