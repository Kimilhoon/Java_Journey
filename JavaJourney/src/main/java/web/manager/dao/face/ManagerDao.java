package web.manager.dao.face;

import java.util.HashMap;
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
	 * @param map 
	 * @return
	 */
	public int selectCntAll(HashMap<String, String> map);
	
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
	public boolean selectByUserNoForStatus(Integer no);
	
	/**
	 * 선택받은 아이들 DB에서 탈퇴시키기 
	 * @param no
	 */
	public void updateUserStatus(Integer no);
	
	/**
	 * 구독유저 페이징
	 * @param map 
	 * @return
	 */
	public int selectCntBeanSubAll(HashMap<String, String> map);
	
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

	/**
	 * 검색 조건에 따라 유저 관리 회원 조회
	 * @param map
	 * @return
	 */
	public List<Member> selectByUserNick(HashMap<String, Object> map);

	/**
	 * 검색 조건에 따라 구독 관리 회원 조회
	 * @param map
	 * @return
	 */
	public List<BeanSub> selectsubuserByUserNick(HashMap<String, Object> map);

	

	

	
}
