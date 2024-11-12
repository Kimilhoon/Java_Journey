package web.dto;

import lombok.Data;

@Data
public class BeanWish {
//	
	private int beanWishNo;
	private int beanNo;
	private int userNo;
	
	//조인
//	private int beanNo;
	private int beanImgNo;
	private String beanName;
	private String origin;
	private String beanComm;
	private String beanInfo;
	private int beanPrice;
	
	private String businessNo;	
	
	//beanImg join
    private String beanOriginName;
    
    // 찜하자
//    private String add;
//    private String remove;
    private String action;

}
