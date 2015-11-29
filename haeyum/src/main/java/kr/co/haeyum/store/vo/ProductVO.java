package kr.co.haeyum.store.vo;

public class ProductVO {

	private int pNo;
	private int lNo;
	private int vNo;
	private String pId;
	private String pName;
	private String pContent;
	private int pPrice;
	private int pCount;
	private String pRegDate;
	
	//sell
	private String sellNo;
	private String sellId;
	
	//buy
	private int buyNo;
	private int buyCount;
	private String buyDate;
	
	
	
	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public String getSellId() {
		return sellId;
	}

	public void setSellId(String sellId) {
		this.sellId = sellId;
	}

	private String sellCount;

	
	public String getSellCount() {
		return sellCount;
	}

	public void setSellCount(String sellCount) {
		this.sellCount = sellCount;
	}

	public String getSellNo() {
		return sellNo;
	}

	public void setSellNo(String sellNo) {
		this.sellNo = sellNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public int getvNo() {
		return vNo;
	}

	public void setvNo(int vNo) {
		this.vNo = vNo;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public String getpRegDate() {
		return pRegDate;
	}

	public void setpRegDate(String pRegDate) {
		this.pRegDate = pRegDate;
	}

}
