package kr.co.haeyum.mypage.common;

public class SearchVO {
	
	private String id;
	
	private int start; // 가져올 시작번호
	private int end; // 가져올 끝 번호
	
	
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
	

}
