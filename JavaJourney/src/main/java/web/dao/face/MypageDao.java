package web.dao.face;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Member;

@Mapper
public interface MypageDao {

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진주 --------------------------------------
	
	/**
	 * 회원 아이디를 통해 회원 정보 가져오기
	 * @param member
	 * @return
	 */
//	public Member selectByUserId(Member member);

	public Member selectByUserNo(Member member);

//	public Member getInfoByUserNo(Member userNo);

	public Member getInfoByUserNo(int userNo);

	public Member findByUserId(String userId);
	
	
	
}
