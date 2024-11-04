package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {

	private int noticeNo;
	private String title;
	private String content;
	private Date wirteDate;
	
} // class end
