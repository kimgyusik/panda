package com.kh.panda.admin.sviolate.model.vo;

import java.sql.Date;

public class Sviolate {

	private int sNo;				// 판매자 번호
	private String sName;			// 판매자 이름
	private String storeName;		// 스토어 이름
	private int pId;				// 상품 번호
	private String pName;			// 상품 이름
	private int sViolate;			// 판매자 신고 횟수
	private int pViolate;			// 상품 신고 횟수
	private Date vDate;				// 신고 날짜
	private String sStatus;			// 판매자 상태
	private String pStatus;			// 상품 상태
	private int vNo;				// 신고번호
	private String vTitle;			// 신고제목
	private String vStatus;			// 신고상태

	public Sviolate() {}

	public Sviolate(int sNo, String sName, String storeName, int pId, String pName, int sViolate, int pViolate,
			Date vDate, String sStatus, String pStatus, int vNo, String vTitle, String vStatus) {
		super();
		this.sNo = sNo;
		this.sName = sName;
		this.storeName = storeName;
		this.pId = pId;
		this.pName = pName;
		this.sViolate = sViolate;
		this.pViolate = pViolate;
		this.vDate = vDate;
		this.sStatus = sStatus;
		this.pStatus = pStatus;
		this.vNo = vNo;
		this.vTitle = vTitle;
		this.vStatus = vStatus;
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

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
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

	public int getsViolate() {
		return sViolate;
	}

	public void setsViolate(int sViolate) {
		this.sViolate = sViolate;
	}

	public int getpViolate() {
		return pViolate;
	}

	public void setpViolate(int pViolate) {
		this.pViolate = pViolate;
	}

	public Date getvDate() {
		return vDate;
	}

	public void setvDate(Date vDate) {
		this.vDate = vDate;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public int getvNo() {
		return vNo;
	}

	public void setvNo(int vNo) {
		this.vNo = vNo;
	}

	public String getvTitle() {
		return vTitle;
	}

	public void setvTitle(String vTitle) {
		this.vTitle = vTitle;
	}

	public String getvStatus() {
		return vStatus;
	}

	public void setvStatus(String vStatus) {
		this.vStatus = vStatus;
	}

	@Override
	public String toString() {
		return "Sviolate [sNo=" + sNo + ", sName=" + sName + ", storeName=" + storeName + ", pId=" + pId + ", pName="
				+ pName + ", sViolate=" + sViolate + ", pViolate=" + pViolate + ", vDate=" + vDate + ", sStatus="
				+ sStatus + ", pStatus=" + pStatus + ", vNo=" + vNo + ", vTitle=" + vTitle + ", vStatus=" + vStatus
				+ "]";
	}

	

	
	
}
