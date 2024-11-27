package web.scheduler;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration // 해당 클래스가 Bean 구성 클래스임을 명시
@EnableScheduling // 클래스를 스케쥴링 목적으로 사용하겠다 명시
public class SchedulerConfig {

}
