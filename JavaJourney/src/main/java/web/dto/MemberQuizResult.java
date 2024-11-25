package web.dto;

import lombok.Data;

@Data
public class MemberQuizResult {

	private int quizResult;
	private int userNo;
	
	//조인 quizresult
	private int quizResultNo;
	private int beanNo;
	private int grind;
	private int extraction;
	private int cupNoteNo;
	private String grindName;
	private String extractionName;
	private String cupNoteName;
	private String beanName;
	
	//조인 bean
//	private int beanNo;
	private int beanImgNo;
//	private String beanName;
	private String beanComm;
	
	//조인 beanimg
//	private int beanImgNo;
	private String beanOriginName;
	
	//조인 grind
	private int grindNo;
//	private String grindName;
	
	//조인 extraction
	private int extractionNo;
//	private String extractionName;
	
	
	
	
} // class end
