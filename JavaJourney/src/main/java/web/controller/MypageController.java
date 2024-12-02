package web.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.emory.mathcs.backport.java.util.Collections;
import lombok.extern.slf4j.Slf4j;
import web.dto.BeanRev;
import web.dto.BeanSub;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;
import web.dto.Member;
import web.dto.MemberQuizResult;
import web.dto.MyRecipe;
import web.service.face.MypageService;
import web.util.Paging;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	//----------------------------------------------------------------------------
	//jinjaeyoung
	@GetMapping("/quizres")
	public String quizresForm(
			MemberQuizResult memberQuizResult,
			Model model
			) {
//		log.info("memberQuizResult UserNo : {}",memberQuizResult.getUserNo());
		List<MemberQuizResult> MyQuizResult = service.selectByUserNoQuizeResult(memberQuizResult.getUserNo());
		
//		log.info("MyQuizResult 조건문 : {}", MyQuizResult.isEmpty());
		
		if( MyQuizResult == null || MyQuizResult.isEmpty() ) {
			model.addAttribute("message1", "취향조사를 통해 원두 추천을 받아보실 수 있습니다.");
			model.addAttribute("message2", "취향조사를 해서 나만의 취향 원두를 찾아보세요!");
			model.addAttribute("nodata", "quizres");
			return "mypage/nodata"; // View Resolver를 통해 JSP파일을 찾아 렌더링 한다
			//**렌더링 : 서버에서 JSP 파일을 HTML로 변환하여 클라이언트(브라우저)에 보내는 것을 의미합니다
			///WEB-INF/views/mypage/nodata.jsp를 찾아서 클라이언트에게 반환합니다
		}
		
		model.addAttribute("MyQuizResult",MyQuizResult);
		return "mypage/quizres";//HTTP Redirect를 수행한다, 브라우저가 지정된 URL로 재요청을 보낸다
		//클라이언트가 /mypage/quizres라는 URL로 새로운 요청을 생성합니다.
		//리다이렉트는 브라우저가 새로운 URL로 다시 요청을 보냅니다. 이로 인해 2번의 GET 요청이 발생합니다.
		//따라서 여기에는 리다이렉트를 사용하지 않음, 2번요청하면 data가 없다고 조회되서
	}
	
	@GetMapping("/subscribe")
	public String subscribeForm(
			BeanSub beanSub,
			Paging curPage,
			Model model
			) {
		log.info("beanSub UserNo : {}",beanSub.getUserNo());
		log.info("Paging-curPage : {}",curPage);
		
		Paging paging = service.getBeanSubPage(curPage, beanSub.getUserNo());
		
		List<BeanSub> beanSubList = service.selectMyBeanSub(beanSub.getUserNo(), paging);
		
		if( beanSubList == null || beanSubList.isEmpty() ) {
			model.addAttribute("message1", "구독된 원두가 없습니다.");
			model.addAttribute("message2", "원하는 원두를 둘러보세요!");
			model.addAttribute("nodata", "subscribe");
			return "mypage/nodata";
		}
		
		model.addAttribute("beanSubList",beanSubList);
		model.addAttribute("paging",paging);
		return "mypage/subscribe";
	}
	
	@PostMapping("/cancelsub")
	@ResponseBody
	public void cancelsubForm(
			@RequestParam("subNo") List<Integer> subNo
			) {
		log.info("subNo : {}",subNo);
		service.updateSubCancelBySubNo(subNo);
	}
	
	@GetMapping("/like")
	public String likeForm(
			Model model,
			Member member,
			@RequestParam(required = false) String searchText
			) {
		log.info("member : {}",member.getUserNo());
		log.info("searchText : {}",searchText);
		List<CafeWish> cafeWishNoList = service.selectByLikeCafe(member.getUserNo(),searchText);
//		log.info("cafeWishNoList",cafeWishNoList);
		List<BeanWish> beanWishList = service.selectByLikeBean(member.getUserNo());
		
		if( cafeWishNoList == null || cafeWishNoList.isEmpty()
				&& beanWishList == null || beanWishList.isEmpty() ) {
			model.addAttribute("message1", "찜한 목록이 비어 있어요.");
			model.addAttribute("message2", "찜으로 나만의 카페/원두 리스트를 만들어보세요!");
			model.addAttribute("nodata", "like");
			return "mypage/nodata";
		}
		
		model.addAttribute("cafeWishNoList",cafeWishNoList);
		model.addAttribute("beanWishList",beanWishList);
		
		return "mypage/like";

	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
        	return "redirect:/member/login";
        }
       
        // DB에서 기존 사용자 정보 가져오기
        Member member = service.findByUserNo(userNo);
        
        if (member != null) { //데이터가 존재할때만 모델에 추가
            model.addAttribute("member", member);
        }
        
        return "/mypage/myinfo";
	}
	
	
    @PostMapping("/checkPassword")
    @ResponseBody
    public boolean checkPassword(@RequestParam("userPw") String userPw, HttpSession session) {
        // 세션에서 현재 사용자 ID 가져오기
        String userId = (String) session.getAttribute("userId");
        log.info("userId:{}",userId);

        // DB에 저장된 비밀번호와 비교하기
        Member member = service.findByUserId(userId);
        
        return member != null && member.getUserPw().equals(userPw); //사용자가 존재하고 비번 일치하면 true 반환
    }

	
	@GetMapping("/myinfoUpdate")
	public String MyInfoUpdate(Member member, Model model, HttpSession session) {
		
		// DB에서 기존 사용자 정보 가져오기
		Integer userNo = (Integer) session.getAttribute("userNo");
	    member = service.findByUserNo(userNo);
	    
	    if (userNo != null) {
	        member.setUserNo(userNo);  // 세션에서 userNo 가져와서 설정
	    }

	    model.addAttribute("member", member);
		
		return "/mypage/myinfoUpdate";
	}
	
	@PostMapping("/myinfoUpdate")
	public String MyInfoUpdateForm(Member member) {
		
		service.myinfoUpdate(member);
		
		return "redirect:/main";
	}
	
	@GetMapping("/checkNick")
	public ResponseEntity<Map<String, Object>> checkNick(@RequestParam("userNick") String userNick){
		Member checkNickParam = new Member();
		checkNickParam.setUserNick(userNick);
		
		Map<String, Object> checkNickResult = service.checkNick(checkNickParam);
		
		
		return ResponseEntity.ok(checkNickResult);
	}
	
	@RequestMapping("/out")
	public String leave(Member member, HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		String userNick = (String)session.getAttribute("userNick");
		log.info("userNo:{}", userNo);
		log.info("userNick:{}", userNick);
		
		service.outMember(userNo);
		service.updateCommNickTag(userNick);
		
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	

		

	
	
	
	
	
}









