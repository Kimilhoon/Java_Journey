package web.manager.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dto.BeanSub;
import web.dto.Member;
import web.manager.dao.face.ManagerDao;
import web.manager.service.face.ManagerService;
import web.util.Paging;

@Service
@Slf4j
public class ManagerServiceImpl implements ManagerService {
	//	
	@Autowired private ManagerDao dao;
	@Autowired private HttpServletRequest req;

	@Override
	public Paging getPaging(HttpServletRequest req) {
		String param = req.getParameter("curPage");
		int curPage = 0;

		if ( param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		} else {
			log.info("curPage 값이 null이거나 비어있음");
		}

		//유저 데이터 총 합 조회하기 
		int totalCount = dao.selectCntAll();

		//페이징 계산하기
		Paging paging = new Paging(curPage, totalCount);		

		return paging;
	}

	@Override
	public List<Member> selectAll(Paging paging) {
		return dao.selectAllUser(paging);
	}

	@Override
	public boolean userCancelByUserNo(List<Integer> userNo) {
		for(Integer No : userNo) {
			if( dao.selectByUserNoForStatus(No)) {
				//user의 상태가 N인 경우 
				log.info("이미 비활성화된 유저입니다");
				return false;
			} else {
				dao.updateUserStatus(No);
			}
		}// for(Integer No : userNo) End
		return true;
	} //userCancelByUserNo end
	
	@Override
	public boolean userReviveByUserNo(List<Integer> userNo) {
		for(Integer No : userNo) {
			if( dao.selectByUserNoForStatus(No)) {
				//user의 상태가 N인 경우 
				dao.updateUserStatus(No);
			} else {
				log.info("이미 활성화된 유저입니다");
				return false;
			}
		}// for(Integer No : userNo) End
		return true;
	}
	
	@Override
	public Paging getBeanSubPaging(HttpServletRequest req) {
		String param = req.getParameter("curPage");
		int curPage = 0;

		if ( param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		} else {
			log.info("curPage 값이 null이거나 비어있음");
		}

		//유저 데이터 총 합 조회하기 
		int totalCount = dao.selectCntBeanSubAll();

		//페이징 계산하기
		Paging paging = new Paging(curPage, totalCount);		

		return paging;
	}

	@Override
	public List<BeanSub> selectBeanSubAll(Paging paging) {
		return dao.selectAllBeanSubUser(paging);
	}
	
	@Override
	public boolean subCancelBySubNo(List<Integer> subNo) {
		for(Integer No : subNo) {
//			if( dao.selectBeanSubCancelByBeanSub(No)) {
//				log.info("구독을 이미 취소한 유저");
//				return false;
//			} else {
//				
//			}
			if( No == null) {
				return false;
			} else {
				dao.subNoSubCancenBySubNoForUpdate(No);
				
			}
			
		}
		return true;
	}
	
}








