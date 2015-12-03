package kr.co.haeyum.board.vo;

public class PageIndexVO {
	
	private int reqPage;
	private int lastPage;
	private int start;
	private int end;
	private int listSize = 5;
	private int tabSize = 3;
	private int currTab;
	private int count;
	
	public int getLastPage() {
		return lastPage;
	}


	public int getReqPage() {
		return reqPage;
	}


	public int getStart() {
		return start;
	}


	public int getEnd() {
		return end;
	}


	public PageIndexVO(int reqPage, int count) {
		this.reqPage = reqPage;
		this.count = count;
		
		setIndex();
	}


	private void setIndex() {
		lastPage = (count % listSize == 0) ? count / listSize : count / listSize + 1;
		currTab = (reqPage - 1) / tabSize + 1;
		start = (currTab - 1) * tabSize + 1;
		end = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
	}
}
