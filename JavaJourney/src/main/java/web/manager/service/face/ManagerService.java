package web.manager.service.face;

import java.util.List;

import web.dto.Member;

public interface ManagerService {
//	
	/**
	 * 모든 유저 정보 조회
	 * @return
	 */
	public List<Member> selectAll();
	
	
}
