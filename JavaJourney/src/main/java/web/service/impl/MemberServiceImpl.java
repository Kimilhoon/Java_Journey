package web.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
			checkIdResult.put("duplicate", true); //중복있음
		} else {
			checkIdResult.put("duplicate", false); //중복없음 (cnt == 0)
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
			return true; //회원정보 일치
		
		return false; // 회원정보 불일치
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

	@Override
	public void updatePw(String checkNum, String userEmail) {
		Map<String, Object> tempPw = new HashMap<String, Object>();
		tempPw.put("userEmail", userEmail);
		tempPw.put("checkNum", checkNum);
		
		dao.updatePw(tempPw);
		
	}

//	@Override
//	public void findpw(Member member) {
//		dao.pwUpdate(member);
//		
//	}




	
}
