package web.dto;

import java.util.Date;

import lombok.Data;
@Data
public class BeanSub {
	
	private int subNo;
	private int userNo;
	private int beanNo;
	private int gram;
	private int price;
	private String grind;
	private Date subStartDate;
	private Date subEndDate;
	private String subTime;
	private String nonSub;

}
