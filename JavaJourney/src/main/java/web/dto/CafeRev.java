package web.dto;

import java.util.Date;

import lombok.Data;
@Data
public class CafeRev {
//
	private int revNo;
	private int cafeNo;
	private String cafeName;
	private String cafeLoc;
	private int userNo;
	private String revContent;
	private int revHit;
	private Date revDate;
	private int revsp;
	
}
