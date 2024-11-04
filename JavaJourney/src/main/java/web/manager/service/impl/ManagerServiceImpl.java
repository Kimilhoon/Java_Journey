package web.manager.service.impl;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.manager.dao.face.ManagerDao;
import web.manager.service.face.ManagerService;

@Service
@Slf4j
public class ManagerServiceImpl implements ManagerService {
	
	private ManagerDao dao;
	
}
