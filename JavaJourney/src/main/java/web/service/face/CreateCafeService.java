package web.service.face;

import java.util.List;

import web.dto.Cafe;
import web.dto.CafeImg;
import web.dto.CafeRev;
import web.dto.CafeRevComm;

public interface CreateCafeService {

	/**
	 * 협약 카페 등록
	 * 
	 * @param cafe 
	 * @param cafeImg 
	 */
	public void insertCafe(Cafe cafe, CafeImg cafeImg);

	/**
	 * 게시글 상세보기
	 * @param cafe
	 * @return
	 */
	public Cafe view(Cafe cafe);

	/**
	 * 협약 카페 글 수정
	 * @param cafe
	 */
//	public void update(Cafe cafe);
	public void update(Cafe cafe, CafeImg cafeImg);

	/**
	 * 협약 카페 비활성화 (삭제)
	 * @param cafeNo
	 */
	public void deleteCafe(int cafeNo);

	/**
	 * 협약 카페 글 삭제
	 * @param cafe
	 * @param cafeImg 
	 */
//	public void delete(Cafe cafe);
//	public void delete(Cafe cafe, CafeImg cafeImg);
//	public void delete(Cafe cafe, CafeImg cafeImg, CafeRev cafeRev);
//	public void delete(Cafe cafe, CafeImg cafeImg, CafeRev cafeRev, CafeRevComm cafeRevComm);








}
