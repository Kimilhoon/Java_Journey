package web.dao.face;

import web.dto.Bean;

public interface CreateBeanDao {
	
	/**
	 * DTO에 담긴 Bean, DB에 삽입하기
	 * @param bean - - beanName, origin, beanComm, beanPrice, businessNo
	 */
	public void insertBeanData(Bean bean);

}
