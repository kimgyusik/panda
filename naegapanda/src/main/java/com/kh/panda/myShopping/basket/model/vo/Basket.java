package com.kh.panda.myShopping.basket.model.vo;

public class Basket {
	
	private int pId;
	private int mNo;
	private int amount;
	private String pName;
	private int price;
	private String category2;
	private String storeName;
	
	public Basket() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Basket(int pId, int mNo, int amount, String pName, int price, String category2, String storeName) {
		super();
		this.pId = pId;
		this.mNo = mNo;
		this.amount = amount;
		this.pName = pName;
		this.price = price;
		this.category2 = category2;
		this.storeName = storeName;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
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

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
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

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	@Override
	public String toString() {
		return "Basket [pId=" + pId + ", mNo=" + mNo + ", amount=" + amount + ", pName=" + pName + ", price=" + price
				+ ", category2=" + category2 + ", storeName=" + storeName + "]";
	}
	
	

}
