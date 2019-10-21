package com.kh.panda.admin.board.qna.user.model.vo;

import java.sql.Date;

public class Qna {

	private int uqId;
	private String uqCategory;
	private String uqTitle;
	private String uqContent;
	private int mNo;
	private int uqCount;
	private Date uqCreateDate;
	private Date uqModifyDate;
	private String uqStatus;
	private String mName;
	
	
	public Qna() {
		
	}


	public Qna(int uqId, String uqCategory, String uqTitle, String uqContent, int mNo, int uqCount, Date uqCreateDate,
			Date uqModifyDate, String uqStatus, String mName) {
		super();
		this.uqId = uqId;
		this.uqCategory = uqCategory;
		this.uqTitle = uqTitle;
		this.uqContent = uqContent;
		this.mNo = mNo;
		this.uqCount = uqCount;
		this.uqCreateDate = uqCreateDate;
		this.uqModifyDate = uqModifyDate;
		this.uqStatus = uqStatus;
		this.mName = mName;
	}
	
	


	public Qna(int uqId, String uqCategory, String uqTitle, String uqContent, int mNo, int uqCount, Date uqCreateDate,
			Date uqModifyDate, String uqStatus) {
		super();
		this.uqId = uqId;
		this.uqCategory = uqCategory;
		this.uqTitle = uqTitle;
		this.uqContent = uqContent;
		this.mNo = mNo;
		this.uqCount = uqCount;
		this.uqCreateDate = uqCreateDate;
		this.uqModifyDate = uqModifyDate;
		this.uqStatus = uqStatus;
	}


	public int getUqId() {
		return uqId;
	}


	public void setUqId(int uqId) {
		this.uqId = uqId;
	}


	public String getUqCategory() {
		return uqCategory;
	}


	public void setUqCategory(String uqCategory) {
		this.uqCategory = uqCategory;
	}


	public String getUqTitle() {
		return uqTitle;
	}


	public void setUqTitle(String uqTitle) {
		this.uqTitle = uqTitle;
	}


	public String getUqContent() {
		return uqContent;
	}


	public void setUqContent(String uqContent) {
		this.uqContent = uqContent;
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public int getUqCount() {
		return uqCount;
	}


	public void setUqCount(int uqCount) {
		this.uqCount = uqCount;
	}


	public Date getUqCreateDate() {
		return uqCreateDate;
	}


	public void setUqCreateDate(Date uqCreateDate) {
		this.uqCreateDate = uqCreateDate;
	}


	public Date getUqModifyDate() {
		return uqModifyDate;
	}


	public void setUqModifyDate(Date uqModifyDate) {
		this.uqModifyDate = uqModifyDate;
	}


	public String getUqStatus() {
		return uqStatus;
	}


	public void setUqStatus(String uqStatus) {
		this.uqStatus = uqStatus;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	@Override
	public String toString() {
		return "Qna [uqId=" + uqId + ", uqCategory=" + uqCategory + ", uqTitle=" + uqTitle + ", uqContent=" + uqContent
				+ ", mNo=" + mNo + ", uqCount=" + uqCount + ", uqCreateDate=" + uqCreateDate + ", uqModifyDate="
				+ uqModifyDate + ", uqStatus=" + uqStatus + ", mName=" + mName + "]";
	}
	
	


	


	
	
	
	
	
	
}
