package com.kh.panda.myShopping.ggim.model.vo;

import java.sql.Date;

public class Ggim {
	
	private int pId;
	private int mNo;
	private String pName;
	private int price;
	private String category2;
	private String storeName;
	private Date addDate;
	
	public Ggim() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Ggim(int pId, int mNo, String pName, int price, String category2, String storeName, Date addDate) {
		super();
		this.pId = pId;
		this.mNo = mNo;
		this.pName = pName;
		this.price = price;
		this.category2 = category2;
		this.storeName = storeName;
		this.addDate = addDate;
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

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "Ggim [pId=" + pId + ", mNo=" + mNo + ", pName=" + pName + ", price=" + price + ", category2="
				+ category2 + ", storeName=" + storeName + ", addDate=" + addDate + "]";
	}
	
	
}
