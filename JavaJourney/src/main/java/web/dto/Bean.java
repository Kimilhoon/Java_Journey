package web.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Bean {
//
	private int beanNo;
	private int beanImgNo;
	private String beanName;
	private String origin;
	private String beanComm;
	private MultipartFile beanInfo;
	private int beanPrice;
	private int businessNo;	
	
}
