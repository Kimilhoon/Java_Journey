package web.dao.face;

import java.util.List;

import web.dto.Cafe;
import web.dto.CafeImg;

public interface CreateCafeDao {

	/**
	 * 협약 카페 등록
	 * 
	 * @param cafe
	 */
	public void write(Cafe cafe);

	/**
	 * DB에 접속하여 모든 CafeImg 조회하여 
	 * 전체 데이터 받아오기
	 * @return
	 */
	public List<CafeImg> selectAllImg();

	/**
	 * 협약 카페 글 수정 반영
	 * @param cafe
	 */
	public void update(Cafe cafe);

	/**
	 * 협약 카페 글 삭제
	 * @param cafe
	 */
	public void delete(Cafe cafe);

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


}
