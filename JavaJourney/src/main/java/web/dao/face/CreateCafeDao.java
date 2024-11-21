package web.dao.face;

import java.util.List;

import web.dto.Cafe;
import web.dto.CafeImg;
import web.dto.CafeRev;
import web.dto.CafeRevComm;

public interface CreateCafeDao {

	/**
	 * 협약 카페 등록
	 * 
	 * @param cafe
	 */
	public void write(Cafe cafe);


	/**
	 * DB에 이미지 문자열 삽입하면서 FK의 값도 부여하기
	 * @param cafeImg
	 */
	public void insertCafeImg(CafeImg cafeImg);

	/**
	 * DB에서 방금 삽입한 이미지의 번호를 가져온다
	 * @return
	 */
	public int selectByLatest();

	/**
	 * DTO에 담긴 Cafe, DB에 삽입하기
	 * @param cafe
	 */
	public void insertCafe(Cafe cafe);

	/**
	 * 카페번호를 이용하여 게시글 조회
	 * @param cafe
	 * @return
	 */
	public Cafe selectByCafeNo(Cafe cafe);

	/**
	 * 협약 카페 글 수정 반영
	 * @param cafe
	 */
	public void updateCafe(Cafe cafe);
	
	/**
	 * 카페 메인 이미지 삭제
	 * @param cafeImg
	 */
	public void deleteCafeImg(CafeImg cafeImg);


	/**
	 * 협약 카페 status 'Y' -> 'N' 으로 변경
	 * @param cafeNo
	 */
	public void updateCafeStatus(int cafeNo);
	
//	/**
//	 * 카페 글 삭제할때 그 안의 리뷰글 삭제
//	 * @param cafeRev
//	 */
//	public void deleteCafeRev(CafeRev cafeRev);
//	
//	/**
//	 * 협약 카페 글 삭제
//	 * @param cafe
//	 */
//	public void deleteCafe(Cafe cafe);
//
//
//
//	public void deleteCafeRevComm(CafeRevComm cafeRevComm);





}
