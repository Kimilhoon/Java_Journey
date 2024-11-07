package web.service.face;

import web.dto.Cafe;

public interface CreateCafeService {

	/**
	 * 협약 카페 등록
	 * 
	 * @param cafe
	 */
	public void insertCafe(Cafe cafe);

}
