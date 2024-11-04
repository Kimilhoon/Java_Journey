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

}
