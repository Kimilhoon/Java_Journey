package web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import lombok.extern.slf4j.Slf4j;
import web.dto.BeanRev;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;
import web.dto.Member;
import web.dto.MyRecipe;
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
	public void likeForm(
			Model model,
			Member member
			) {
		log.info("member : {}",member.getUserNo());
		List<CafeWish> cafeWishNoList = service.selectByLikeCafe(member.getUserNo());
		log.info("cafeWishNoList",cafeWishNoList);
		List<BeanWish> beanWishList = service.selectByLikeBean(member.getUserNo());
		model.addAttribute("cafeWishNoList",cafeWishNoList);
		model.addAttribute("beanWishList",beanWishList);
		
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
        }      
       
        // DB에서 기존 사용자 정보 가져오기
        Member member = service.findByUserNo(userNo);
        
        if (member != null) {
            // 전체 Member 객체를 모델에 추가
            model.addAttribute("member", member);
        }
        
        return "/mypage/myinfo";
	}
	
	
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
	
	
//	@GetMapping("/myview")
//	public String view(Model model, HttpSession session, Member member) {
//        // 세션에서 userNo 가져오기
//        Integer userNo = (Integer) session.getAttribute("userNo");
//        if (userNo == null) {
//            return "redirect:/member/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
//        }	
//        // 사용자 번호로 해당 사용자의 리뷰 조회
//        List<CafeRev> myCafeReviews = service.findByUserNo(member.getUserNo());
//        model.addAttribute("reviews", myCafeReviews);
//
//        return "my-cafe-reviews"; // 사용자 리뷰 페이지 템플릿 이름
//    	}        
//	}
		
	@GetMapping("/myview")
	public void view(Model model, HttpSession session, Member member, String category) {
		
        List<CafeRev> cafeReview = service.selectCafeRevByUserNo(member.getUserNo());
        List<BeanRev> beanReview = service.selectBeanRevByUserNo(member.getUserNo());
        List<FreeBoard> freeboard = service.selectFreeBoardByUserNo(member.getUserNo());
        List<MyRecipe> myRecipe = service.selectMyRecipeByUserNo(member.getUserNo());
       
        List<Object> myView = new ArrayList<Object>();
        myView.addAll(cafeReview);
        myView.addAll(beanReview);
        myView.addAll(freeboard);
        myView.addAll(myRecipe);

//        // 카테고리별로 필터링
//        List<Object> filteredReviews = new ArrayList<>();
//        for (Object view : myView) {
//            if ("all".equals(category)) {
//                filteredReviews.add(view); // 전체
//            } else {
//                // 카테고리별 필터링 (카테고리명을 기준으로 필터링)
//                if (view instanceof CafeRev && "카페 리뷰".equals(category)) {
//                    filteredReviews.add(view);
//                } else if (view instanceof BeanRev && "원두 리뷰".equals(category)) {
//                    filteredReviews.add(view);
//                } else if (view instanceof FreeBoard && "자유게시판".equals(category)) {
//                    filteredReviews.add(view);
//                } else if (view instanceof MyRecipe && "나만의 레시피".equals(category)) {
//                    filteredReviews.add(view);
//                }
//            }
//        }
//        
//        // 작성일 기준으로 정렬 (내림차순)
//        filteredReviews.sort((rev1, rev2) -> {
//            Date date1 = (rev1 instanceof CafeRev) ? ((CafeRev) rev1).getRevDate() :
//                        (rev1 instanceof BeanRev) ? ((BeanRev) rev1).getRevDate() :
//                        (rev1 instanceof FreeBoard) ? ((FreeBoard) rev1).getFreeBoardWriteDate() :
//                        ((MyRecipe) rev1).getMyRipWriteDate();
//
//            Date date2 = (rev2 instanceof CafeRev) ? ((CafeRev) rev2).getRevDate() :
//                        (rev2 instanceof BeanRev) ? ((BeanRev) rev2).getRevDate() :
//                        (rev2 instanceof FreeBoard) ? ((FreeBoard) rev2).getFreeBoardWriteDate() :
//                        ((MyRecipe) rev2).getMyRipWriteDate();
//
//            return date2.compareTo(date1); // 내림차순
//        });
   
        
        model.addAttribute("myView", myView);
        model.addAttribute("count", myView.size());  // 게시글 수
	}	
	
	
	
	
	
	
}

















































































