package web.dao.face;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Bean;

@Mapper
public interface CommunityDao {

	/**
	 * DTO에 담긴 Bean, DB에 삽입하기
	 * @param bean - - beanName, origin, beanComm, beanPrice, businessNo
	 */
	public void insertBeanData(Bean bean);
	
	
	
}
