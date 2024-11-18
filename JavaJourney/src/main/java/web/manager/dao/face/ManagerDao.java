package web.manager.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.BeanSub;
import web.dto.Member;
import web.util.Paging;

@Mapper
public interface ManagerDao {
//	
	/**
	 * 유저 데이터 총 합 조회하기 
	 * @return
	 */
	public int selectCntAll();
	
	/**
	 * DB에서 모든 유저 정보 조회
	 * @param paging 
	 * @return
	 */
	public List<Member> selectAllUser(Paging paging);
	
	/**
	 * beanSub에 userNo가 있다면 메소드 중단!
	 * @param no
	 * @return
	 */
	public boolean selectBeanSubByUserNo(Integer no);
	
	/**
	 * 선택받은 아이들 DB에서 탈퇴시키기 
	 * @param no
	 */
	public void deleteUserNo(Integer no);
	
	/**
	 * 구독유저 페이징
	 * @return
	 */
	public int selectCntBeanSubAll();
	
	/**
	 * DB에서 모든 구독 유저 조회
	 * @param paging
	 * @return
	 */
	public List<BeanSub> selectAllBeanSubUser(Paging paging);
	
	/**
	 * 구독유저가 이미 취소되었는지 확인하기 ( 오류 방지용 )
	 * @param no
	 * @return
	 */
	public boolean selectBeanSubCancelByBeanSub(Integer no);
	
	/**
	 * 구독유저를 취소로 바꾸기
	 * @param no
	 */
	public void subNoSubCancenBySubNoForUpdate(Integer no);

	

	

	
}
