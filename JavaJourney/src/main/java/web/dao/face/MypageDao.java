package web.dao.face;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Member;

@Mapper
public interface MypageDao {

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진주 --------------------------------------
	
	/**
	 * 아이디로 회원정보 찾기
	 * @param userId
	 * @return
	 */
	public Member findByUserId(String userId);

	/**
	 * 회원번호로 회원정보 찾기
	 * @param userNo
	 * @return
	 */
	public Member findByUserNo(Integer userNo);


	/**
	 * 회원 정보 수정하기
	 * @param member
	 * @return
	 */
	public void myinfoUpdate(Member member);

	/**
	 * 닉네임 중복체크
	 * @param checkNickParam
	 * @return
	 */
	public int selectByMemberNick(Member checkNickParam);
	
	
	
}
