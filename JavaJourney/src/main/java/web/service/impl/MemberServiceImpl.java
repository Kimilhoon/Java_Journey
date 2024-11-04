package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MemberDao;
import web.service.face.MemberService;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDao dao;
	
}
