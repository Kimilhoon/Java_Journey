package web.service.face;

import java.util.List;

import web.dto.Bean;
import web.dto.BeanRev;
import web.util.Paging;

public interface BeanService {
	
	/**
	 * 페이징 객체 생성
	 * @param param - 요청 정보 객체 
	 * 
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(Paging param);

	
	/**
	 * 모든 원두 조회
	 * @param paging 
	 * @return 조회한 원두
	 */
	public List<Bean> getAllBean(Paging paging);


	/**
	 * BeanNo를 전달 받아 bean 조회
	 * 
	 * @param param - 전달받은 beanNo
	 * @return 원두 정보
	 */
	public Bean getBeanInfo(Bean param);

	
	
} // interface end
