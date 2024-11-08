package web.service.face;

import java.util.List;

import web.dto.Cafe;
import web.util.Paging;

public interface CafeService {

	/**
	 * 
	 * @return
	 */
	public List<Cafe> getBest();

	/**
	 * 패이징 객체 생성
	 * 
	 * @param curPage - 요청 정보 객체
	 * @return 페이징 계산 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 
	 * @return
	 */
	public List<Cafe> getAllCafe();

	/**
	 * 카페 상세 정보 조회 메소드
	 * 
	 * @param cafe - 카페상세 정보 객체
	 * @return 
	 */
	public Cafe getCafeInfo(Cafe cafe);

	

	
	
	
	
	
	
	
}
