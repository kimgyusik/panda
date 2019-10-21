package com.kh.panda.product.model.vo;

public class Product {
	private int pId;
	private String pName;
	private int pPrice;
	private int sNo;
	private int pAmount;
	private String pContent;
	private int pPurchase;
	private int cId;
	private int pCount;
	private String pOk;
	private String pStatus;
	
	public Product() {}
	
	public Product(int pId, String pName, int pPrice, int sNo, int pAmount, String pContent, int pPurchase, int cId,
			int pCount, String pOk, String pStatus) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.sNo = sNo;
		this.pAmount = pAmount;
		this.pContent = pContent;
		this.pPurchase = pPurchase;
		this.cId = cId;
		this.pCount = pCount;
		this.pOk = pOk;
		this.pStatus = pStatus;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getpAmount() {
		return pAmount;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public int getpPurchase() {
		return pPurchase;
	}

	public void setpPurchase(int pPurchase) {
		this.pPurchase = pPurchase;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public String getpOk() {
		return pOk;
	}

	public void setpOk(String pOk) {
		this.pOk = pOk;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pPrice=" + pPrice + ", sNo=" + sNo + ", pAmount="
				+ pAmount + ", pContent=" + pContent + ", pPurchase=" + pPurchase + ", cId=" + cId + ", pCount="
				+ pCount + ", pOk=" + pOk + ", pStatus=" + pStatus + "]";
	}
	
}
