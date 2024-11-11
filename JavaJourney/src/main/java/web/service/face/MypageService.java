package web.service.face;

import java.util.Map;

import web.dto.Member;

public interface MypageService {


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진주---------------------------------------
	
	/**
	 * 기존 회원 정보 불러오기
	 * @param member
	 * @return
	 */
//	public Member infoView(Member member);

//	public Member getInfoByUserNo(int userNo);

	public Member findByUserId(String userId);

	public Member findByUserNo(Integer userNo);

	/**
	 * 회원 정보 수정하기
	 * @param member
	 */
	public void myinfoUpdate(Member member);

	/**
	 * 닉네임 중복 체크
	 * @param checkNickParam
	 * @return
	 */
	public Map<String, Object> checkNick(Member checkNickParam);
	
	
	
}
