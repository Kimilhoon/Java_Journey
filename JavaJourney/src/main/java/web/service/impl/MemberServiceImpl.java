package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDao dao;

	@Override
	@Transactional
	public void join(Member member) {
		dao.insertMember(member);
	}

	@Override
	public Map<String, Object> checkId(Member checkIdParam) {
		int cnt = dao.selectByMemberId(checkIdParam);
		
		Map<String, Object> checkIdResult = new HashMap<String, Object>();
		if(cnt>0) {
			checkIdResult.put("duplicate", true);
		} else {
			checkIdResult.put("duplicate", false);
		}
		
		return checkIdResult;
	}
	
	@Override
	public Map<String, Object> checkNick(Member checkNickParam) {
		int cnt = dao.selectByMemberNick(checkNickParam);
		
		Map<String, Object> checkNickResult = new HashMap<String, Object>();
		if(cnt>0) {
			checkNickResult.put("duplicateNick", true);
		} else {
			checkNickResult.put("duplicateNick", false);
		}
		
		return checkNickResult;
	}

	@Override
	public boolean login(Member member) {
		int result = dao.SelectByMemberIdPw(member);
		if(result>0)
			return true;
		
		return false;
	}

	@Override
	public Member info(Member member) {
		return dao.selectByLogin(member);
	}


	@Override
	public String searchId(Member member) {
		return dao.searchId(member);
	}

	@Override
	public String searchPw(Member member) {
		return dao.searchPw(member);
	}




	
}
