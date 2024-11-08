package web.dao.face;

import java.util.List;

import web.dto.Bean;
import web.dto.BeanImg;

public interface CreateBeanDao {
	
	/**
	 * DB에 이미지 문자열을 삽입하면서 FK의 값도 부여하기
	 * @param beanImg
	 * @return 
	 */
	public void insertBeanImg(BeanImg beanImg);
	
	/**
	 * DB에서 방금(최신순) 삽입한 이미지의 번호를 가져온다
	 * @return
	 */
	public int selectByLatest();
	
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
