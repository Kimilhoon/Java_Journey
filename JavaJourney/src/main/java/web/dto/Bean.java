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
	
	private String businessNo;	
	
	//beanImg join
	private String beanStoredName;
    private String beanOriginName;
    
    //cupNote join
	private String cupNoteName;
	
	// beanRev join
	private int revStarPoint;
	
	// beanrevComm
	private int reviewCount;
	
}
