package kr.co.haeyum.video.vo;

public class WatchVO {

private int wNo;
private int vNo;
private String wId;
private String wStartDate;

private String lNo;
private String lTitle;
private String lCategory;
private String lContent;
private String lRegDate;


public String getlRegDate() {
	return lRegDate;
}
public void setlRegDate(String lRegDate) {
	this.lRegDate = lRegDate;
}
public String getlContent() {
	return lContent;
}
public void setlContent(String lContent) {
	this.lContent = lContent;
}
public String getlNo() {
	return lNo;
}
public void setlNo(String lNo) {
	this.lNo = lNo;
}
public String getlTitle() {
	return lTitle;
}
public void setlTitle(String lTitle) {
	this.lTitle = lTitle;
}
public String getlCategory() {
	return lCategory;
}
public void setlCategory(String lCategory) {
	this.lCategory = lCategory;
}
public int getwNo() {
	return wNo;
}
public void setwNo(int wNo) {
	this.wNo = wNo;
}
public int getvNo() {
	return vNo;
}
public void setvNo(int vNo) {
	this.vNo = vNo;
}
public String getwId() {
	return wId;
}
public void setwId(String wId) {
	this.wId = wId;
}
public String getwStartDate() {
	return wStartDate;
}
public void setwStartDate(String wStartDate) {
	this.wStartDate = wStartDate;
}

}
