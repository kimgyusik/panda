package com.kh.panda.admin.violate.model.vo;

public class SearchCondition {

	private String sName;
	private String storeName;
	private String sStatus;
	
	public SearchCondition() {}

	public SearchCondition(String sName, String storeName, String sStatus) {
		super();
		this.sName = sName;
		this.storeName = storeName;
		this.sStatus = sStatus;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	@Override
	public String toString() {
		return "SearchCondition [sName=" + sName + ", storeName=" + storeName + ", sStatus=" + sStatus + "]";
	}

	
	
}
