package web.service.impl;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MypageDao;
import web.service.face.MypageService;

@Service
@Slf4j
public class MypageServiceImpl implements MypageService {
	
	private MypageDao dao;
	
}
