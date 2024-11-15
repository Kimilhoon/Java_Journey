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
	public void quizresForm(
			MemberQuizResult memberQuizResult,
			Model model
			) {
//		log.info("memberQuizResult UserNo : {}",memberQuizResult.getUserNo());
		List<MemberQuizResult> MyQuizResult = service.selectByUserNoQuizeResult(memberQuizResult.getUserNo());
		model.addAttribute("MyQuizResult",MyQuizResult);
	}
	
	@GetMapping("/subscribe")
	public void subscribeForm(
			BeanSub beanSub,
			Model model
			) {
		log.info("beanSub UserNo : {}",beanSub.getUserNo());
		List<BeanSub> beanSubList = service.selectMyBeanSub(beanSub.getUserNo());
		model.addAttribute("beanSubList",beanSubList);
	}
	
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
 
      
        
        List<Map<String, Object>> myView = new ArrayList<>();
        
        

        
        // 각 객체를 구분하고 'type' 필드를 추가하여 리스트에 넣음
        if ("카페리뷰".equals(category) || "전체".equals(category)) {
            List<CafeRev> cafeReview = service.selectCafeRevByUserNo(member.getUserNo());
            
            // 검색어가 있으면 필터링  // trim=앞뒤공백제거, isEmpty=비어있는지확인
            if (search != null && !search.trim().isEmpty()) {
                cafeReview = cafeReview.stream() //stream=리스트에서 스트림 생성. 데이터의 흐름 처리. 하나씩 데이터를 꺼내어 차례대로 작업할 수 있게 해줌
                                       .filter(rev -> rev.getCafeName().contains(search)) 
                                       		// rev=카페리뷰객체하나. getCafeName()=카페이름 가져오기 contains=가져온이름에서 검색어 포함되어있는지확인
                                       .collect(Collectors.toList());
                							// 스트림에서 처리된 데이터를 리스트로 변환
            }            
	        for (CafeRev rev : cafeReview) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("type", "CafeRev");
	            map.put("data", rev);
	            myView.add(map);
	        }
        }
        
        if ("원두리뷰".equals(category) || "전체".equals(category)) {
            List<BeanRev> beanReview = service.selectBeanRevByUserNo(member.getUserNo());
 
            // 검색어가 있으면 필터링
            if (search != null && !search.trim().isEmpty()) {
                beanReview = beanReview.stream()
                                       .filter(rev -> rev.getBeanName().contains(search)) // 제목 필터링 (원두 이름)
                                       .collect(Collectors.toList());
            }            
	        for (BeanRev rev : beanReview) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("type", "BeanRev");
	            map.put("data", rev);
	            myView.add(map);
	        }
        }
        
        if ("자유게시판".equals(category) || "전체".equals(category)) {
            List<FreeBoard> freeboard = service.selectFreeBoardByUserNo(member.getUserNo());
          
            // 검색어가 있으면 필터링
            if (search != null && !search.trim().isEmpty()) {
                freeboard = freeboard.stream()
                                     .filter(rev -> rev.getFreeBoardTitle().contains(search)) // 제목 필터링 (게시글 제목)
                                     .collect(Collectors.toList());
            }    
	        for (FreeBoard rev : freeboard) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("type", "FreeBoard");
	            map.put("data", rev);
	            myView.add(map);
	        }
        }
        
        if ("나만의레시피".equals(category) || "전체".equals(category)) {
            List<MyRecipe> myRecipe = service.selectMyRecipeByUserNo(member.getUserNo());
           
            // 검색어가 있으면 필터링
            if (search != null && !search.trim().isEmpty()) {
                myRecipe = myRecipe.stream()
                                   .filter(rev -> rev.getMyRipTitle().contains(search)) // 제목 필터링 (레시피 제목)
                                   .collect(Collectors.toList());
            }
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
        
        // 페이징 처리
        int listCount  = 10; //한 페이지당 10개
        int totalCount = myView.size(); //총 게시글 수 = myView크기만큼
        int totalPage = (int) Math.ceil((double) totalCount / listCount ); 
        	// ex)데이터53개/페이지10개 = 5.3페이지가 필요 -> ceil로 반올림. 6페이지 나옴
        
        // 현재 페이지 (기본값 1)
        int curPage = param != null && param.getCurPage() > 0 ? param.getCurPage() : 1;
        	// 현재페이지가 null이 아닌게 맞다면 curPage.getCurPage(). null이라면 1페이지

        // 페이지별 시작/끝 글번호 계산
        int startNo = Math.max(0, (curPage - 1) * listCount );  // startIndex가 음수일 경우 0으로 처리
        	//만약 curPage = 3이고, pageSize = 10이라면, (3 - 1) * 10 = 2 * 10 = 20번째 글부터 시작
        int endNo = Math.min(startNo + listCount , totalCount);
        	//Math.min()은 두 값 중 더 작은 값을 반환(총게시글수 넘지않도록)
        
     // 범위가 올바른지 체크 (예방적 처리)
        if (startNo >= totalCount) {
        	startNo = totalCount;  // startIndex가 전체 데이터보다 크면 마지막 인덱스로 설정
        }
        if (startNo >= endNo) {
        	endNo = startNo;  // endIndex가 startIndex보다 작지 않도록 처리
        }      
        
        log.info("curPage: {}", curPage);
        log.info("startNo: {}", startNo);
        log.info("endNo: {}", endNo);
       
        // 해당 페이지에 맞는 데이터만 가져오기
//        List<Map<String, Object>> paginatedList = myView.subList(startNo, endNo);
        //myView 리스트에서 startIndex부터 endIndex까지 가져오기
        
//        if (startNo < totalCount) {
//            List<Map<String, Object>> paginatedList = myView.subList(startNo, endNo);
//            model.addAttribute("myView", paginatedList);
//        } else {
//            model.addAttribute("myView", new ArrayList<>());  // 빈 리스트 반환
//        }
        
        // 해당 페이지에 맞는 데이터만 가져오기
        List<Map<String, Object>> paginatedList = new ArrayList<>();
        	//빈 ArrayList를 생성하여 paginatedList라는 리스트를 초기화. 페이징된 데이터를 저장하는 용도
        if (startNo < totalCount) {
            paginatedList = myView.subList(startNo, endNo);
        }
        
        model.addAttribute("myView", paginatedList);// 페이징된 데이터만 전달
        
        
        // 페이지네이션 정보 계산 (현재 페이지, 시작 페이지, 끝 페이지)
//        int startPage = Math.max(1, curPage - 2);
        //최소1페이지시작. 
//        int endPage = Math.min(totalPage, curPage + 2);
        //끝페이지가 전체페이지수 넘지 않도록. 
        
        int pageCount = 10; //	한 화면에 출력될 페이지네이션의 개수
        int startPage = ((curPage-1)/pageCount)*pageCount + 1; 
        	//(페이지번호-1)/10=현재페이지가 속한 페이지그룹 +1
        int endPage = startPage + pageCount-1;
        	//현재그룹에서 끝 페이지 번호 계산
		
		// 페이지네이션 번호 보정
		if(endPage > totalPage) {
			endPage = totalPage;
		}
        
		//계산된 페이지네이션 정보를 Paging 객체로 생성
        Paging page = new Paging(curPage, totalCount, listCount,totalPage, startPage, endPage, pageCount);
        
        log.info("curPage현재페이지:{}",curPage);
        log.info("totalCount총게시글수:{}",totalCount);
        log.info("listCount한페이지에보여질게시글수:{}",listCount);
        log.info("totalPage총페이지수:{}",totalPage);
        log.info("startPage시작페이지:{}",startPage);
        log.info("endPage끝페이지:{}",endPage);
        log.info("page:{}",page);
        
//        model.addAttribute("myView", paginatedList); // 페이징된 데이터만 전달
//        model.addAttribute("myView", myView);
        model.addAttribute("paging", page);
        model.addAttribute("userNo", userNo);
        model.addAttribute("category", category);	
        model.addAttribute("search", search);
        
        log.info("page:{}",page);
        
	}	
	
	
	
	
	
	
}









