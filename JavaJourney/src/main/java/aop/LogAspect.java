package aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component	// 스프링 빈( 컴포넌트 )으로 등록하기
			// [ component-scan에 패키지 등록 필요, <annotation-driven /> 태그 필요 ]
@Aspect		// AspectJ의 관리를 받도록 설정하기
@Slf4j 
public class LogAspect {

	
	@Autowired private HttpServletRequest req;
	
	@Before("bean(*Controller)")
	public void defaultControllerLog() {
//		log.info("{URL} [{Method}]", );
		log.info("{} [{}]", req.getRequestURI(), req.getMethod());
	} // defaultControllerLog() end
	
	
	@Before("bean(*ServiceImpl)")
	public void defaultServiceLog(JoinPoint jp) {
		log.info("{}", jp.getSignature().toShortString());
	} // defaultServiceLog() end
	
} // class end
