package web.dao.face;

import java.util.List;

import web.dto.Bean;
import web.dto.BeanImg;
import web.dto.BeanTaste;
import web.dto.CupNote;

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
	 * beanNo와 cupNoteNo를 받아서 beanTaste DB에 삽입하기
	 * cupNoteNo는 한번 반복
	 * @param beanTaste
	 */
	public void insertBeanTaste(BeanTaste beanTaste);
	
	/**
	 * BeanNo를 넘겨받아 DB에서 선택한 BeanNo와 BeanImgNo를 조회 및 반환
	 * @param beanNo 
	 * @return
	 */
	public List<Bean> selectByBeanNo(int beanNo);
	
	/**
	 * 수정데이터를 넘겨받아 이미지 DB 수정(PK번호는 그대로 유지)
	 * @param beanImg
	 */
	public void updateBeanImg(BeanImg beanImg);
	
	/**
	 * DTO에 담긴 Bean, DB에 수정하기
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 * @return 
	 */
	public void updateBeanData(Bean bean);
	
	/**
	 * 원본 원두데이터를 보존하는 방식으로
	 * 상태를 비활성화 상태로 두는 방법
	 * @param beanNo
	 */
	public void updateBeanStatusByBeanNo(int beanNo);
	
	/**
	 * 원두의 수정된 맛을 update보다는
	 * delete로 하여 다시 삽입해주는 방식으로 가기
	 * @param beanNo
	 */
	public void deleteByBeanTasteNo(int beanNo);
	
	/**
	 * 넘겨받은 beanNo를 DB에 조건절로 주어서 행(데이터) 삭제
	 * @param beanNo
	 */
//	public void deleteByBeanNo(int beanNo);
	
	/**
	 * 넘겨받은 beanImg를 DB에 조건절로 주어서 행(데이터) 삭제
	 * @param beanImg
	 */
//	public void deleteByBeanImgNo(int beanImg);

	
	


}
