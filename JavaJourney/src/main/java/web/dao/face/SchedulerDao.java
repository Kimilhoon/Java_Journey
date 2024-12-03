package web.dao.face;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SchedulerDao {
	
	//1시간 이상 경과된 취소 데이터를 조회하는 메서드
	List<Integer> findExpiredCancelledSub(LocalDateTime expiredTime);
	
	//조회된 데이터를 숨김 처리하는 메서드
	void updateHiddenStatus(List<Integer> ids);
	
	// 1시간이상 경과된 취소 데이터를 조회하고 - 조회된 데이터를 숨기는 메서드로 진행
}
