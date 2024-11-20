package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Member;

public interface MemberService {

	/**
	 * 회원가입
	 * 
	 * @param member
	 */
	public void join(Member member);
	
	/**
	 * 아이디 중복체크
	 * @param checkIdParam
	 * @return
	 */
	public Map<String, Object> checkId(Member checkIdParam);
	
	/**
	 * 닉네임 중복체크
	 * @param checkNickParam
	 * @return
	 */
	public Map<String, Object> checkNick(Member checkNickParam);

	/**
	 * 로그인 기능
	 * 
	 * @param member
	 * @return
	 */
	public boolean login(Member member);

	/**
	 * 로그인 정보
	 * @param member
	 * @return
	 */
	public Member info(Member member);

	/**
	 * 아이디 찾기
	 * @param member
	 * @return
	 */
	public String searchId(Member member);

	/**
	 * 비밀번호 찾기
	 * @param member
	 * @return
	 */
	public String searchPw(Member member);



	
	
}
