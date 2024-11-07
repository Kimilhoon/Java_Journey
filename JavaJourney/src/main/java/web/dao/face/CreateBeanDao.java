package web.dao.face;

import java.util.List;

import web.dto.Bean;
import web.dto.BeanImg;

public interface CreateBeanDao {
	
	/**
	 * DB에 접속하여 모든 BeanImg를 조회하여
	 * 전체 데이터 받아오기
	 * @return
	 */
	public List<BeanImg> selectAllimg();
	
	/**
	 * DTO에 담긴 Bean, DB에 삽입하기
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @return 
	 */
	public void insertBeanData(Bean bean);
	
	/**
	 * DTO에 담긴 Bean, DB에 수정하기
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @return 
	 */
	public Bean updateBeanData(Bean bean);
	
	/**
	 * 넘겨받은 beanNo를 DB에 조건절로 주어서 행(데이터) 삭제
	 * @param beanNo
	 */
	public void deleteByBeanNo(int beanNo);
	


}
