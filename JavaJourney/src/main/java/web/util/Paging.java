package web.util;

public class Paging {

	//	현재 페이지 번호
	//	브라우저에서 사용자가 선택한 페이지 번호
	private int curPage;

	//	총 게시글 수
	//	DB의 게시글 테이블의 전체 행 수
	private int totalCount;
	
	//	한 페이지 당 보여질 게시글 수
	//	** 개발자가 직접 설정할 수 있도록 함
	private int listCount;

	//	총 페이지 수
	//	** 계산으로 알아냄
	private int totalPage;
	
	//	한 화면에 출력될 페이지네이션의 개수
	//	** 개발자가 직접 설정할 수 있도록 함
	private int pageCount;

	//	한 화면에 출력될 페이지네이션의 시작 번호
	//	** 개발자가 직접 설정할 수 있도록 함
	private int startPage;

	//	한 화면에 출력될 페이지네이션의 끝 번호
	//	** 개발자가 직접 설정할 수 있도록 함
	private int endPage;

	//	화면에 보이는 게시글의 시작번호
	//	** 계산으로 알아냄
	private int startNo;

	//	화면에 보이는 게시글의 끝 번호
	//	** 계산으로 알아냄
	private int endNo;
	
	public Paging() {}

	public Paging(int curPage, int totalCount) {
		super();
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.makePaging();
	}

	public Paging(int curPage, int totalCount, int listCount, int pageCount) {
		super();
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.makePaging();
	}
	
	public Paging(int curPage, int totalCount, int listCount, int totalPage, int startPage, int endPage, int pageCount) {
		super();
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.listCount = listCount;
		this.totalPage = totalPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.pageCount = pageCount;
	}

	@Override
	public String toString() {
		return "Paging [curPage=" + curPage + ", totalCount=" + totalCount + ", listCount=" + listCount + ", totalPage="
				+ totalPage + ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	//페이징에 필요한 계산 처리
	private void makePaging() {
		if(totalCount == 0) {
			return;
		}
		
		// 첫 페이지를 기본으로
		if(curPage <= 0) {
			setCurPage(1);
		}
		// 화면에 보여질 글 수 기본값 10개
		if(listCount == 0) {
			setListCount(10);
		}
		// 화면에 보여질 페이지 목록 수 기본값 10개
		if(pageCount == 0) {
			setPageCount(10);
		}
		//-------------------------------------------------
		
		// 총 페이지 수 계산
		if(totalCount%listCount == 0) {
			totalPage = totalCount/listCount;
		}else {
			totalPage = (totalCount/listCount)+1;
		}
		
		// 총 페이지 수 보정
		if(curPage>totalPage) {
			curPage = totalPage;
		}
		//-------------------------------------------------
		
		// 화면에 보이는 페이지네이션의 시작, 끝 번호 계산
		startPage = ((curPage-1)/pageCount)*pageCount + 1; 
		endPage = startPage + pageCount-1;
		
		// 페이지네이션 번호 보정
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		//-------------------------------------------------

		// 화면에 보이는 게시글의 시작, 끝번호 계산
		startNo = (curPage-1)*listCount+1; 
//		endNo = curPage * listCount;
		endNo = Math.min(curPage * listCount, totalCount);
		
		
		
		
		
	}
	
	
	
}






























