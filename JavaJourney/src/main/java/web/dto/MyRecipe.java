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
	private String myRipFileOriginName;
	private String myRipFileStoredName;
	private int beanNo;
	private String beanName;
	private String extractionName;
	private String grindName;
	private String cupNoteName;
	private int myRipCommentCount;
	private int myRipRecommendCount;
	
} // class end
