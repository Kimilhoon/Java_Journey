package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import web.dto.FreeBoard;
import web.service.face.CommunityService;
import web.service.impl.CommunityServiceImpl;

@Controller
@RequestMapping("/comm")
@Slf4j
public class CommunityController {
	
	@Autowired
	private CommunityService service = new CommunityServiceImpl();
	
	//--------------------------------------------------------------------------------------
	//동쥬니
	
	
	@GetMapping("/freeboard")
	public void freeBoardForm() {}
	
	@GetMapping("/myrecipe")
	public void mr() {}

	
	//--------------------------------------------------------------------------------------
	//이루니
	
	@GetMapping("/list")
	public void cafeReviewForm(Model model, String order, String search) {
		
		List<FreeBoard> list = service.getCafeReviewList(order, search);
		
	}
	
	
	
	
	
}




























