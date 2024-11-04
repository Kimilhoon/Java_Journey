package web.dto;

import java.util.Date;

import lombok.Data;
@Data
public class Event {
//	
	private int eventNo;
	private int eveImgNo;
	private String eveOriName;
	private String eveStorName;
	private int eveSize;
	private Date eveStart;
	private Date eveEnd;

}
