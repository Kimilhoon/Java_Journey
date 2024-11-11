package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import web.dto.Member;
import web.service.face.MypageService;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	//----------------------------------------------------------------------------
	//jinjaeyoung
	@GetMapping("/quizres")
	public void quizresForm() {}
	
	@GetMapping("/subscribe")
	public void subscribeForm() {}
	
	@GetMapping("/cancelsub")
	public void cancelsubForm() {}
	
	@GetMapping("/like")
	public void likeForm() {}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//----------------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//------------진주-----------------------------------------------------------
	
	@GetMapping("/myinfo")
	public String MyInfo(Model model, HttpSession session) {
       
		// 세션에서 아이디 가져오기
        String userId = (String) session.getAttribute("userId");
        model.addAttribute("userId", userId);
        
        // 세션에서 userNo 가져오기
        Integer userNo = (Integer) session.getAttribute("userNo");

        if (userNo != null) {
            model.addAttribute("userNo", userNo); // userNo를 모델에 추가
        } else {
        }       
       
        return "/mypage/myinfo";
	}
	
//	@PostMapping("/myinfo")
//	public void MyInfoForm(Member member, Model model, HttpSession session) {
//		log.info("member:{}", member);
//		member.setUserId((String)session.getAttribute("userId"));
//		member.setUserNo((int)session.getAttribute("userNo"));
//		
//		model.addAttribute("member", member);
//		
//		log.info("member:{}", member);
//		
//	}
	
    @PostMapping("/checkPassword")
    @ResponseBody
    public boolean checkPassword(@RequestParam("userPw") String userPw, HttpSession session) {
        // 세션에서 현재 사용자 ID 가져오기
        String userId = (String) session.getAttribute("userId");
        log.info("userId",userId);
        

        // DB에 저장된 비밀번호와 비교하기
        Member member = service.findByUserId(userId);
        
        return member != null && member.getUserPw().equals(userPw);
    }

	
	@GetMapping("/myinfoUpdate")
	public String MyInfoUpdate(Member member, Model model, HttpSession session) {
		member.setUserNo((int)session.getAttribute("userNo"));
		
//		member = service.infoView(member);
		log.info("member:{}", member);
		model.addAttribute("member", member);
		
		return "/mypage/myinfoUpdate";
	}
	
//	@PostMapping("/myinfoUpdate")
//	public void MyInfoUpdateForm(Member member, Model model, HttpSession session) {
//		
//		member = service.infoView(member);
//		
//		model.addAttribute("member", member);
//	}
	
	
	
	
	
	
	
	
	
	
	
}

















































































