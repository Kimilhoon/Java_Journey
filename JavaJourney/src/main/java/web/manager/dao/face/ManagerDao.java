package web.manager.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Member;

@Mapper
public interface ManagerDao {
//	
	/**
	 * DB에서 모든 유저 정보 조회
	 * @return
	 */
	public List<Member> selectAllUser();
	
}
