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
		
		List<BeanRev> beanRev = service.selectMyRev(beanSub.getUserNo());
		
		model.addAttribute("beanSubList",beanSubList);
		model.addAttribute("paging",paging);
		model.addAttribute("beanRev",beanRev);

		return "mypage/subscribe";
	}
	
	@PostMapping("/cancelsub")
	@ResponseBody
	public String cancelsubForm(
			@RequestParam("subNo") List<Integer> subNo
			) {
		log.info("subNo : {}",subNo);
		service.updateSubCancelBySubNo(subNo);
		
		return "redirect:/mypage/subscribe";
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
		
		if( (cafeWishNoList == null || cafeWishNoList.isEmpty())
				&& (beanWishList == null || beanWishList.isEmpty()) ) {
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
	
	
	@GetMapping("/myview")
	public void view(Model model
			, HttpSession session
			, Member member
			, @RequestParam(defaultValue = "전체") String category
			, Paging param
			, String search) {
		
		
	    // 세션에서 userNo 가져오기
	    Integer userNo = (Integer) session.getAttribute("userNo");
	//	int userNo = member.getUserNo();
	    
	    
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
	
	    
	    
	    // 날짜 기준으로 정렬
	    Collections.sort(myView, new Comparator<Map<String, Object>>() { //myView 리스트를 Comparator를 사용하여 정렬
	        @Override
	        public int compare(Map<String, Object> map1, Map<String, Object> map2) {
	            Date date1 = getDate(map1.get("data"));
	            Date date2 = getDate(map2.get("data"));
	            return date2.compareTo(date1);  // 최신 글이 먼저 오도록 내림차순 정렬 
	            // date1이 date2보다 이전날짜면 -1 / 같은 날짜면 0 / date1이 더 최신이면 1 반환
	        }
	
	        private Date getDate(Object obj) { //getDate 메서드에 전달된 obj 객체가 어떤 타입인지를 확인하고, 그에 맞는 날짜 정보를 추출하여 반환
	        	
	        	//다같은 Date타입이여도 클래스가 다르기때문에 해당 객체가 어떤 클래스에 속하는지 알기위해 instanceof를 사용
	        	
	            if (obj instanceof CafeRev) { //obj가 CafeRev 클래스의 인스턴스일 경우, ((CafeRev) obj).getRevDate()를 호출하여 해당 객체의 revDate 값을 반환
	                return ((CafeRev) obj).getRevDate(); //CafeRev 객체에서 getRevDate() 메서드를 호출하여 리뷰 날짜를 가져옴
	                
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
	        map.put("rownum", myView.size() - i); //역순인덱스
	    }
	    
	    
	    // 페이징 처리
	    int listCount  = 10; //한 페이지당 10개
	    int totalCount = myView.size(); //총 게시글 수 = myView크기만큼
	    int totalPage = (int) Math.ceil((double) totalCount / listCount ); 
	    	// ex)데이터53개/페이지10개 = 5.3페이지가 필요 -> ceil로 반올림. 6페이지 나옴
	    
	    // 현재 페이지 (기본값 1)
	    int curPage = param != null && param.getCurPage() > 0 ? param.getCurPage() : 1;
	    	// 현재페이지가 null이 아닌게 맞다면 curPage.getCurPage(). null 또는 0이하라면 1페이지
	
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
	    List<Map<String, Object>> paginatedList = new ArrayList<>();
	    	//빈 ArrayList를 생성하여 paginatedList라는 리스트를 초기화. 페이징된 데이터를 저장하는 용도
	    if (startNo < totalCount) {
	        paginatedList = myView.subList(startNo, endNo); //subList는 리스트의 특정 범위만 잘라서 새로운 리스트로 반환
	    }
	    
	    model.addAttribute("myView", paginatedList);// 페이징된 데이터만 전달
	
	    
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
	    
	//    model.addAttribute("myView", paginatedList); // 페이징된 데이터만 전달
	//    model.addAttribute("myView", myView);
	    model.addAttribute("paging", page);
	    model.addAttribute("userNo", userNo);
	    model.addAttribute("category", category);	
	    model.addAttribute("search", search);
	    
	    log.info("page:{}",page);
	    
	}	
	

	
	
	
}









