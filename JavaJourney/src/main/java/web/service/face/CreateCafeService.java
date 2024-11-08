package web.service.face;

import java.util.List;

import web.dto.Cafe;
import web.dto.CafeImg;

public interface CreateCafeService {

	/**
	 * 협약 카페 등록
	 * 
	 * @param cafe
	 */
	public void insertCafe(Cafe cafe);

	/**
	 * CafeImg를 조회하여 전체 데이터 반환하기
	 * @return
	 */
	public List<CafeImg> selectAllImg();

	/**
	 * 협약 카페 글 수정
	 * @param cafe
	 */
	public void update(Cafe cafe);

	/**
	 * 협약 카페 글 삭제
	 * @param cafe
	 */
	public void delete(Cafe cafe);

}
