package web.service.face;

import java.util.List;

import web.dto.Cafe;
import web.dto.CafeRev;
import web.util.Paging;

public interface CafeService {

	/**
	 * 베스트 3 카페 조회
	 * @return - 조회된 3개 카페
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
	 * 전체 카페 조회
	 * @return - 조회된 카페
	 */
	public List<Cafe> getAllCafe();

	/**
	 * CafeNo 전달 받아 Cafe 상세내용 조회
	 * 
	 * @param cafe - 전달받은 cafeNo
	 * @return Cafe 상세 정보 
	 */
	public Cafe getCafeInfo(Cafe cafe);

}
