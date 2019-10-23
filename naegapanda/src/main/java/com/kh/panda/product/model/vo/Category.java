package com.kh.panda.product.model.vo;

public class Category {
	
	private int cId;
	private String cName;
	private String cName2;
	
	public Category() {}

	public Category(int cId, String cName, String cName2) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cName2 = cName2;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcName2() {
		return cName2;
	}

	public void setcName2(String cName2) {
		this.cName2 = cName2;
	}

	@Override
	public String toString() {
		return "Category [cId=" + cId + ", cName=" + cName + ", cName2=" + cName2 + "]";
	}
	
}
