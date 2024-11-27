package web.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class BeanSub {
//	
	private int subNo;
	@JsonProperty("customerId")
	private int userNo;
	private int beanNo;
	private int gram;
	@JsonProperty("totalAmount")
	private int price;
	private String grind;
	private Date subStartDate;
	private Date subEndDate;
	private String subTime;
	private String nonSub;
	private Date nonSubDate;
	
	//조인 Bean
//	private int beanNo;
	@JsonProperty("orderName")
	private String beanName;
	
	// member join
	@JsonProperty("fullname")
	private String userNick;
	private String userName;
	private String userAdd1;
	private String userAdd2;
	
	//조인 BeanImg
	private String beanOriginName;
	
	//조인 BeanRev	
	private String revNo;
	private String revStarPoint;
	
	
	

}
