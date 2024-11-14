package web.dto;

import java.util.Date;
import java.util.Set;

import lombok.Data;

@Data
public class BeanRev {
	
	private int revNo;
	private int beanNo;
	private String beanName;
	private int cupNoteNo;
	private String cupNoteName; // 개별 맛과 향 이름
	private int subNo;
	private int userNo;
	private String revCont;
	private int revHit;
	private Date revDate;
	private int revStarPoint;
	private int beanRevCommCount;
	
	// 조인된 정보
	private String userNick;
	
	// 별점 평균
	private int avgRevStarPoint;
	
	// 중복 없이 맛과 향 이름을 저장하기 위한 Set
	private Set<String> cupNoteNames;
}
