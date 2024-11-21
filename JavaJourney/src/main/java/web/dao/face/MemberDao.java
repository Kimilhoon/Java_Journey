package web.dao.face;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Member;

@Mapper
public interface MemberDao {

	/**
	 * 회원가입 추가
	 * 
	 * @param member
	 */
	public void insertMember(Member member);
	
	/**
	 * 아이디 중복 체크
	 * @param checkIdParam
	 * @return
	 */
	public int selectByMemberId(Member checkIdParam);
	
	/**
	 * 닉네임 중복 체크
	 * @param checkNickParam
	 * @return
	 */
	public int selectByMemberNick(Member checkNickParam);

	/**
	 * 아이디 비밀번호로 로그인
	 * id,pw 일치하는 행 수 조회
	 * status='Y'일때 로그인 가능(활성화)
	 * status='N'일때 로그인 불가능(비활성화)
	 * 
	 * @param member
	 * @return
	 */
	public int SelectByMemberIdPw(Member member);

	/**
	 * 로그인 세션 정보
	 * 
	 * @param member
	 * @return
	 */
	public Member selectByLogin(Member member);


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
