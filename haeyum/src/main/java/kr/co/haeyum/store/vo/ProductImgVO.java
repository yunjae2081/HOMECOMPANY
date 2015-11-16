package kr.co.haeyum.store.vo;

public class ProductImgVO {

	int iNo;
	int pNo;
	String orgFileName;
	String RealFileName;
	String FilePath;
	
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getRealFileName() {
		return RealFileName;
	}
	public void setRealFileName(String realFileName) {
		RealFileName = realFileName;
	}
	public String getFilePath() {
		return FilePath;
	}
	public void setFilePath(String filePath) {
		FilePath = filePath;
	}
	
}
