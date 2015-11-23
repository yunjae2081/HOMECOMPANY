package kr.co.haeyum.search.vo;

public class VideoBestListVO {
	private int listNo; // 인기순 번호
	private int bestNo; // 강좌 번호
	private String title; // 강좌 제목
	private String content; // 강좌 내용
	private String fileName; // 강좌 사진
	
	public int getListNo() {
		return listNo;
	}
	public void setListNo(int listNo) {
		this.listNo = listNo;
	}
	public int getBestNo() {
		return bestNo;
	}
	public void setBestNo(int bestNo) {
		this.bestNo = bestNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}	
}
