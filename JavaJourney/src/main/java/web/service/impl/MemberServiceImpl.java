package web.service.impl;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MemberDao;
import web.service.face.MemberService;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	private MemberDao dao;
	
}
