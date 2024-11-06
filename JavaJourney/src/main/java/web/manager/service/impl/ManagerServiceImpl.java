package web.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MemberDao;
import web.dto.Member;
import web.manager.dao.face.ManagerDao;
import web.manager.service.face.ManagerService;

@Service
@Slf4j
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired private ManagerDao dao;
	
	@Override
	public List<Member> selectAll() {
		return dao.selectAllUser();
	}
	
}
