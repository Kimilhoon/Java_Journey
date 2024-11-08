package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Cafe;
import web.util.Paging;

@Mapper
public interface CafeDao {

	/**
	 * 추천카페 목록 조회
	 * 
	 * @return Best3 카페 조회
	 */
	public List<Cafe> selectBest();

	/**
	 * 전체 게시글 수 조회하기
	 * 
	 * @return 테이블의 전체 행 수 
	 */
	public int selectCntAll();

	/**
	 * 전체 카페 목록 조회
	 * 
	 * @return 전체 조회 결과
	 */
	public List<Cafe> selectAll();

	/**
	 * 카페 상세페이지 내용 조회
	 * @param cafe
	 * @return
	 */
	public Cafe selectByCafeNo(Cafe cafe);




	
	
}
