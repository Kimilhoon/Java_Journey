package web.dto;

import lombok.Data;

@Data
public class CafeWish {
//
	private int cafeWishNo;
	private int cafeNo;
	private int userNo;
	
	//조인 cafe
//	private int cafeNo;
	private int imgNo;
	private String cafeName;
	private String cafeComm;
	private String cafePhone;
	private String busyTime;
	private String cafeLoc;
	private String cafeAdd1;
	private String cafeAdd2;
	private String businessNo;
	private String cafeInfo;
	
	//찜누르기
	private String Action;

}
	
	
	
	
		
	

