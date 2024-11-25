package web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {


	private  SimpMessagingTemplate simpMessagingTemplate;
	
	
	@GetMapping("/comm/chat")
	public void getChat(Model model) {
		
		log.info("채팅 컨트롤러");
	}
	
	
	@MessageMapping("/chat/send")
    public void sendMsg(@Payload Map<String,Object> data){
        simpMessagingTemplate.convertAndSend("/app/topic/1",data);
    }
	
}
