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
	
} // class end
