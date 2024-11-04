package web.dto;

import java.util.Date;

import lombok.Data;
@Data
public class BeanRev {
	
	private int revNo;
	private int beanNo;
	private int subNo;
	private int userNo;
	private String revCont;
	private int revHit;
	private Date revDate;
	private int revStarPoint;

}
