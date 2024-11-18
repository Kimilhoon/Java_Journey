package web.dto;

import java.util.Date;

import lombok.Data;
@Data
public class CafeRevComm {

	private int cafeRevCommNo;
	private int revNo;
	private int userNo;
	private String cafeCommCont;
	private int cafeCommTag;
	private Date cafeCommDate;
	private String userNick;
	
	//리뷰 조인
	private int revsp;
	//별점
	private int avgRevStarPoint;
	

}
