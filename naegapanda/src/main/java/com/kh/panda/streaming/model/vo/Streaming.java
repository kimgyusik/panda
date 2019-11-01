package com.kh.panda.streaming.model.vo;

import java.sql.Date;

public class Streaming {
	private int stNo;
	private int sNo;
	private Date stTime;
	private String stTitle;
	private String stStatus;
	
	public Streaming() {}
	
	public Streaming(int stNo, int sNo, Date stTime, String stTitle, String stStatus) {
		super();
		this.stNo = stNo;
		this.sNo = sNo;
		this.stTime = stTime;
		this.stTitle = stTitle;
		this.stStatus = stStatus;
	}

	public int getStNo() {
		return stNo;
	}

	public void setStNo(int stNo) {
		this.stNo = stNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public Date getStTime() {
		return stTime;
	}

	public void setStTime(Date stTime) {
		this.stTime = stTime;
	}

	public String getStTitle() {
		return stTitle;
	}

	public void setStTitle(String stTitle) {
		this.stTitle = stTitle;
	}

	public String getStStatus() {
		return stStatus;
	}

	public void setStStatus(String stStatus) {
		this.stStatus = stStatus;
	}

	@Override
	public String toString() {
		return "Streaming [stNo=" + stNo + ", sNo=" + sNo + ", stTime=" + stTime + ", stTitle=" + stTitle
				+ ", stStatus=" + stStatus + "]";
	}
	
}
