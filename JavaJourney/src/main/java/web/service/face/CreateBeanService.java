package web.service.face;

import java.util.List;

import web.dto.Bean;
import web.dto.BeanImg;
import web.dto.CupNote;

public interface CreateBeanService {
	
	/**
	 * 원두(구독) 글 삽입 로직
	 * DTO 중 파일(이미지)자료형 String beanOriginName;
	 * DTO 중 cupNote - String cupNoteName
	 * @param beanImg - String beanOriginName
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @param cupNotes - String cupNoteName
	 * @return 
	 */
	public void insertBean(BeanImg beanImg, Bean bean, List<Integer> cupNotes);
	
	/**
	 * 원두 글 수정 로직
	 * DTO 중 파일(이미지)자료형 String beanInfo;
	 * DTO 중 cupNote - String cupNoteName
	 * @param beanImg - String cupNoteName
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @param cupNote - String cupNoteName
	 * @return 
	 */
	public Bean updateBean(BeanImg beanImg, Bean bean, CupNote cupNote);
	
	/**
	 * beanNo를 전달받아 해달 원두글을 삭제
	 * @param beanNo
	 * @param beanImg 
	 * @param cupNote 
	 */
	public void beanDelete(int beanNo, int beanImg, int cupNote);
	
	

}
