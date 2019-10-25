package com.kh.panda.myShopping.basket.model.vo;

public class Basket {
	
	private int pId;
	private int oNo;
	private int mNo;
	private int amount;
	private int oAmount;
	private String pName;
	private String oName;
	private int price;
	private String category2;
	private String category;
	private String storeName;
	private String paChangeName;
	
	public Basket() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Basket(int pId, int oNo, int mNo, int amount, int oAmount, String pName, String oName, int price,
			String category2, String category, String storeName, String paChangeName) {
		super();
		this.pId = pId;
		this.oNo = oNo;
		this.mNo = mNo;
		this.amount = amount;
		this.oAmount = oAmount;
		this.pName = pName;
		this.oName = oName;
		this.price = price;
		this.category2 = category2;
		this.category = category;
		this.storeName = storeName;
		this.paChangeName = paChangeName;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getoAmount() {
		return oAmount;
	}

	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getPaChangeName() {
		return paChangeName;
	}

	public void setPaChangeName(String paChangeName) {
		this.paChangeName = paChangeName;
	}

	@Override
	public String toString() {
		return "Basket [pId=" + pId + ", oNo=" + oNo + ", mNo=" + mNo + ", amount=" + amount + ", oAmount=" + oAmount
				+ ", pName=" + pName + ", oName=" + oName + ", price=" + price + ", category2=" + category2
				+ ", category=" + category + ", storeName=" + storeName + ", paChangeName=" + paChangeName + "]";
	}

	

	
	
	

}
