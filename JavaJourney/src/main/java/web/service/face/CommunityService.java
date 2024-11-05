package web.service.face;

import web.dto.Bean;

public interface CommunityService {
	
	/**
	 * 원두(구독) 글 삽입 로직
	 * DTO 중 파일(이미지)자료형 MultipartFile beanInfo;
	 * @param bean - beanName, origin, beanComm, beanPrice, businessNo
	 */
	public void insertBean(Bean bean);
	
	
	
}
