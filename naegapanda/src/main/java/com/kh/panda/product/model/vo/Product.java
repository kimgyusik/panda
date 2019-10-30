package com.kh.panda.product.model.vo;

import java.sql.Date;

public class Product {
	private int pId;
	private String pName;
	private int sNo;
	private String pContent;
	private int cId;
	private int pCount;
	private String pOk;
	private String pStatus;
	private Date pCreateDate;
	private int pPrice;
	private String paChangeName;
	private String filePath;
	private String cName2;
	private int pPurchase;
	
	public Product() {}

	public Product(int pId, String pName, int sNo, String pContent, int cId, int pCount, String pOk, String pStatus,
			Date pCreateDate) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.sNo = sNo;
		this.pContent = pContent;
		this.cId = cId;
		this.pCount = pCount;
		this.pOk = pOk;
		this.pStatus = pStatus;
		this.pCreateDate = pCreateDate;
	}

	public Product(int pId, String pName, int sNo, String pContent, int cId, int pCount, String pOk, String pStatus,
			Date pCreateDate, int pPrice, String paChangeName, String filePath) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.sNo = sNo;
		this.pContent = pContent;
		this.cId = cId;
		this.pCount = pCount;
		this.pOk = pOk;
		this.pStatus = pStatus;
		this.pCreateDate = pCreateDate;
		this.pPrice = pPrice;
		this.paChangeName = paChangeName;
		this.filePath = filePath;
	}
	

	public Product(int pId, String pName, int sNo, String pContent, int cId, int pCount, String pOk, String pStatus,
			Date pCreateDate, int pPrice, String paChangeName, String filePath, String cName2) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.sNo = sNo;
		this.pContent = pContent;
		this.cId = cId;
		this.pCount = pCount;
		this.pOk = pOk;
		this.pStatus = pStatus;
		this.pCreateDate = pCreateDate;
		this.pPrice = pPrice;
		this.paChangeName = paChangeName;
		this.filePath = filePath;
		this.cName2 = cName2;
	}
	

	public Product(int pId, String pName, int sNo, String pContent, int cId, int pCount, String pOk, String pStatus,
			Date pCreateDate, int pPrice, String paChangeName, String filePath, String cName2, int pPurchase) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.sNo = sNo;
		this.pContent = pContent;
		this.cId = cId;
		this.pCount = pCount;
		this.pOk = pOk;
		this.pStatus = pStatus;
		this.pCreateDate = pCreateDate;
		this.pPrice = pPrice;
		this.paChangeName = paChangeName;
		this.filePath = filePath;
		this.cName2 = cName2;
		this.pPurchase = pPurchase;
	}

	public int getpPurchase() {
		return pPurchase;
	}

	public void setpPurchase(int pPurchase) {
		this.pPurchase = pPurchase;
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

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
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

	public Date getpCreateDate() {
		return pCreateDate;
	}

	public void setpCreateDate(Date pCreateDate) {
		this.pCreateDate = pCreateDate;
	}
	
	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getPaChangeName() {
		return paChangeName;
	}

	public void setPaChangeName(String paChangeName) {
		this.paChangeName = paChangeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getcName2() {
		return cName2;
	}

	public void setcName2(String cName2) {
		this.cName2 = cName2;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", sNo=" + sNo + ", pContent=" + pContent + ", cId=" + cId
				+ ", pCount=" + pCount + ", pOk=" + pOk + ", pStatus=" + pStatus + ", pCreateDate=" + pCreateDate
				+ ", pPrice=" + pPrice + ", paChangeName=" + paChangeName + ", filePath=" + filePath + ", cName2="
				+ cName2 + ", pPurchase=" + pPurchase + "]";
	}

}
