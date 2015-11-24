package kr.co.haeyum.search.vo;

public class VideoLatestListVO {
	private int latestNo; // 최신순 번호
	private String title; // 강좌 제목
	private String content; // 강좌 내용
	private String fileName; // 강좌 사진
	
	public int getLatestNo() {
		return latestNo;
	}
	public void setLatestNo(int latestNo) {
		this.latestNo = latestNo;
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
