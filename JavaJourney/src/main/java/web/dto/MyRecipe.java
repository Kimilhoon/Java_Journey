package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MyRecipe {

	private int myRipNo;
	private int userNo;
	private String myRipTitle;
	private String myRipContent;
	private int myRipHit;
	private Date myRipWriteDate;
	private int myRipImgNo;
	private String userNick;
	private String originFileName;
	private String storedFileName;
	private int beanNo;
	private String beanName;
	private String extractionName;
	private String grindName;
	private String cupNoteName;
	
} // class end
