package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Bean;
import web.util.Paging;

@Mapper
public interface BeanDao {

	/**
	 * 총 게시글 수 조회
	 * 
	 * @return 테이블의 전체 행수
	 */
	public int selectCntAll();

	
	/**
	 * 모든 원두 조회
	 * 
	 * @return - 조회된 원두
	 */
	public List<Bean> selectAll(Paging paging);
	
	
} // interface end
