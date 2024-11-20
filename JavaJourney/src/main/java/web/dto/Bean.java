package web.dto;


import lombok.Data;

@Data
public class Bean {
// 
	private int beanNo; 
	private int beanImgNo;
	private String beanName;
	private String origin;
	private String beanComm;
	private String beanInfo;
	private int beanPrice;
	
	private int beanCount;
	
	private String businessNo;	
	
	//beanImg join
	private String beanStoredName;
    private String beanOriginName;
    
    //cupNote join
	private String cupNoteName[];
	
	// beanRev join
	private int revStarPoint;
	private int reviewCount;
	private double avgRevStarPoint;
	
	// beanSub join
	private int gram;
	
	// member join
	private int userNo;
	private String userId;
	private String userNick;
	private String userEmail;
	private String userName;
	private String userPhone;
	private String userPostcode;
	private String userAdd1;
	private String userAdd2;
}
