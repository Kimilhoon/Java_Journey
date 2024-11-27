package web.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class TaskScheduler {
	
	@Scheduled(fixedRate = 5000)
	public void runTask() {
		log.info("스케쥴러 작업 실행중 : {}", System.currentTimeMillis());
	}
	
	@Scheduled( cron = "0 0 * * * ?")
	public void runCronTask() {
		log.info("Cron 스케쥴링 작업 실행중 : {}", System.currentTimeMillis());

	}
	
}
