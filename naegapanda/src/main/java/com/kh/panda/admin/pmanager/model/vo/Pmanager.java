package com.kh.panda.admin.pmanager.model.vo;

public class Pmanager {

	private int pId;		// 상품 번호
	private String pName;	// 상품 이름
	private int sNo;		// 판매자 번호
	private String sName;	// 판매자 이름
	private int cId;		// 카테고리
	private String cName;
	private String cName2;
	private String pStatus;	// 상품 상태
	private int pViolate;	// 상품 신고 횟수
	
	public Pmanager() {
		
	}

	public Pmanager(int pId, String pName, int sNo, String sName, int cId, String cName, String cName2, String pStatus,
			int pViolate) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.sNo = sNo;
		this.sName = sName;
		this.cId = cId;
		this.cName = cName;
		this.cName2 = cName2;
		this.pStatus = pStatus;
		this.pViolate = pViolate;
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

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
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

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public int getpViolate() {
		return pViolate;
	}

	public void setpViolate(int pViolate) {
		this.pViolate = pViolate;
	}

	@Override
	public String toString() {
		return "Pmanager [pId=" + pId + ", pName=" + pName + ", sNo=" + sNo + ", sName=" + sName + ", cId=" + cId
				+ ", cName=" + cName + ", cName2=" + cName2 + ", pStatus=" + pStatus + ", pViolate=" + pViolate + "]";
	}

	

	
	
	
	
}
