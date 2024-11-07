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


}
