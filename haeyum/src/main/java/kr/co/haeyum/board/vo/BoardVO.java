package kr.co.haeyum.board.vo;

public class BoardVO {

	private int bNo;
	private int lNo;
	private String bId;
	private String bTitle;
	private String bContent;
	private int bCount;// 조회수

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	private String bRegDate;

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbRegDate() {
		return bRegDate;
	}

	public void setbRegDate(String bRegDate) {
		this.bRegDate = bRegDate;
	}

}
