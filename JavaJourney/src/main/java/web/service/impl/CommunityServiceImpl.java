package web.service.impl;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CommunityDao;
import web.service.face.CommunityService;

@Service
@Slf4j
public class CommunityServiceImpl implements CommunityService {
	
	private CommunityDao dao;
	
}