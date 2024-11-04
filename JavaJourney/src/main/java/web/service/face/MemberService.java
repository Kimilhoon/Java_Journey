package web.service.face;

import web.dto.Member;

public interface MemberService {

	/**
	 * 로그인 기능
	 * 
	 * @param member
	 * @return
	 */
	public boolean login(Member member);

	
	
	
}
