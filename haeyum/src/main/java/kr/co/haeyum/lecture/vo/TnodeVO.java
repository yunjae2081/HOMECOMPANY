package kr.co.haeyum.lecture.vo;

public class TnodeVO {

	private int tNo;
	private int sNo;
	private int lNo;
	private int tX;
	private int tY;
	private String sName;
	private String tName;

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public int gettX() {
		return tX;
	}

	public void settX(int tX) {
		this.tX = tX;
	}

	public int gettY() {
		return tY;
	}

	public void settY(int tY) {
		this.tY = tY;
	}

}
