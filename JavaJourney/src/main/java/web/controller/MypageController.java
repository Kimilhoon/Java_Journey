package web.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.emory.mathcs.backport.java.util.Collections;
import lombok.extern.slf4j.Slf4j;
import web.dto.BeanRev;
import web.dto.BeanWish;
import web.dto.CafeRev;
import web.dto.CafeWish;
import web.dto.FreeBoard;
import web.dto.Member;
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
	public void quizresForm() {}
	
	@GetMapping("/subscribe")
	public void subscribeForm() {}
	
	@GetMapping("/cancelsub")
	public void cancelsubForm() {}
	
	@GetMapping("/like")
	public void likeForm(
			Model model,
			Member member,
			@RequestParam(required = false) String searchText
			) {
		log.info("member : {}",member.getUserNo());
		log.info("searchText : {}",searchText);
		List<CafeWish> cafeWishNoList = service.selectByLikeCafe(member.getUserNo(),searchText);
//		log.info("cafeWishNoList",cafeWishNoList);
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
	
	@RequestMapping("/out")
	public String out(Member member, HttpSession session) {
		
		Integer userNo = (Integer) session.getAttribute("userNo");
		service.leaveMember(userNo);
		
		session.invalidate();
		
		return "redirect:/main"; 
	}

		
	@GetMapping("/myview")
	public void view(Model model
			, HttpSession session
			, Member member
			, @RequestParam(defaultValue = "전체") String category
			, Paging param
			, String search) {
		
		
        // 세션에서 userNo 가져오기
        Integer userNo = (Integer) session.getAttribute("userNo");
        
        //페이징
//        Paging paging = service.getMyViewPaging(param);
        
        
        List<Map<String, Object>> myView = new ArrayList<>();

        // 각 객체를 구분하고 'type' 필드를 추가하여 리스트에 넣음
        if ("카페리뷰".equals(category) || "전체".equals(category)) {
            List<CafeRev> cafeReview = service.selectCafeRevByUserNo(member.getUserNo());
            
	        for (CafeRev rev : cafeReview) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("type", "CafeRev");
	            map.put("data", rev);
	            myView.add(map);
	        }
        }
        
        if ("원두리뷰".equals(category) || "전체".equals(category)) {
            List<BeanRev> beanReview = service.selectBeanRevByUserNo(member.getUserNo());
     
	        for (BeanRev rev : beanReview) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("type", "BeanRev");
	            map.put("data", rev);
	            myView.add(map);
	        }
        }
        
        if ("자유게시판".equals(category) || "전체".equals(category)) {
            List<FreeBoard> freeboard = service.selectFreeBoardByUserNo(member.getUserNo());
     
	        for (FreeBoard rev : freeboard) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("type", "FreeBoard");
	            map.put("data", rev);
	            myView.add(map);
	        }
        }
        
        if ("나만의레시피".equals(category) || "전체".equals(category)) {
            List<MyRecipe> myRecipe = service.selectMyRecipeByUserNo(member.getUserNo());

	        for (MyRecipe rev : myRecipe) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("type", "MyRecipe");
	            map.put("data", rev);
	            myView.add(map);
	        }
        }

        
        // 날짜 기준으로 정렬 //지피티출신입니다
        Collections.sort(myView, new Comparator<Map<String, Object>>() {
            @Override
            public int compare(Map<String, Object> map1, Map<String, Object> map2) {
                Date date1 = getDate(map1.get("data"));
                Date date2 = getDate(map2.get("data"));
                return date2.compareTo(date1);  // 최신 글이 먼저 오도록 내림차순 정렬
            }

            private Date getDate(Object obj) {
            	
                if (obj instanceof CafeRev) {
                    return ((CafeRev) obj).getRevDate();
                    
                } else if (obj instanceof BeanRev) {
                    return ((BeanRev) obj).getRevDate();
                    
                } else if (obj instanceof FreeBoard) {
                    return ((FreeBoard) obj).getFreeBoardWriteDate();
                    
                } else if (obj instanceof MyRecipe) {
                    return ((MyRecipe) obj).getMyRipWriteDate();
                }
                return null;
            }
        });	
        
        //rownum역순으로 줘서 글번호 출력하기
        for (int i = 0; i < myView.size(); i++) {
            Map<String, Object> map = myView.get(i);
            map.put("rownum", myView.size() - i);
        }
        
   
        
//        model.addAttribute("paging", paging);
        model.addAttribute("userNo", userNo);
        model.addAttribute("myView", myView);
        model.addAttribute("category", category);	
        model.addAttribute("search", search);	
	}	
	
	
	
	
	
	
}









