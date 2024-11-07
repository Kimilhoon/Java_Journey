package web.service.face;

import java.util.List;

import web.dto.Bean;
import web.dto.BeanImg;

public interface CreateBeanService {
	
	/**
	 * 원두(구독) 글 삽입 로직
	 * DTO 중 파일(이미지)자료형 String beanOriginName;
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @param beanImg 
	 * @return 
	 */
	public void insertBean(BeanImg beanImg, Bean bean);
	
	/**
	 * DTO 중 파일(이미지)자료형 String beanInfo;
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @return 
	 */
	public Bean updateBean(Bean bean);
	
	/**
	 * beanNo를 전달받아 해달 원두글을 삭제
	 * @param beanNo
	 */
	public void beanDelete(int beanNo);
	
	

}
