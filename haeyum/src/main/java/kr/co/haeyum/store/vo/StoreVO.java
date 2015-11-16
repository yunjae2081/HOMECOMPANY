package kr.co.haeyum.store.vo;

public class StoreVO {
	
	//제품번호
	private int pNo;
	
	//Buy
	private int buyNo;
	private String buyId;
	private int buyCount;
	private String buyDate;
	
	//Sell
	private int sellNo;
	private String sellId;
	private int sellCount;
	private String sellDate;
	
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public String getBuyId() {
		return buyId;
	}
	public void setBuyId(String buyId) {
		this.buyId = buyId;
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
	public int getSellNo() {
		return sellNo;
	}
	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}
	public String getSellId() {
		return sellId;
	}
	public void setSellId(String sellId) {
		this.sellId = sellId;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	public String getSellDate() {
		return sellDate;
	}
	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}

	
	
}
