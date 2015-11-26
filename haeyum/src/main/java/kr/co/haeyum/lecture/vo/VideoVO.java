package kr.co.haeyum.lecture.vo;

public class VideoVO {
	private int vNo;
	private int sNo;
	private String sName;
	private String orgFileName;
	private String realFileName;
	private String iOrgFileName;
	private String iRealFileName;
	private String vRegDate;
	
	public String getsName() {
		return sName;
	}
	
	public void setsName(String sName) {
		this.sName = sName;
	}

	public int getvNo() {
		return vNo;
	}

	public void setvNo(int vNo) {
		this.vNo = vNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getRealFileName() {
		return realFileName;
	}

	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}

	public String getiOrgFileName() {
		return iOrgFileName;
	}

	public void setiOrgFileName(String iOrgFileName) {
		this.iOrgFileName = iOrgFileName;
	}

	public String getiRealFileName() {
		return iRealFileName;
	}

	public void setiRealFileName(String iRealFileName) {
		this.iRealFileName = iRealFileName;
	}

	public String getvRegDate() {
		return vRegDate;
	}

	public void setvRegDate(String vRegDate) {
		this.vRegDate = vRegDate;
	}

}
