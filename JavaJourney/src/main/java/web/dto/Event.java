package web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class Event {
//	
	//변경할 event DTO
	private int eventNo;
	private String eventName;
	private String eventBanner;
	@DateTimeFormat(pattern = "yyyy-MM-dd") private Date eveStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") private Date eveEnd;
	private String eveImg;
	
	
	
	
	
	//구버전
//	private int eventNo;
//	private int eveImgNo;
//	private String eveOriName;
//	private String eveStorName;
//	private int eveSize;
//	private Date eveStart;
//	private Date eveEnd;
	
	

	
	

}
