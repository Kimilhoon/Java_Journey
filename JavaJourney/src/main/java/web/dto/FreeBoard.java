package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FreeBoard {

	private int freeBoardNo;
	private int userNo;
	private String userNick;
	private String freeBoardCategory;
	private String freeBoardTitle;
	private String freeBoardContent;
	private int freeBoardHit;
	private Date freeBoardWriteDate;
	private int freeImgNo;
	private int freeBoardCommentCount;
	private int freeBoardRecommendCount;
	
} // class end
