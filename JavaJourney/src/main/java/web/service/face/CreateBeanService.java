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
	 * 원두 글 수정시 수정페이지에서
	 * 원두번호를 DB에서 조회함
	 * @return
	 */
	public List<Bean> selectBeanNo(int beanNo);
	
	/**
	 * 원두 글 수정 로직
	 * DTO 중 파일(이미지)자료형 String beanInfo;
	 * DTO 중 cupNote - String cupNoteName
	 * @param beanImg 
	 * @param beanImg - String cupNoteName
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @param cupNotes - String cupNoteName
	 * @return 
	 */
	public void updateBean(BeanImg beanImg, Bean bean, List<Integer> cupNotes);
	
	/**
	 * beanNo를 전달받아 BeanTaste -> Bean -> BeanImg 순으로 삭제--취소선
	 * 11.20 : 원래는 위에 처럼 삭제하려고 했으나 데이터 보존을 위해
	 * 활성화상태('Y')를 비활성화상태('N')로 변경할 것
	 * 따라서 데이터 보존은되면서 논리적인 삭제로만 진행! 
	 * @param beanNo
	 */
	public void beanDelete(int beanNo);

	
	

}
