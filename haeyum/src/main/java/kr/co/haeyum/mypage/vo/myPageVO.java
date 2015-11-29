package kr.co.haeyum.mypage.vo;

public class myPageVO {

	private int start;
	private int end;
	private int reqPage;
	private int reqIndex;
	private int cCount = 10;
	private int tabSize = 5;
	private int curTab;
	private int lastPage;
	private String id;
	
	public int getLastPage() {
		return lastPage;
	}

	public int getReqIndex() {
		return reqIndex;
	}

	public void setReqIndex(int reqIndex) {
		this.reqIndex = reqIndex;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}


	public myPageVO(int reqPage, int lastPage) {
		this.reqPage = reqPage;
		this.lastPage  = lastPage;
		this.reqIndex = (reqPage-1)*10;
		setIndex();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getReqPage() {
		return reqPage;
	}

	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public int getTabSize() {
		return tabSize;
	}

	public void setTabSize(int tabSize) {
		this.tabSize = tabSize;
	}

	private void setIndex(){
		
		curTab = (reqPage - 1) / tabSize + 1;
		start = (curTab - 1) * tabSize + 1;
		end = (curTab * tabSize < lastPage) ? curTab * tabSize : lastPage;
	}
}
