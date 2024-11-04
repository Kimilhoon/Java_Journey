package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FreeBoardComment {

	private int commentNo;
	private int freeBoardNo;
	private int userNo;
	private String commentContent;
	private int commentTag;
	private String userNick;
	private Date commentDate;
	
} // class end 
