package com.kh.panda.myShopping.review.model.vo;

import java.util.Date;

public class Reply {
	
	private int rrId;
	private int mNo;
	private String mId;
	private String rrContents;
	private Date rrDate;
	private String rrDel;
	private int rId;
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reply(int rrId, int mNo, String mId, String rrContents, Date rrDate, String rrDel, int rId) {
		super();
		this.rrId = rrId;
		this.mNo = mNo;
		this.mId = mId;
		this.rrContents = rrContents;
		this.rrDate = rrDate;
		this.rrDel = rrDel;
		this.rId = rId;
	}

	public int getRrId() {
		return rrId;
	}

	public void setRrId(int rrId) {
		this.rrId = rrId;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getRrContents() {
		return rrContents;
	}

	public void setRrContents(String rrContents) {
		this.rrContents = rrContents;
	}

	public Date getRrDate() {
		return rrDate;
	}

	public void setRrDate(Date rrDate) {
		this.rrDate = rrDate;
	}

	public String getRrDel() {
		return rrDel;
	}

	public void setRrDel(String rrDel) {
		this.rrDel = rrDel;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	@Override
	public String toString() {
		return "Reply [rrId=" + rrId + ", mNo=" + mNo + ", mId=" + mId + ", rrContents=" + rrContents + ", rrDate="
				+ rrDate + ", rrDel=" + rrDel + ", rId=" + rId + "]";
	}
	
	

}
