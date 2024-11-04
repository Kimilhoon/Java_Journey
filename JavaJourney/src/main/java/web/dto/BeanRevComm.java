package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BeanRevComm {

	private int commNo;
	private int revNo;
	private int beanNo;
	private int subNo;
	private int userNo;
	private String commCont;
	private int commTag;
	private Date commDate;
	
}
