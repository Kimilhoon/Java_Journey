package web.manager.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.BeanSub;
import web.dto.Member;
import web.util.Paging;

public interface ManagerService {
//	
	/**
	 * 현재 페이지를 전달받아 처리하기
	 * @param req
	 * @return
	 */
	public Paging getPaging(HttpServletRequest req);
	
	/**
	 * 모든 유저 정보 조회
	 * @param paging 
	 * @return
	 */
	public List<Member> selectAll(Paging paging);

	/**
	 * ajax로 받은 userNo를 
	 * @param userNo
	 * @return 
	 */
	public boolean userCancelByUserNo(List<Integer> userNo);
	
	/**
	 * 구독유저 페이징
	 * @param req
	 * @return
	 */
	public Paging getBeanSubPaging(HttpServletRequest req);

	
	/**
	 * 모든 구독유저 정보 조회
	 * @param paging
	 * @return
	 */
	public List<BeanSub> selectBeanSubAll(Paging paging);
	
	/**
	 * 구독유저 취소
	 * @param subNo
	 * @return
	 */
	public boolean subCancelBySubNo(List<Integer> subNo);
	

	
	
}
