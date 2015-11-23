package kr.co.haeyum.mypage.common;

public class PageVO {

	// 현재 페이지 번호
	private int pageNo;
	// 전체 게시물 갯수
	private int count;
	// 한페이지에 보여질 목록 수
	private int listSize = Constants.PAGE_LIST_COUNT;
	// 마지막 페이지 구하기
	private int lastPage;
	// 한 탭에 들어가는 페이지 사이즈
	private int tabSize = Constants.PAGE_TAB_COUNT;
	// 현재 페이지에 해당하는 탭 위치
	private int currTab;
	// 페이지 블럭의 시작페이지 번호
	private int beginPage;
	// 페이지 블럭의 마지막 페이지 번호
	private int endPage;
	// 호출할 페이지 URI
	private String uri;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getTabSize() {
		return tabSize;
	}

	public void setTabSize(int tabSize) {
		this.tabSize = tabSize;
	}

	public int getCurrTab() {
		return currTab;
	}

	public void setCurrTab(int currTab) {
		this.currTab = currTab;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public PageVO(String uri, int count, int pageNo) {
		this.uri = uri;
		this.count = count;
		this.pageNo = pageNo;

		setup();
	}

	public void setup() {

		lastPage = (count % listSize == 0) ? count / listSize : count / listSize + 1;
		currTab = (pageNo - 1) / tabSize + 1;
		beginPage = (currTab - 1) * tabSize + 1;
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;

	}

}
