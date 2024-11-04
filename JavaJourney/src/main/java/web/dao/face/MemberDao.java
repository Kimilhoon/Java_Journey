package web.dao.face;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Member;

@Mapper
public interface MemberDao {

	/**
	 * 아이디 비밀번호로 로그인
	 * id,pw 일치하는 행 수 조회
	 * 
	 * @param member
	 * @return
	 */
	public int SelectByMemberIdPw(Member member);
	
	
	
}
