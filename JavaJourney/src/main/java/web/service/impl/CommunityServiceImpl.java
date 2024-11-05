package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CommunityDao;
import web.dto.Bean;
import web.service.face.CommunityService;

@Service
@Slf4j
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired private CommunityDao dao;
//	@Autowired private ServletContext context;
	
	@Override
	public void insertBean(Bean bean) {
//		log.info("bean Service : {}",bean);
//		MultipartFile file = bean.getBeanInfo();
//		if( file.isEmpty() || file.getSize() <= 0) {
//			log.info("파일 업로드가 없음");
//		}
//		String storedPath = context.getRealPath("beanUpload");
//		File storedFolder = new File(storedPath);
//		storedFolder.mkdir();
		log.info("bean: {}",bean);
		dao.insertBeanData(bean);
	}
}
