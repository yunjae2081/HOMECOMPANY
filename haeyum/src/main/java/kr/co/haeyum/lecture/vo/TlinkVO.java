package kr.co.haeyum.lecture.vo;

public class TlinkVO {

	private int lkNo;
	private int tNo;
	private int lNo;
	private String lUrl;
	private String linkTitle;
	private String linkContent;
	private String tName;

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public int getLkNo() {
		return lkNo;
	}

	public void setLkNo(int lkNo) {
		this.lkNo = lkNo;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public String getlUrl() {
		return lUrl;
	}

	public void setlUrl(String lUrl) {
		this.lUrl = lUrl;
	}

	public String getLinkTitle() {
		return linkTitle;
	}

	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}

	public String getLinkContent() {
		return linkContent;
	}

	public void setLinkContent(String linkContent) {
		this.linkContent = linkContent;
	}

}
