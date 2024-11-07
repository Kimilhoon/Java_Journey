package web.service.face;

import java.util.List;

import web.dto.Bean;
import web.dto.BeanImg;

public interface CreateBeanService {
	
	/**
	 * BeanImg를 전체 조회하여
	 * 전체 데이터 반환하기
	 * @return
	 */
	public List<BeanImg> selectAllImg();
	
	/**
	 * 원두(구독) 글 삽입 로직
	 * DTO 중 파일(이미지)자료형 String beanInfo;
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @return 
	 */
	public void insertBean(Bean bean);
	
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
