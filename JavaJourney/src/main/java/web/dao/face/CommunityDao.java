package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import web.dto.Cafe;
import web.dto.CafeRev;
import web.dto.CafeRevComm;
import web.dto.CupNote;
import web.dto.Event;
import web.dto.FreeBoard;
import web.dto.FreeBoardComment;
import web.dto.Member;
import web.dto.MemberQuizResult;
import web.dto.MyRecipe;
import web.dto.MyRecipeFile;
import web.dto.Notice;
import web.dto.QuizResult;


@Mapper
public interface CommunityDao {
	/**
	 * db에 저장된 카페 리뷰 리스트 불러오기
	 * 
	 * @param param - 사용자가 선택한 정렬방법, 검색어
	 * @return 해당 정보가 담긴 리스트
	 */
	public List<CafeRev> selectCafeReview(HashMap<String, Object> param);

	/**
	 * db에 저장된 해당 카페 리뷰 댓글 불러오기
	 * 
	 * @param revNo - 조회할 카페 리뷰 댓글이 담긴 카페 리뷰번호
	 * @return 해당 정보가 담긴 리스트
	 */
	public List<CafeRevComm> selectCafeReviewCommentListByCafeReviewNo(CafeRev revNo);

	/**
	 * 	db에 저장된 카페 리뷰 정보 불러오기
	 * 
	 * @param revNo - 조회할 카페 리뷰 번호
	 * @return 해당 리뷰 정보가 담긴 객체
	 */
	public CafeRev selectCafeReviewInfo(CafeRev revNo);

	/**
	 * 카페번호를 이용하여 카페 이름 불러오기
	 * 
	 * @param cafeNo - 조회할 카페 번호
	 * @return 조회된 카페 이름
	 */
	public String selectCafeNameByCafeNo(Cafe cafeNo);
	
	/**
	 * 유저아이디를 이용하여 유저넘버 갖고오기
	 * 
	 * @param userid - 유저넘버를 불러올 유저아이디
	 * @return 유저번호
	 */
	public int selectUsernoByUserid(String userId);
	
	/**
	 * 카페 리뷰 데이터를 입력한다
	 * 
	 * @param cafeRev - 카페 리뷰 작성 정보를 담은 객체
	 * @return 삽입된 인서트 행의 갯수
	 */
	public int insertCafeReview(CafeRev cafeRev);
	
	/**
	 * 게시글을 작성한 유저 아이디 정보 갖고오기
	 * 
	 * @param cafeRev - 조회할 유저 아이디를 담은 객체
	 * @return 작성자 아이디
	 */
	public String selectWriterId(CafeRev cafeRev);
	
	/**
	 * 게시글을 삭제한다
	 * 
	 * @param cafeRev - 삭제할 게시글 번호를 담은 객체
	 */
	public void deleteCafeReviewByCafeNo(CafeRev cafeRev);
	
	/**
	 * 리뷰 내용 수정하기
	 * 
	 * @param cafeRev - 수정한 내용이 담겨있는 게시글
	 * @return 업데이트 수행 결과
	 */
	public int updateCafeReviewByCafeNo(CafeRev cafeRev);
	
	/**
	 * 카테고리와 검색어로 필터링된 카페리뷰의 수
	 * 
	 * @param map - 카테고리, 검색어 정보를 담은 객체
	 * @return 필터링된 리뷰 갯수
	 */
	public int getCafeReviewTotalCnt(HashMap<String, String> map);

	/**
	 * db에 저장된 멤버테이블의 사업자 번호를 불러온다
	 * 
	 * @param userId - 사업자 번호를 조회할 아이디
	 * @return 사업자 등록번호
	 */
	public String selectBusinessNoByUserId(String userId);
	
	/**
	 * db에 저장된 카페테이블의 사업자 번호를 불러온다
	 * 
	 * @param revNo - 사업자 번호를 조회할 카페 리뷰 번호(리뷰->카페)
	 * @return 사업자 등록번호
	 */
	public String selectBusinessNoByCafeRevNo(CafeRev revNo);
	
	/**
	 * 카페 리뷰 댓글 삽입하기
	 * 
	 * @param comm - 댓글 정보가 저장된 객체
	 */
	public void insertCafeReviewComm(CafeRevComm comm);


	
	//자유게시판--------------------------------------------------------------------------------------
	/**
	 * 카테고리와 검색어로 필터링된 프리보드리스트 수
	 * 
	 * @param map - 카테고리,검색어 정보 담은 객체
	 * @return 필터링된 보드 갯수
	 */
	public int getFreeBoardTotalCnt(HashMap<String, String> map);
	
	/**
	 * 카테고리와 검색어로 필터링된 자유게시판 리스트
	 * 
	 * @param map - 페이징, 검색어 정보를 담은 객체
	 * @return - 필터링된 보드 리스트
	 */
	public List<FreeBoard> selectFreeBoardListAll(HashMap<String, Object> map);
	
	/**
	 * 자유게시판 번호로 자유게시판 조회
	 * @param freeBoard - 게시판 넘버를 담은 객체
	 * @return - 조회된 객체
	 */
	public FreeBoard selectFreeBoardByFreeBoardNo(FreeBoard freeBoard);
	
	/**
	 * 자유게시판 쓴 유저 정보 조회
	 * 
	 * 
	 * @param freeBoard - 유저 번호가 있는 자유게시판 객체
	 * @return - 조회된 멤버
	 */
	public Member selectMemberByFreeBoardNo(FreeBoard freeBoard);

	
	/**
	 * 자유게시판 삭제
	 * @param freeBoard - 자유게시판 번호가 담긴 객체
	 */
	public void deleteFreeBoardByFreeBoardNo(FreeBoard freeBoard); 
	
	/**
	 * 자유게시판 조회수 증가
	 * @param freeBoard
	 */
	public void updateFreeBoardHitByFreeBoardNo(FreeBoard freeBoard);
	
	/**
	 * 자유게시판 게시글 댓글 리스트 조회
	 * 
	 * @param freeBoard - 보드넘버
	 * @return - 조회된 댓글리스트
	 */
	public List<FreeBoardComment> selectFreeBoardCommentByFreeBoardNo(FreeBoard freeBoard);
	
	/**
	 * 댓글 삽입
	 * 
	 * @param freeBoardComment - 작성자 닉네임, 보드넘버, 내용 이 저장된 객체
	 */
	public void insertFreeBoardComment(FreeBoardComment freeBoardComment);
	
	/**
	 * 유저아이디로 멤버 객체 받기
	 * 
	 * @param userId
	 * @return
	 */
	public Member selectMemberByUserID(String userId);
	
	/**
	 * 댓글번호로 댓글 삭제
	 * 
	 * @param freeBoardComment - 댓글번호 있음
	 */
	public void deleteFreeBoardCommentByFreeBoardCommentNo(FreeBoardComment freeBoardComment);
	
	/**
	 * 각 보드의 댓글 수 얻기
	 * @param freeBoard - 보드전체 리스트 조회 결과
	 * @return 각 보드 댓글 수
	 */
	public int selectFreeBoardCommentCnt(FreeBoard freeBoard);
	
	/**
	 * 보드 인서트
	 * @param freeBoard
	 */
	public void insertFreeBoard(FreeBoard freeBoard);
	
	/**
	 * 보드 업데이트
	 * @param freeBoard 보드넘버,제목,내용
	 */
	public void updateFreeBoardByFreeBoardNo(FreeBoard freeBoard);
	
	/**
	 * 보드 추천 돼있는지 확인
	 * @param freeboard - 보드넘버,유저넘버 있음
	 * @return
	 */
	public int selectFreeBoardRecommendByFreeBoardNoUserNo(FreeBoard freeboard);
	/**
	 * 보드 추천 취소
	 * @param freeboard - 보드넘버,유저넘버 있음
	 * @return
	 */
	public void deleteFreeBoardRecommendByFreeBoardNoUserNo(FreeBoard freeboard);
	/**
	 * 보드 추천 
	 * @param freeboard - 보드넘버,유저넘버 있음
	 * @return
	 */
	public void insertFreeBoardRecommendByFreeBoardNoUserNo(FreeBoard freeboard);
	
	/**
	 * 자유 게시판 추천 수 
	 * @param freeBoard - 보드 넘버
	 * @return
	 */
	public int getFreeBoardRecCountByFreeBoardNo(FreeBoard freeBoard);
	
	/**
	 * 자유게시판 글 삭제 시 추천 삭제
	 * 
	 * @param freeBoard - 보드 넘버
	 * @return
	 */
	public void deleteFreeBoardRecommendByFreeBoardNo(FreeBoard freeBoard);
	//공지사항--------------------------------------------------------------------------------------

	/**
	 * 공지사항 검색 조건에 따른 글 수
	 * @param map - 검색어
	 * @return - 수
	 */
	public int getNoticeTotalCnt(HashMap<String, String> map);
	
	/**
	 * 
	 * 검색조건에 따라 공지사항 리스트 조회
	 * 
	 * @param paging
	 * @param search
	 * @return
	 */
	public List<Notice> selectNoticeListAll(HashMap<String, Object> map);
	
	/**
	 * 공지사항 번호로 공지사항 조회
	 * 
	 * @param notice - 공지사항 번호
	 * @return
	 */
	public Notice selectNoticeBtNoticeNo(Notice notice);
	//나만의레시피 ------------------------------------------------------------------------------------------------
	/**
	 * 나만의 레시피 검색조건에 따른 글 수
	 * @param map - 검색어
	 * @return
	 */
	public int getMyRecipeTotalCnt(HashMap<String, String> map);
	
	/**
	 * 검색조건에 따른 나만의 레시피 목록
	 * @param map - 페이징, 검색어 있음
	 * @return
	 */
	public List<MyRecipe> selectMyRecipeListAll(HashMap<String, Object> map);
	
	/**
	 * 유저넘버로 멤버 객체 얻기
	 * @param userNo
	 * @return
	 */
	public Member selectMemberByUserNo(int userNo);
	
	/**
	 * 나만의 레시피 번호 
	 * @return - 나만의 레시피 시퀀스 값
	 */
	public int getMyRecipeNextVal();
	
	/**
	 * 나만의 레시피 글 작성
	 * @param myRecipe
	 */
	public void insertMyRecipe(MyRecipe myRecipe);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---------------event
	
	/**
	 * 모든 이벤트 목록 DB 조회
	 * @return
	 */
	public List<Event> selectEventAllList();

	
	/**
	 * eveOriName, eveStart, eveEnd, eveImg를 전달받아서 DB에 삽입하기
	 * @param event
	 */
	public void insertEventData(Event event);
	/**
	 * 이벤트 상세정보 DB 조회
	 * @param event
	 * @return 
	 */
	public Event selectByEventNo(Event event);
	
	/**
	 * 이벤트 번호로 이벤트 삭제
	 * @param event
	 */
	public void deleteEventByEventNo(Event event);
	

	/**
<<<<<<< HEAD
	 * 나만의 레시피 글 작성시 파일 업로드
	 * @param myRecipeFile
	 */
	public void insertMyRecipeFile(MyRecipeFile myRecipeFile);
	
	/**
	 * 나만의 레시피 조회
	 * 
	 * @param myRecipe - 나만의 레시피 글번호
	 * @return - 조회된 한 행
	 */
	public MyRecipe selectMyRecipeByMyRecipeNo(MyRecipe myRecipe);
	/**
	 * 카페 리뷰 댓글 갯수 세기
	 * 
	 * @param c - 조회할 카페 리뷰
	 * @return 카페 리뷰 갯수
	 */
	public int getCafeReviewCommentCnt(CafeRev c);

	/**
	 * 카페 리뷰 게시글 삭제 시 댓글 삭제
	 * 
	 * @param cafeRev - 댓글을 삭제할 게시글 번호
	 */
	public void deleteCafeReviewCommByCafeNo(CafeRev cafeRev);

	/**
	 * 	모든 카페 리뷰 번호 불러오기
	 * 
	 * @return 불러온 카페 리뷰 번호
	 */
	public List<Integer> getCafeRevNos();



	
	/**
	 * 유저의 취향 조사 결과 리스트 가져옴
	 * 
	 * @param member
	 * @return
	 */
	public List<MemberQuizResult> selectMemberQuizResultByUserNo(Member member);

	/**
	 * 취향조사 결과 번호로 퀴즈번호,원두번호,컵노트번호,분쇄번호,추출번호
	 * , 원두명 , cupnote이름 , 그라인드네임, 추출네임 얻기
	 * @param mqr - 취향조사결과 번호 있음
	 * @return - 위 정보가 담긴 리스트 한 번호당 3개씩 나옴 맛이 3개라서
	 */
	public List<QuizResult> selectQuizResultByMemberQuizResultNo(MemberQuizResult mqr);

	/**
	 * 컵노트 리스트 다 가져오기
	 * @return
	 */
	public List<CupNote> selectCupNoteList();

	/**
	 * 조회수++
	 * @param myRecipe
	 */
	public void updateMyRecipeHit(MyRecipe myRecipe);
	
	/**
	 * 글 번호로 파일 가져오기
	 * 
	 * @param myRecipe - 글번호
	 * @return
	 */
	public MyRecipeFile selectMyRecipeFileByMyRipNo(MyRecipe myRecipe);
	
	/**
	 * 나만의 레시피 글 수정
	 * @param myRecipe -  글 번호,제목,내용 있음
	 */
	public void updateMyRecipe(MyRecipe myRecipe);
	
	/**
	 * 나만의 레시피 글 수정시 파일 있을 떄 삭제
	 * 
	 * @param myRecipe
	 */
	public void deleteMyRecipeFileByMyRipNo(MyRecipe myRecipe); 
}




















