package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FreeBoardComment {

	private int commentNo;
	private int freeBoardNo;
	private int userNo;
	private String commentContent;
	private String userNick;
	private Date commentDate;
	private String freeBoardCommNickTag;
	private int freeBoardCommTag;
	
} // class end 
