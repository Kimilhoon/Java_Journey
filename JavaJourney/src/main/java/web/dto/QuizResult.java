package web.dto;

import lombok.Data;

@Data
public class QuizResult {

	private int quizResultNo;
	private int beanNo;
	private int grind;
	private int extraction;
	private int cupNoteNo;
	private String grindName;
	private String extractionName;
	private String cupNoteName;
	private String cupNoteNameQuiz[];
	private String beanName;
	
} // class end
