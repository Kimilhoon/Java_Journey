package web.dao.face;

import web.dto.Cafe;

public interface CreateCafeDao {

	/**
	 * 협약 카페 등록
	 * 
	 * @param cafe
	 */
	public void write(Cafe cafe);

}
