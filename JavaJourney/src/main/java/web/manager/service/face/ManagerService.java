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
	 * @param search 
	 * @return
	 */
	public Paging getPaging(HttpServletRequest req, String search);
	
	/**
	 * 모든 유저 정보 조회
	 * @param paging 
	 * @return
	 */
	public List<Member> selectAll(Paging paging);

	/**
	 * ajax로 받은 userNo를 비활성화하기
	 * @param userNo
	 * @return 
	 */
	public boolean userCancelByUserNo(List<Integer> userNo);
	
	/**
	 * ajax로 받은 userNo를 활성화 하기
	 * @param userNo
	 * @return
	 */
	public boolean userReviveByUserNo(List<Integer> userNo);

	
	/**
	 * 구독유저 페이징
	 * @param req
	 * @param search 
	 * @return
	 */
	public Paging getBeanSubPaging(HttpServletRequest req, String search);

	
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

	/**
	 * 유저관리에서 회원닉네임으로 검색
	 * @param search
	 * @param paging
	 * @return
	 */
	public List<Member> searchByUserNick(String search, Paging paging);

	/**
	 * 구독관리에서 회원닉네임으로 검색
	 * @param search
	 * @param paging
	 * @return
	 */
	public List<BeanSub> searchsubuserByUserNick(String search, Paging paging);
	
	
}
