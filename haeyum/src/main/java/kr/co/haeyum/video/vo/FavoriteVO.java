package kr.co.haeyum.video.vo;

public class FavoriteVO {

	private int FavNo;
	private int lNo;
	private String favId;

	private String lTitle;
	private String lContent;
	private String lCategory;
	private String lRealFileName;

	public String getlRealFileName() {
		return lRealFileName;
	}

	public void setlRealFileName(String lRealFileName) {
		this.lRealFileName = lRealFileName;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public String getlTitle() {
		return lTitle;
	}

	public void setlTitle(String lTitle) {
		this.lTitle = lTitle;
	}

	public String getlContent() {
		return lContent;
	}

	public void setlContent(String lContent) {
		this.lContent = lContent;
	}

	public String getlCategory() {
		return lCategory;
	}

	public void setlCategory(String lCategory) {
		this.lCategory = lCategory;
	}

	public int getFavNo() {
		return FavNo;
	}

	public void setFavNo(int favNo) {
		FavNo = favNo;
	}

	public String getFavId() {
		return favId;
	}

	public void setFavId(String favId) {
		this.favId = favId;
	}

}
