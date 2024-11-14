package web.dto;

import java.util.Date;

import lombok.Data;
@Data
public class BeanRev {
//	
	private int revNo;
	private int beanNo;
	private String beanName;
	private int cupNoteNo;
	private String cupNoteName;
	private int subNo;
	private int userNo;
	private String revCont;
	private int revHit;
	private Date revDate;
	private int revStarPoint;
	private int beanRevCommCount;
	
	// 조인
	private String userNick;
	
	// 별졈 평균
	private int avgRevStarPoint;

}
