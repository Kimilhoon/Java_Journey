package web.dto;

import lombok.Data;

@Data
public class Cafe {
//
	private int cafeNo;
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
	
	//조인CafeWish
	private int userNo;
	
	private String cafeRev;
	
	//cafeImg join
	private String cafeStoredName;
    private String cafeOriginName;
	private String cafeImgOriName;
	
	// cafeRev join
	private int revsp;
	private int reviewCount;
	private int avgRevStarPoint;
	
	
}
