package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MyRecipeComment {

	private int myRipCommNo;
	private int myRipNo;
	private int userNo;
	private String myRipCommCont;
	private int myRipCommTag;
	private String userNick;
	private Date commentDate;
	private String myRipCommNickTag;
	
} // class end
