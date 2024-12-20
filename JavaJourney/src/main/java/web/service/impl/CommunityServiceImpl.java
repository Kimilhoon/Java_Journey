package web.service.impl;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import web.dao.face.CommunityDao;
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
import web.dto.MemberQuizResult;
import web.dto.MyRecipe;
import web.dto.MyRecipeComment;
import web.dto.MyRecipeFile;
import web.dto.MyRecipeRecommend;
import web.dto.Notice;
import web.dto.QuizResult;
import web.service.face.CommunityService;
import web.util.Paging;

@Service
@Slf4j
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired private CommunityDao dao;
	@Autowired private ServletContext context;
	

	//자유게시판--------------------------------------------------------------------------------
	@Override
	public Paging getFreeBoardPaging(Paging curPage, String search, String category ,String order,String searchType) {
//		log.info("{}",search);
//		log.info("{}",category);
		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		if(category == null || "".equals(category)||"all".equals(category)||"N".equals(category)) {
			category = "N";
		}else if(category.equals("cafe")) {
			category="카페";
		}else {
			category="원두";
		}
		
		if(search == null || "".equals(search)) {
			search = "N";
		}
		
		
		
		if(searchType == null || "".equals(searchType)) {
			searchType = "title";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("category", category);
		map.put("order", order);
		map.put("searchType", searchType);

		int totalCnt = dao.getFreeBoardTotalCnt(map);
		
		log.info("totalCNT{}",totalCnt);
		
		Paging paging = new Paging(curPage.getCurPage(),totalCnt);
		
		return paging;
	}
	
	@Override
	public List<FreeBoard> getFreeBoardList(Paging paging, String search,String category,String order,String searchType) {
		
		if(category == null || "".equals(category)||"all".equals(category)||"N".equals(category)) {
			category = "N";
		}else if(category.equals("cafe")) {
			category="카페";
		}else {
			category="원두";
		}
		
		if(order == null || "".equals(order)) {
			order = "W";
		}
		
		if(searchType == null || "".equals(searchType)) {
			searchType = "title";
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("search", search);
		map.put("category", category);
		map.put("order", order);
		map.put("searchType", searchType);
		List<FreeBoard> freeBoardList = dao.selectFreeBoardListAll(map);
		for(FreeBoard f : freeBoardList) {
			f.setFreeBoardCommentCount(dao.selectFreeBoardCommentCnt(f));
			f.setFreeBoardRecommendCount(dao.getFreeBoardRecCountByFreeBoardNo(f));
		}
		
		return freeBoardList;
	}
	
	@Override
	public FreeBoard getFreeBoardView(FreeBoard freeBoard) {
		freeBoard = dao.selectFreeBoardByFreeBoardNo(freeBoard);
		return freeBoard;
	}
	
	@Override
	public Member getMemberByFreeBoardNo(FreeBoard freeBoard) {
		return dao.selectMemberByFreeBoardNo(freeBoard);
	}
	@Override
	public void dropFreeBoard(FreeBoard freeBoard) {
		
		List<FreeBoardComment> cList = dao.selectFreeBoardCommentByFreeBoardNo(freeBoard);
		dao.deleteFreeBoardRecommendByFreeBoardNo(freeBoard);
		for(FreeBoardComment c:cList) {
			dao.deleteFreeBoardCommentByFreeBoardCommentNo(c);
		}
		dao.deleteFreeBoardByFreeBoardNo(freeBoard);
	}
	@Override
	public void freeBoardHitUp(FreeBoard freeBoard) {
		dao.updateFreeBoardHitByFreeBoardNo(freeBoard);
	}
	
	@Override
	public List<FreeBoardComment> getFreeBoardCommentList(FreeBoard freeBoard) {
		return dao.selectFreeBoardCommentByFreeBoardNo(freeBoard);
	}
	
	@Override
	public void joinFreeBoardComment(FreeBoardComment freeBoardComment, HttpSession session) {
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoardComment.setUserNo(member.getUserNo());
		freeBoardComment.setUserNick(member.getUserNick());
		dao.insertFreeBoardComment(freeBoardComment);
		
	}
	
	@Override
	public void dropFreeBoardComment(FreeBoardComment freeBoardComment) {
		dao.deleteFreeBoardCommentByFreeBoardCommentNo(freeBoardComment);
		dao.deleteFreeBoardCommentByFreeBoardCommTag(freeBoardComment);
	}
	
	@Override
	public void joinFreeBoard(FreeBoard freeBoard, HttpSession session) {
		if(freeBoard.getFreeBoardCategory().equals("cafe")) {
			freeBoard.setFreeBoardCategory("카페");
		}else {
			freeBoard.setFreeBoardCategory("원두");
			
		}
		if(freeBoard.getFreeBoardMapX() == null || freeBoard.getFreeBoardMapY()==null || "".equals(freeBoard.getFreeBoardMapX())) {
			freeBoard.setFreeBoardMapX("123");
			freeBoard.setFreeBoardMapY("127.27331371310157");
		}
		
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoard.setUserNick(member.getUserNick());
		freeBoard.setUserNo(member.getUserNo());
		log.info("{}",freeBoard);
		dao.insertFreeBoard(freeBoard);
	}
	
	@Override
	public void changeFreeBoard(FreeBoard freeBoard) {
		if(freeBoard.getFreeBoardMapX()==null || "".equals(freeBoard.getFreeBoardMapX())) {
			freeBoard.setFreeBoardMapX("123");
			freeBoard.setFreeBoardMapY("123");
		}
		dao.updateFreeBoardByFreeBoardNo(freeBoard);
	}
	
	@Override
	public boolean isFreeBoardRec(FreeBoard freeBoard, HttpSession session) {
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoard.setUserNo(member.getUserNo());
		int res = dao.selectFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
		if(res>0) {

			dao.deleteFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
			return false;
		}else {
			dao.insertFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
			return true;
		}
	}
	
	@Override
	public boolean isFreeBoardRecCheck(FreeBoard freeBoard, HttpSession session) {
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		freeBoard.setUserNo(member.getUserNo());
		int res = dao.selectFreeBoardRecommendByFreeBoardNoUserNo(freeBoard);
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public int getFreeBoardRecCount(FreeBoard freeBoard) {
		return dao.getFreeBoardRecCountByFreeBoardNo(freeBoard);
	}
	
	@Override
	public void changeFreeBoardComment(FreeBoardComment freeBoardComment) {
		dao.updateFreeBoardCommentByCommentNo(freeBoardComment);
	}
	
	//공지사항--------------------------------------------------------------------------------
	
	@Override
	public Paging getNoticePaging(Paging curPage, String search) {
		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		if(search == null || "".equals(search)) {
			search = "N";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
 
		int totalCnt = dao.getNoticeTotalCnt(map);
		
		log.info("totalCNT{}",totalCnt);
		
		Paging paging = new Paging(curPage.getCurPage(),totalCnt);
		
		return paging;
	}
	
	@Override
	public List<Notice> getNoticeList(Paging paging, String search) {

	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("search", search);
		List<Notice> noticeList = dao.selectNoticeListAll(map);
		
		return noticeList;
		
	}
	
	@Override
	public Notice getNotice(Notice notice) {
		return dao.selectNoticeBtNoticeNo(notice);
	}
	
	@Override
	public void insertNotice(Notice notice) {
		dao.insertNoticeByTitleContent(notice);
	}	
	
	@Override
	public void updateNoticeByNoticeNo(Notice notice) {
		dao.updateNotice(notice);
	}
	
	@Override
	public void deleteNoticeByNoticeNo(int noticeNo) {
		dao.deleteNotice(noticeNo);
	}
	
	//나만의 레시피 ------------------------------------------------------------------------------------
	@Override
	public Paging getMyRecipePaging(Paging curPage, String search,String searchType) {
		
		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		if(search == null || "".equals(search)) {
			search = "N";
		}
		if(searchType == null || "".equals(searchType)) {
			searchType = "title";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("searchType", searchType);

		int totalCnt = dao.getMyRecipeTotalCnt(map);
		
		log.info("totalCNT{}",totalCnt);
		
		Paging paging = new Paging(curPage.getCurPage(),totalCnt);
		
		return paging;
	}
	
	@Override
	public List<MyRecipe> getMyRecipeList(Paging paging, String search,String searchType,String order) {
		
		if(order == null || "".equals(order)) {
			order = "W";
		}
		if(searchType == null || "".equals(searchType)) {
			searchType = "title";
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("search", search);
		map.put("order", order);
		map.put("searchType", searchType);
		List<MyRecipe> myRecipeList = dao.selectMyRecipeListAll(map);
		for(MyRecipe mr : myRecipeList) {
			mr.setUserNick( (dao.selectMemberByUserNo(mr.getUserNo())).getUserNick() );
			mr.setMyRipCommentCount(dao.selectMyRecipeCommentCountByMyRipNo(mr));
			mr.setMyRipRecommendCount(dao.selectMyRecipeRecommendCountByMyRipNo(mr));
		}
		
		
		return myRecipeList;
	}
	
	
	@Override
	public void uploadMyRecipe(HttpSession session, MyRecipe myRecipe, MultipartFile file) {
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		myRecipe.setMyRipNo(dao.getMyRecipeNextVal());
		myRecipe.setUserNo(member.getUserNo());
		myRecipe.setUserNick(member.getUserNick());
		if(myRecipe.getMyRipImgNo()==0) {
			myRecipe.setMyRipImgNo(1);
		}
//		log.info("{}",myRecipe);
//		log.info("{}",context.getRealPath("upload"));
		dao.insertMyRecipe(myRecipe);
		if(file==null || file.isEmpty() || file.getSize()<=0) {
			log.info("파일 이상");
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		File upFolder = new File(context.getRealPath("upload"));
		upFolder.mkdir();
		//파일이 저장될 이름
		String storedName = null;
				
		//파일을 저장시킬 객체
		File dest = null;
		do {
			storedName = file.getOriginalFilename();
			storedName += UUID.randomUUID().toString().split("-")[3];
			dest = new File(upFolder,storedName);
		}while(dest.exists()); 
		
		try {
			// 업로드된 임시 파일을 upload폴더로 옮겨 실제 파일을 생성
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		myRecipe.setMyRipFileOriginName(file.getOriginalFilename());
		myRecipe.setMyRipFileStoredName(storedName);
		
		MyRecipeFile myRecipeFile = new MyRecipeFile();
		myRecipeFile.setMyRipNo(myRecipe.getMyRipNo());
		myRecipeFile.setMyRipFileOriginName(file.getOriginalFilename());
		myRecipeFile.setMyRipFileStoredName(storedName);
		
		
		dao.insertMyRecipeFile(myRecipeFile);

			
	}
	
	@Override
	public MyRecipe getMyRecipeInfo(MyRecipe myRecipe) {
		MyRecipe mr = dao.selectMyRecipeByMyRecipeNo(myRecipe);
		
		log.info("빈빈빈빈빈{}",mr);
		String bean = dao.selectBeanByBeanNo(mr.getBeanNo());
		mr.setBeanName(bean);
		log.info("빈빈빈빈빈{}",bean);
		
		
		return mr;
	}

	
	@Override
	public Member getMemberByUserNo(MyRecipe myRecipe) {
		return dao.selectMemberByUserNo(myRecipe.getUserNo());
	}
	
	@Override
	public Member getMemberByUserId(String userId) {
		return dao.selectMemberByUserID(userId);
	}
	
	
	@Override
	public List<List<QuizResult>> getQuizResultByUserNo(Member member) {
		
		List<MemberQuizResult> mqrList = dao.selectMemberQuizResultByUserNo(member);
		
		List<List<QuizResult>> list = new ArrayList<List<QuizResult>>();
		
		
		for(MemberQuizResult mqr : mqrList) {
			List<QuizResult> qr = dao.selectQuizResultByMemberQuizResultNo(mqr);
			list.add(qr);
		}
		
		return list;
	}
	
	@Override
	public List<CupNote> getCupNoteNameList() {
		return dao.selectCupNoteList();
	}
	@Override
	public void myRrcipeHitUp(MyRecipe myRecipe) {
		dao.updateMyRecipeHit(myRecipe);
	}
	
	@Override
	public MyRecipeFile getMyRecipeFile(MyRecipe myRecipe) {
		MyRecipeFile myRecipeFile = dao.selectMyRecipeFileByMyRipNo(myRecipe);
		
		return myRecipeFile;
	}
	
	@Override
	public void changeMyRecipe(MyRecipe myRecipe, MultipartFile file) {
		dao.updateMyRecipe(myRecipe);
		MyRecipeFile myRecipeFile = dao.selectMyRecipeFileByMyRipNo(myRecipe);
		
		if(myRecipeFile == null) {
			if(file.getOriginalFilename().length()<1) {
				return;
			}
			myRecipeFile = new MyRecipeFile();
			String storedPath = context.getRealPath("upload");
			File upFolder = new File(context.getRealPath("upload"));
			upFolder.mkdir();
			//파일이 저장될 이름
			String storedName = null;
					
			//파일을 저장시킬 객체
			File dest = null;
			do {
				storedName = file.getOriginalFilename();
				storedName += UUID.randomUUID().toString().split("-")[3];
				dest = new File(upFolder,storedName);
			}while(dest.exists()); 
			
			try {
				// 업로드된 임시 파일을 upload폴더로 옮겨 실제 파일을 생성
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			myRecipe.setMyRipFileOriginName(file.getOriginalFilename());
			myRecipe.setMyRipFileStoredName(storedName);
			
			myRecipeFile.setMyRipNo(myRecipe.getMyRipNo());
			myRecipeFile.setMyRipFileOriginName(file.getOriginalFilename());
			myRecipeFile.setMyRipFileStoredName(storedName);
			
			dao.insertMyRecipeFile(myRecipeFile);
			
		}else {
			dao.deleteMyRecipeFileByMyRipNo(myRecipe);
			if(file.getOriginalFilename().length()<1) {
				return;
			}
			String storedPath = context.getRealPath("upload");
			File upFolder = new File(context.getRealPath("upload"));
			upFolder.mkdir();
			//파일이 저장될 이름
			String storedName = null;
					
			//파일을 저장시킬 객체
			File dest = null;
			do {
				storedName = file.getOriginalFilename();
				storedName += UUID.randomUUID().toString().split("-")[3];
				dest = new File(upFolder,storedName);
			}while(dest.exists()); 
			
			try {
				// 업로드된 임시 파일을 upload폴더로 옮겨 실제 파일을 생성
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			myRecipe.setMyRipFileOriginName(file.getOriginalFilename());
			myRecipe.setMyRipFileStoredName(storedName);
			
			myRecipeFile.setMyRipNo(myRecipe.getMyRipNo());
			myRecipeFile.setMyRipFileOriginName(file.getOriginalFilename());
			myRecipeFile.setMyRipFileStoredName(storedName);
			
			dao.insertMyRecipeFile(myRecipeFile);
			
		}
	}
	@Override
	public List<Grind> getGrindList() {
		
		return dao.selectGrindAll();
	}
	@Override
	public List<Extraction> getExtractionList() {
		
		return dao.selectExtractionAll();
	}
	@Override
	public List<Bean> getBeanList() {
		
		return dao.selectBeanAll();
	}
	@Override
	public List<CupNote> getCupList(Bean bean) {
		return dao.selectCupNoteByBeanNo(bean);
	}
	
	@Override
	public void joinMyRecipeComment(MyRecipeComment myRecipeComment, HttpSession session) {
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		
		myRecipeComment.setUserNick(member.getUserNick());
		myRecipeComment.setUserNo(member.getUserNo());
		if(myRecipeComment.getMyRipCommNickTag()==null) {
			myRecipeComment.setMyRipCommNickTag("N");
		}
		 
		dao.insertMyRecipeComment(myRecipeComment);
		
	}
	
	@Override
	public List<MyRecipeComment> getMyRecipeCommentList(MyRecipe myRecipe) {
		return dao.selectMyRecipeCommentListByMyRipNo(myRecipe);
	}
	
	@Override
	public void dropMyRecipeComment(MyRecipeComment myRecipeComment) {
		dao.deleteMyRecipeComment(myRecipeComment);
		dao.deleteMyRecipeReply(myRecipeComment);
	}
	
	@Override
	public boolean myRecipeRecommendCheck(MyRecipe myRecipe, HttpSession session) {

		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		MyRecipeRecommend myRecipeRecommend = new MyRecipeRecommend();
		myRecipeRecommend.setMyRipNo(myRecipe.getMyRipNo());
		myRecipeRecommend.setUserNo(member.getUserNo());
		int res = dao.myRecipeRecCnt(myRecipeRecommend);
		
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean myRecipeRecommend(MyRecipe myRecipe, HttpSession session) {
		
		Member member = dao.selectMemberByUserID((String)session.getAttribute("userId"));
		MyRecipeRecommend myRecipeRecommend = new MyRecipeRecommend();
		myRecipeRecommend.setMyRipNo(myRecipe.getMyRipNo());
		myRecipeRecommend.setUserNo(member.getUserNo());
		int res = dao.myRecipeRecCnt(myRecipeRecommend);
		
		if(res>0) {
			dao.deleteMyRecipeRecommendByMyRipNoUserNo(myRecipeRecommend);
			return false;
		}else {
			dao.insertMyRecipeRecommendByMyRipNoUserNo(myRecipeRecommend);
			return true;
		}
	}
	
	@Override
	public int getMyRecipeRecommendCount(MyRecipe myRecipe) {
		return dao.selectMyRecipeRecommendCountByMyRipNo(myRecipe);
	}
	
	
	@Override
	public void dropMyRecipe(MyRecipe myRecipe) {
		MyRecipeFile myRecipeFile = dao.selectMyRecipeFileByMyRipNo(myRecipe);
		if(myRecipeFile != null) {
			String storedPath = context.getRealPath("upload");
			File delFile = new File(storedPath + "/"+myRecipeFile.getMyRipFileStoredName());
			if(delFile.exists()) {
				delFile.delete();
			}
		}
		List<MyRecipeComment> cList = dao.selectMyRecipeCommentListByMyRipNo(myRecipe);
		for(MyRecipeComment mrc : cList) {
			dao.deleteMyRecipeComment(mrc);
		}
		dao.deleteMyRecipeFileByMyRipNo(myRecipe);
		dao.deleteMyRecipeRecommendByMyRipNo(myRecipe);
		dao.deleteMyRecipByMyRipNo(myRecipe);
		
	}
	
	@Override
	public void changeMyRecipeComment(MyRecipeComment myRecipeComment) {
		dao.updateMyRecipeCommentByCommentNo(myRecipeComment);
	}
	
	
	
	//------------------------------------------------------------------------------
	//------------------------------------------------------------------------------
	//------------------------------------------------------------------------------
	//------------------------------------------------------------------------------
	//------------------------------------------------------------------------------
	//=================== 이루니 ===================
	@Override
	public List<CafeRev> getCafeReviewList(String category, String order, String search, Paging paging) {
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("category", category);
		param.put("order", order);
		param.put("search", search);
		param.put("paging", paging);
		
		List<CafeRev> list = dao.selectCafeReview(param);
		
		for(CafeRev c : list) {
			c.setCafeRevCommCount(dao.getCafeReviewCommentCnt(c));
		}
		
//		log.info("param : {}", param);
		
		return list;
	}
	
	@Override
	public List<CafeRevComm> getCafeReviewCommentList(CafeRev revNo) {
		
		return dao.selectCafeReviewCommentListByCafeReviewNo(revNo);
	}
	
	@Override
	public CafeRev getCafeReviewInfo(CafeRev revNo) {
		
		return dao.selectCafeReviewInfo(revNo);
	}
	
	@Override
	public String getCafeName(Cafe cafeNo) {
		
		return dao.selectCafeNameByCafeNo(cafeNo);
	}
	
	@Override
	public int getUserNo(String userId) {
		
		return dao.selectUsernoByUserid(userId);
	} 
	
	@Override
	public void joinCafeReview(CafeRev cafeRev) {
		
		int res = dao.insertCafeReview(cafeRev);
		
	}
	
	@Override
	public String getWriterId(CafeRev cafeRev) {

		return dao.selectWriterId(cafeRev);
	}
	
	@Override
	public void dropCafeReview(CafeRev cafeRev) {
		
		dao.deleteCafeReviewCommByCafeNo(cafeRev);
		dao.deleteCafeReviewByCafeNo(cafeRev);
		
	}
	
	@Override
	public void changeCafeReview(CafeRev cafeRev) {
		
		dao.updateCafeReviewByCafeNo(cafeRev);
	}
	
	@Override
	public Paging getCafeReviewPaging(Paging curPage, String category, String order, String search) {
		
		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		
		if(category == null || "".equals(category)||"all".equals(category)) {
			category = "N";
		}else if(category.equals("강남구")) {
			category="강남구";
		}else if(category.equals("서초구")) {
			category="서초구";
		}else if(category.equals("송파구")) {
			category="송파구";
		}else if(category.equals("종로구")) {
			category="종로구";
		}else if(category.equals("마포구")) {
			category="마포구";
		}else if(category.equals("서대문구")) {
			category="서대문구";
		}
		
		if(search == null || "".equals(search)) {
			search = "N";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("category", category);

		int totalCnt = dao.getCafeReviewTotalCnt(map);
		
//		log.info("totalCNT{}",totalCnt);
		
//		Paging paging = new Paging(curPage.getCurPage(),totalCnt);
	    Paging paging = new Paging(curPage.getCurPage(), totalCnt, curPage.getListCount(), curPage.getPageCount());

//		log.info("paging : {}", paging);
		
		return paging;
		
	}
	
	@Override
	public void writeCafeReviewComm(CafeRev revNo, CafeRevComm comm, String userId) {
		
		int userNo = dao.selectUsernoByUserid(userId);
		
		comm.setRevNo(revNo.getRevNo());
		comm.setUserNo(userNo);
		
		dao.insertCafeReviewComm(comm);
		
	}
	
	 @Override
	public String getBusinessNoFromMember(String userId) {
		 
		return dao.selectBusinessNoByUserId(userId);
	}
	 
	@Override
	public String getBusinessNoFromCafeReviewNo(CafeRev revNo) {
		
		return dao.selectBusinessNoByCafeRevNo(revNo);
	}
	
    @Override
    public String getwriterNick(String writerId) {
    	
    	return dao.selectUserNickByUserId(writerId);
    }
	
	//---------------event
	
	@Override
	public List<Event> selectByAll() {
		return dao.selectEventAllList();
	}
	
	@Override
	public void insertEvent(Event event) {
		dao.insertEventData(event);
		
	}
	
	@Override
	public Event eventInfoByeventNo(Event event) {
		return dao.selectByEventNo(event);
	}
	
	@Override
	public void eventDeleteByEventNo(Event event) {
		dao.deleteEventByEventNo(event);
	}
	
	@Override
	public void changeEvent(Event event) {
		dao.updateEventByEventNo(event);
	}
	
	
   // 현재 revNo를 기준으로 이전 revNo와 다음 revNo를 가져오는 메서드
    public Map<String, Integer> getPrevNextRevNos(CafeRev revNo) {
        List<Integer> revNos = dao.getCafeRevNos();  // revNo 리스트 가져오기
        Map<String, Integer> prevNextMap = new HashMap<>();
        
        int currentRevNo = revNo.getRevNo();
        int currentIndex = revNos.indexOf(currentRevNo);

        // 이전 revNo와 다음 revNo 계산
        if (currentIndex > 0) {
            prevNextMap.put("prevRevNo", revNos.get(currentIndex - 1));
        } else {
            prevNextMap.put("prevRevNo", null);  // 이전 게시글이 없을 경우 null
        }

        if (currentIndex < revNos.size() - 1) {
            prevNextMap.put("nextRevNo", revNos.get(currentIndex + 1));
        } else {
            prevNextMap.put("nextRevNo", null);  // 다음 게시글이 없을 경우 null
        }

        return prevNextMap;
    }
	
    @Override
    public void dropCafeReviewComment(CafeRevComm cafeRevCommNo) {
    	
    	dao.deleteCafeReviewCommByCafeRevCommNo(cafeRevCommNo);
    }
    
    @Override
    public void changeCafeReviewComment(CafeRevComm cafeRevComm) {
    	
    	dao.updateCafeReviewComm(cafeRevComm);
    }

	//----------------------------------------------------------------------------
    //    [ 원두 ]
    //----------------------------------------------------------------------------
    
    @Override
    public List<List<BeanRev>> getBeanReviewList(String category, String order, String search, Paging paging) {
    	
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("category", category);
		param.put("order", order);
		param.put("search", search);
		param.put("paging", paging);
		
		List<BeanRev> list = dao.selectBeanReview(param);
		List<BeanRev> brList = new ArrayList<BeanRev>();
		
		if(category != null && !"".equals(category)) {
			for(int i=0 ; i<list.size();i++) {
				brList.add(list.get(i));
			}
		}else {
			
			for(int i=0 ; i<list.size();i+=2) {
				brList.add(list.get(i));
			}
		}
		
		List<List<BeanRev>> bList = new ArrayList<List<BeanRev>>();
		
		for(BeanRev br : brList) {
			List<BeanRev> resList = dao.selectBeanRevByBeanRevNo(br);
			for(BeanRev b : resList) {
				
//			List<CupNote> categoryList = dao.dkddk(b.getRevNo());
				b.setBeanRevCommCount(dao.getBeanReviewCommentCnt(b));
			}
			
			bList.add(resList);
		}
		
		return bList;
		
    }
	
    @Override
    public Paging getBeanReviewPaging(Paging curPage, String category, String order, String search) {
    
		if(curPage.getCurPage()==0) {
			curPage.setCurPage(1);
		}
		
		if(category == null || "".equals(category)||"all".equals(category)) {
			category = "N";
		}else if(category.equals("새콤")) {
			category="새콤";
		}else if(category.equals("달콤")) {
			category="달콤";
		}else if(category.equals("쌉쌀")) {
			category="쌉쌀";
		}else if(category.equals("고소")) {
			category="고소";
		}else if(category.equals("은은한")) {
			category="은은한";
		}else if(category.equals("향긋한")) {
			category="향긋한";
		}else if(category.equals("진한")) {
			category="진한";
		}else if(category.equals("부드러운")) {
			category="부드러운";
		}
		
		if(search == null || "".equals(search)) {
			search = "N";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("category", category);

		int totalCnt = dao.getBeanReviewTotalCnt(map);
		
//		log.info("totalCNT{}",totalCnt);
		
//		Paging paging = new Paging(curPage.getCurPage(),totalCnt);
		
		if( !"N".equals(category) ) {
			Paging paging = new Paging(curPage.getCurPage(), totalCnt,10,10);
			return paging;
			
		}
			Paging paging = new Paging(curPage.getCurPage(), totalCnt,20,10);
			return paging;

//		log.info("paging : {}", paging);
    
    }
    
     @Override
    public List<BeanRevComm> getBeanReviewCommentList(BeanRev revNo) {
    	 
    	return dao.selectBeanReviewCommentList(revNo);
    }
    
    @Override
    public BeanRev getBeanReviewInfo(BeanRev revNo) {
    	
		return dao.selectBeanReviewInfo(revNo);
    }
    
    @Override
    public String getWriterId(BeanRev beanRev) {
    	
    	return dao.selectWriterIdByBeanRev(beanRev);
    }
    
    public Map<String, Integer> getPrevNextRevNos(BeanRev revNo) {
        List<Integer> revNos = dao.getBeanRevNos();  // revNo 리스트 가져오기
        Map<String, Integer> prevNextMap = new HashMap<>();
        
        int currentRevNo = revNo.getRevNo();
        int currentIndex = revNos.indexOf(currentRevNo);

        // 이전 revNo와 다음 revNo 계산
        if (currentIndex > 0) {
            prevNextMap.put("prevRevNo", revNos.get(currentIndex - 1));
        } else {
            prevNextMap.put("prevRevNo", null);  // 이전 게시글이 없을 경우 null
        }

        if (currentIndex < revNos.size() - 1) {
            prevNextMap.put("nextRevNo", revNos.get(currentIndex + 1));
        } else {
            prevNextMap.put("nextRevNo", null);  // 다음 게시글이 없을 경우 null
        }

        return prevNextMap;
    }
    
    @Override
    public String getBusinessNoFromBeanReviewNo(BeanRev revNo) {
    	
    	return dao.selectBusinessNoByBeanRevNo(revNo);
    }
    
    @Override
    public List<BeanRev> getBeanTasteList(BeanRev beanRev) {
    	
    	return dao.selectBeanTasteName(beanRev);
    	
    }
    
    @Override
    public String getBeanName(int beanNo) {
    	
    	return dao.selectBeanNameByBeanNo(beanNo);
    }
    
    @Override
    public void joinBeanReview(BeanRev beanRev) {
    	
    	dao.insertBeanReview(beanRev);
    }
    
    @Override
    public void dropBeanReview(BeanRev beanRev) {
    	
    	dao.deleteBeanReviewCommByBeanNo(beanRev);
		dao.deleteBeanReviewByBeanNo(beanRev);
    	
    }
    
    @Override
    public Integer getBeanNo(Integer subNo) {
    	
    	return dao.getBeanNoBySubNo(subNo);
    }
    
    @Override
    public void changeBeanReview(BeanRev beanRev) {
    	
    	dao.updateBeanReviewByBeanNo(beanRev);
    }
    
    @Override
    public void writeBeanReviewComm(BeanRev revNo, BeanRevComm commCont, String userId) {
    	
		int userNo = dao.selectUsernoByUserid(userId);
		
		commCont.setRevNo(revNo.getRevNo());
		commCont.setUserNo(userNo);
		
		dao.insertBeanReviewComm(commCont);
    	
    }
    
    @Override
    public void dropBeanReviewComment(BeanRevComm commNo) {
    	
    	dao.deleteBeanReviewCommByCommNo(commNo);
    }
    
    @Override
    public void changeBeanReviewComment(BeanRevComm beanRevComm) {
    	
		dao.updateBeanReviewCommByCommNo(beanRevComm);
    }
    
    
    
    
}



















