package web.dto;

import lombok.Data;

@Data
public class FreeBoard {
	
	private int freeNo;
	private int userNo;
	private int imageNo;
	private String freeCategory;
	private String freeTitle;
	private String freeContent;
	private String freeHit;
	private String freeWriteDate;
	
}
