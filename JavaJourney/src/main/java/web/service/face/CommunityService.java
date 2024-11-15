package web.service.face;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Bean;
import web.dto.BeanRev;
import web.dto.BeanRevComm;
import web.dto.BeanSub;
import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.CupNote;
import web.dto.Event;
import web.dto.Extraction;
import web.dto.FreeBoard;
import web.dto.FreeBoardComment;
import web.dto.Grind;
import web.dto.Member;
import web.dto.MyRecipe;
import web.dto.MyRecipeComment;
import web.dto.MyRecipeFile;
import web.dto.Notice;
import web.dto.QuizResult;
import web.util.Paging;


public interface CommunityService {
	
	/**
	 * 협약 카페리뷰 리스트 불러오기
	 * 
	 * @param category - 카테고리
	 * @param order - 정렬순
	 * @param search - 검색
	 * @param paging - 페이징
	 * @return 카페리뷰 리스트
	 */
	public List<CafeRev> getCafeReviewList(String category, String order, String search, Paging paging);
	
	
	/**
	 * 카페 리뷰 댓글 정보 불러오기
	 * 
	 * @param revNo - 조회할 게시글 번호
	 * @return 카페리뷰댓글 리스트
	 */
	public List<CafeRevComm> getCafeReviewCommentList(CafeRev revNo);

	/**
	 * 카페 리뷰 정보 불러오기
	 * 
	 * @param revNo - 조회할 게시글 번호
	 * @return 조회된 카페 리뷰
	 */
	public CafeRev getCafeReviewInfo(CafeRev revNo);

	/**
	 * 카페번호를 이용하여 카페이름 불러오기
	 * 
	 * @param cafeNo - 조회할 카페 번호
	 * @return 카페이름
	 */
	public String getCafeName(Cafe cafeNo);
	
	/**
	 * 
	 * 조건에 따른 자유게시판 리스트 조회
	 * 
	 * @param paging - 카테고리, 검색어로 필터링한 페이징 객체
	 * @param search - 검색어
	 * @return - 필터링된 자유게시판 리스트
	 */
	public List<FreeBoard> getFreeBoardList(Paging paging , String search,String category);
	
	/**
	 * 조건에 따른 페이징 객체 생성
	 * @param curPage - 현재페이지 정보
	 * @param search - 검색어
	 * @param category - 카테고리
	 * @return - 조건에 따른 페이징 객체
	 */
	public Paging getFreeBoardPaging(Paging curPage, String search, String category);
	
	/**
	 * 자유게시판 상세보기
	 * 
	 * @param freeBoard - 보드 넘버가 담긴 자유게시판객체
	 * @return 조회된 자유게시판
	 */
	public FreeBoard getFreeBoardView(FreeBoard freeBoard);
	
	/**
	 * 
	 * 자유게시판 작성자 조회
	 * 
	 * @param freeBoard 유저 넘버가 담긴 보드 객체
	 * @return - 조회된 멤버
	 */
	public Member getMemberByFreeBoardNo(FreeBoard freeBoard);

	/**
	 * 유저 아이디를 이용하여 유저번호 갖고오기
	 * 
	 * @param userid - 유저번호를 조회할 아이디(로그인한 아이디)
	 * @return 유저번호
	 */
	public int getUserNo(String userId);

	/**
	 * 사용자가 입력한 본문 내용을 저장한다
	 * 
	 * @param cafeRev - 사용자가 입력한 본문
	 */
	public void joinCafeReview(CafeRev cafeRev);

	/**
	 * 작성자 아이디 불러오기
	 * 
	 * @param cafeRev - 조회할 게시글
	 * @return 조회된 작성자 아이디
	 */
	public String getWriterId(CafeRev cafeRev);

	/**
	 * 게시글 삭제하기
	 * 
	 * @param cafeRev - 삭제할 게시글 번호를 담은 객체
	 */
	public void dropCafeReview(CafeRev cafeRev);
	
	/**
	 * 자유게시판 삭제
	 * @param freeBoard - 보드넘버를 가진 객체
	 */
	public void dropFreeBoard(FreeBoard freeBoard);
	
	/**
	 * 조회수 증가
	 * @param freeBoard - 보드 넘버 
	 */
	public void freeBoardHitUp(FreeBoard freeBoard);
	
	/**
	 * 
	 * 게시판 댓글 조회
	 * 
	 * @param freeBoard - freeBoard 유저 넘버가 담긴 보드 객체
	 * @return 조회된 댓글 리스트
	 */
	public List<FreeBoardComment> getFreeBoardCommentList(FreeBoard freeBoard);
	
	/**
	 *  자유게시판 댓글 등록
	 * @param freeBoard - 보드번호
	 * @param freeBoardComment - 댓글 내용
	 * @param session - 유저
	 */
	public void joinFreeBoardComment(FreeBoardComment freeBoardComment, HttpSession session);
	
	/**
	 * 댓글번호로 댓글 삭제
	 * @param freeBoardComment - 댓글번호 있는 객체
	 */
	public void dropFreeBoardComment(FreeBoardComment freeBoardComment);
	
	/**
	 * 자유게시판 댓글 수정
	 * 
	 * @param freeBoardComment - 내용,글번호
	 */
	public void changeFreeBoardComment(FreeBoardComment freeBoardComment);
	
	/**
	 * 보드 인서트
	 * @param freeBoard - 제목,컨텐츠,카테고리 있음
	 * @param session - 유저 정보 있음
	 */
	public void joinFreeBoard(FreeBoard freeBoard, HttpSession session);
	
	/**
	 * 보드 수정
	 * @param freeBoard - 보드넘버,제목,내용 있음
	 */
	public void changeFreeBoard(FreeBoard freeBoard);
	
	/**
	 * 자유 게시판 추천
	 * @param freeBoard - 보드넘버
	 * @param session - 아이디 가져올거임
	 * @return
	 */
	public boolean isFreeBoardRec(FreeBoard freeBoard,HttpSession session);
	
	/**
	 * 자유 게시판 추천 체크
	 * @param freeBoard - 보드넘버
	 * @param session - 아이디 가져올거임
	 * @return
	 */
	public boolean isFreeBoardRecCheck(FreeBoard freeBoard,HttpSession session);
	
	/**
	 * 자유 게시판 추천수
	 * @param freeBoard - 보드 넘버 있음
	 * @return
	 */
	public int getFreeBoardRecCount(FreeBoard freeBoard);
	
	/**
	 * 카페 리뷰 수정하기
	 * 
	 * @param cafeRev 수정할 게시글 번호
	 */
	public void changeCafeReview(CafeRev cafeRev);


	/**
	 * 카페리뷰 페이징
	 * 
	 * @param curPage - 현재페이지정보
	 * @param category - 카테고리
	 * @param order - 정렬방법
	 * @param search - 검색어
	 * @return 페이징 객체
	 */
	public Paging getCafeReviewPaging(Paging curPage, String category, String order, String search);

	/**
	 * 카페 리뷰 댓글을 단다
	 * 
	 * @param revNo - 댓글을 작성할 게시글 번호
	 * @param comm - 댓글 내용
	 * @param session - 유저 번호 갖고오기
	 */
	public void writeCafeReviewComm(CafeRev revNo, CafeRevComm comm, String userId);

	/**
	 * 유저의 사업자 등록번호 갖고오기
	 * 
	 * @param userId - 사업자 등록번호를 조회할 아이디
	 * @return 사업자 등록번호
	 */
	public String getBusinessNoFromMember(String userId);

	/**
	 * 카페 리뷰 게시물의 해당하는 카페의 사업자 등록번호 갖고오기
	 * 
	 * @param revNo - 가져올 사업자 등록번호를 조회할 리뷰번호
	 * @return 사업자 등록번호
	 */
	public String getBusinessNoFromCafeReviewNo(CafeRev revNo);
	
	/**
	 * 조건에 따른 페이징 객체 얻기
	 * 
	 * @param curPage - 현재페이지
	 * @param search - 검색어
	 */
	public Paging getNoticePaging(Paging curPage, String search);
	
	/**
	 * 조건에 따른 공지사항 리스트 얻기
	 * 
	 * @param paging
	 * @param search
	 * @return
	 */
	public List<Notice> getNoticeList(Paging paging, String search);
	
	/**
	 * 공지사항 번호로 공지사항 한개 조회
	 * 
	 * @param notice 공지사항 번호
	 * @return
	 */
	public Notice getNotice(Notice notice);
	
	/**
	 * 나만의 레시피 페이징
	 * @param paging - curPage
	 * @param search - 검색어
	 * @return - 
	 */
	public Paging getMyRecipePaging(Paging curPage, String search);
	
	/**
	 * 
	 * 검색조건에 따른 리스트 
	 * @param paging - 페이징 객체
	 * @param search - 검색어
	 * @return
	 */
	public List<MyRecipe> getMyRecipeList(Paging paging, String search);
	
	/**
	 * 나만의 레시피 글 작성
	 * @param session - 유저 정보 가져올거임
	 * @param myRecipe - 제목,내용 있음
	 * @param file
	 */
	public void uploadMyRecipe(HttpSession session, MyRecipe myRecipe,MultipartFile file);
	
	/**
	 * 분쇄도 리스트
	 * @return
	 */
	public List<Grind> getGrindList();
	/**
	 * 추출법 리스트
	 * @return
	 */
	public List<Extraction> getExtractionList();
	/**
	 *콩 리스트
	 * @return
	 */
	public List<Bean> getBeanList();
	/**
	 * 빈 넘버로 컵노트 가져오기
	 * @return
	 */
	public List<CupNote> getCupList(Bean bean);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---------------event
	
	/**
	 * 이벤트 목록 전부 조회
	 * @return
	 */
	public List<Event> selectByAll();

	
	/**
	 * eveOriName, eveStart, eveEnd, eveImg를 전달받아서 DB에 삽입하기
	 * @param event - eveOriName, eveStart, eveEnd, eveImg
	 */
	public void insertEvent(Event event);

	/**
	 * event 상세보기
	 * @param event
	 * @return 
	 */
	public Event eventInfoByeventNo(Event event);

	/**
	 * 이벤트 삭제
	 * @param event
	 */
	public void eventDeleteByEventNo(Event event);


	public Map<String, Integer> getPrevNextRevNos(CafeRev revNo);

	
	/**
	 * 나만의 레시피 상세
	 * 
	 * @param myRecipe - 나만의 게시피 글 번호
	 * @return
	 */
	public MyRecipe getMyRecipeInfo(MyRecipe myRecipe);
	
	/**
	 * 유저넘버로 멤버객체 얻기
	 * 
	 * @param 
	 * @return
	 */
	public Member getMemberByUserNo(MyRecipe myRecipe);
	
	/**
	 * Id로 유저 얻기
	 * @param userNick
	 * @return
	 */
	public Member getMemberByUserId(String userId);
	
	/**
	 * 유저넘버에 해당하는 취향조가 결과의 내용물 반환
	 * 
	 * @param member - 유저넘버 있음
	 * @return
	 */
	public List<List<QuizResult>> getQuizResultByUserNo(Member member);
	
	/**
	 * 맛과향 다 가져와
	 * @return
	 */
	public List<CupNote> getCupNoteNameList();
	
	/**
	 * 나만의 게시판 조회수+1
	 * @param myRecipe
	 */
	public void myRrcipeHitUp(MyRecipe myRecipe);
	
	/**
	 * 파일 얻어오기
	 * @param myRecipe - 나만의 레시피 번호
	 * @return
	 */
	public MyRecipeFile getMyRecipeFile(MyRecipe myRecipe);
	
	/**
	 * 나만의 레시피 수정
	 * 
	 * @param myRecipe
	 * @param file
	 */
	public void changeMyRecipe( MyRecipe myRecipe, MultipartFile file);

	/**
	 * 작성자아이디에 맞는 닉네임을 불러온다
	 * 
	 * @param writerId - 닉네임을 조회할 아이디
	 * @return 작성자 닉네임
	 */
	public String getwriterNick(String writerId);
	
	/**
	 * 나만의 레시피 댓글
	 * @param myRecipeComment - 내용 있음
	 * @param session - 유저 가져올거임
	 */
	public void joinMyRecipeComment(MyRecipeComment myRecipeComment,HttpSession session);
	
	/**
	 * 나만의 레시피 댓글목록
	 * 
	 * @param myRecipe - 나만의레시피 글번호
	 * @return
	 */
	public List<MyRecipeComment> getMyRecipeCommentList(MyRecipe myRecipe);
	
	/**
	 * 나만의 레시피 댓글 삭제
	 * 
	 * @param myRecipeComment 댓글 번호
	 */
	public void dropMyRecipeComment(MyRecipeComment myRecipeComment);
	
	/**
	 * 나만의 레시피 추천 확인
	 * 
	 * @param myRecipe - 나만의 레시피 번호
	 * @param session - 유저 번호
	 * @return
	 */
	public boolean myRecipeRecommendCheck(MyRecipe myRecipe, HttpSession session);
	
	/**
	 * 나만의 레시피 추천 수 
	 * 
	 * @param myRecipe - 글번호
	 * @return
	 */
	public int getMyRecipeRecommendCount(MyRecipe myRecipe);
	
	/**
	 * 나만의 레시피 추천하기
	 * 
	 * @param myRecipe
	 * @param session
	 * @return
	 */
	public boolean myRecipeRecommend(MyRecipe myRecipe, HttpSession session);
	
	/**
	 * 나만의 레시피 글 삭제
	 * 파일,댓글,추천 같이 삭제해야됨
	 * 
	 * @param myRecipe - 나만의 레시피 글 번호
	 */
	public void dropMyRecipe(MyRecipe myRecipe);

	/**
	 * 댓글 삭제
	 * 
	 * @param caferevcommno - 삭제할 댓글 번호
	 */
	public void dropCafeReviewComment(CafeRevComm caferevcommno);

	/**
	 * 카페 리뷰 댓글 수정
	 * 
	 * @param cafeRevCommCont - 수정할 댓글 내용
	 */
	public void changeCafeReviewComment(CafeRevComm cafeRevComm);
	
	/**
	 * 나만의 레시피 댓글 수정
	 * @param myRecipeComment - 댓글 번호, 댓글 내용 
	 */
	public void changeMyRecipeComment(MyRecipeComment myRecipeComment);

	/**
	 * 원두 리뷰 리스트 불러오기
	 * 
	 * @param category
	 * @param order
	 * @param search
	 * @param paging
	 * @return
	 */
	public List<BeanRev> getBeanReviewList(String category, String order, String search, Paging paging);

	/**
	 * 원두 리뷰 페이징
	 * 
	 * @param curPage
	 * @param category
	 * @param order
	 * @param search
	 * @return
	 */
	public Paging getBeanReviewPaging(Paging curPage, String category, String order, String search);

	/**
	 * 원두 리뷰 댓글 리스트 갖고오긔
	 * 
	 * @param revNo
	 * @return
	 */
	public List<BeanRevComm> getBeanReviewCommentList(BeanRev revNo);


	/**
	 * 원두 리뷰 정보 불러오기
	 * 
	 * @param revNo
	 * @return
	 */
	public BeanRev getBeanReviewInfo(BeanRev revNo);


	/**
	 * 리뷰 작성한 유저의 아이디 갖고오기
	 * 
	 * @param beanRev
	 * @return
	 */
	public String getWriterId(BeanRev beanRev);

	/**
	 * 이전/다음 리뷰 갯수 갖고오기
	 * 
	 * @param revNo
	 * @return
	 */
	public Map<String, Integer> getPrevNextRevNos(BeanRev revNo);

	/**
	 * 게시글에 해당하는 원두의 사업자 번호 갖고오기
	 * 
	 * @param revNo
	 * @return
	 */
	public String getBusinessNoFromBeanReviewNo(BeanRev revNo);

	/**
	 * 원두의 맛과 향 리스트 갖고오기
	 * 
	 * @param beanRev
	 * @return
	 */
	public List<BeanRev> getBeanTasteList(BeanRev beanRev);

	/**
	 * 게시글 작성의 원두이름을 갖고온다
	 * 
	 * @param beanNo
	 * @return
	 */
	public String getBeanName(int beanNo);

	/**
	 * 원두 리뷰 게시글 작성하기
	 * 
	 * @param beanRev
	 */
	public void joinBeanReview(BeanRev beanRev);

	/**
	 * 원두 리뷰 삭제
	 * 
	 * @param beanRev
	 */
	public void dropBeanReview(BeanRev beanRev);

	/**
	 * 구독번호로 원두 번호 갖고오기
	 * 
	 * @param subNo
	 * @return
	 */
	public Integer getBeanNo(Integer subNo);

	/**
	 * 원두 리뷰 수정
	 * 
	 * @param beanRev
	 */
	public void changeBeanReview(BeanRev beanRev);

	/**
	 * 원두 리뷰 댓글달기
	 * 
	 * @param revNo
	 * @param commCont
	 * @param userId
	 */
	public void writeBeanReviewComm(BeanRev revNo, BeanRevComm commCont, String userId);

	/**
	 * 원두 리뷰 댓글 삭제
	 * 
	 * @param commNo
	 */
	public void dropBeanReviewComment(BeanRevComm commNo);
	
	
}













