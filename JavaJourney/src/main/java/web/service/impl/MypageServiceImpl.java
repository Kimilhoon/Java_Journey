package web.service.impl;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MypageDao;
import web.dto.BeanRev;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;
import web.dto.Member;
import web.dto.MyRecipe;
import web.service.face.MypageService;
import web.util.Paging;

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
	public void leaveMember(Integer userNo) {
		dao.deleteMemberByUserNo(userNo);
		
	}


	@Override
	public Paging getMyViewPaging(Paging curPage, String category, String search) {
		
		if(curPage.getCurPage()==0) { //페이지설정 되지 않았을때 1번페이지 보여줌
			curPage.setCurPage(1);
		}
		
		if(category == null || "".equals(category)||"전체".equals(category)) { //카테고리 null, 빈문자열, all일 경우 N으로 설정
			category = "N";
		}
//			else if(category.equals("카페리뷰")) {
//			category="카페리뷰";
//		}else if(category.equals("원두리뷰")) {
//			category="원두리뷰";
//		}else if(category.equals("자유게시판")) {
//			category="자유게시판";
//		}else if(category.equals("나만의레시피")) {
//			category="나만의레시피";
//		}
		
		if(search == null || "".equals(search)) { //검색어 null, 빈문자열일 경우 N으로 설정
			search = "N";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("category", category);
		
		//전체 게시글 수 구하기
		int totalCnt = dao.getMyViewTotalCnt(map);
		
	    Paging paging = new Paging(curPage.getCurPage(), totalCnt, 10, 10);
	    //curPage.getCurPage():현재페이지번호, totalCnt:전체게시글수, curPage.getListCount():한페이지에표시할게시글수, curPage.getPageCount():한페이지에보여줄페이지번호수
	    log.info("paging : {}", paging);
	    
		return paging;
	}





}
