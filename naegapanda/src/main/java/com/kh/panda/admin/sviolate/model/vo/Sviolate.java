package com.kh.panda.admin.sviolate.model.vo;

import java.sql.Date;

public class Sviolate {

	private int sNo;				// 판매자 번호
	private String sName;			// 판매자 이름
	private String storeName;		// 스토어 이름
	private int sViolate;			// 신고 횟수
	private Date vDate;				// 신고 날짜
	private String sStatus;			// 상태

	public Sviolate() {}

	public Sviolate(int sNo, String sName, String storeName, int sViolate, Date vDate, String sStatus) {
		super();
		this.sNo = sNo;
		this.sName = sName;
		this.storeName = storeName;
		this.sViolate = sViolate;
		this.vDate = vDate;
		this.sStatus = sStatus;
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

	public int getsViolate() {
		return sViolate;
	}

	public void setsViolate(int sViolate) {
		this.sViolate = sViolate;
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

	@Override
	public String toString() {
		return "Sviolate [sNo=" + sNo + ", sName=" + sName + ", storeName=" + storeName + ", sViolate=" + sViolate
				+ ", vDate=" + vDate + ", sStatus=" + sStatus + "]";
	}
	
	
	
}
