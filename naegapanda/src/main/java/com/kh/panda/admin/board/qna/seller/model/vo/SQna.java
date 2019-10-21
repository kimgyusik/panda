package com.kh.panda.admin.board.qna.seller.model.vo;

import java.sql.Date;

public class SQna {
	
	private int sqId;
	private String sqCategory;
	private String sqTitle;
	private String sqContent;
	private int sNo;
	private int sqCount;
	private Date sqCreateDate;
	private Date sqModifyDate;
	private String sqStatus;
	private String sNmae;
	
	public SQna() {
		
	}

	public SQna(int sqId, String sqCategory, String sqTitle, String sqContent, int sNo, int sqCount, Date sqCreateDate,
			Date sqModifyDate, String sqStatus, String sNmae) {
		super();
		this.sqId = sqId;
		this.sqCategory = sqCategory;
		this.sqTitle = sqTitle;
		this.sqContent = sqContent;
		this.sNo = sNo;
		this.sqCount = sqCount;
		this.sqCreateDate = sqCreateDate;
		this.sqModifyDate = sqModifyDate;
		this.sqStatus = sqStatus;
		this.sNmae = sNmae;
	}

	public int getSqId() {
		return sqId;
	}

	public void setSqId(int sqId) {
		this.sqId = sqId;
	}

	public String getSqCategory() {
		return sqCategory;
	}

	public void setSqCategory(String sqCategory) {
		this.sqCategory = sqCategory;
	}

	public String getSqTitle() {
		return sqTitle;
	}

	public void setSqTitle(String sqTitle) {
		this.sqTitle = sqTitle;
	}

	public String getSqContent() {
		return sqContent;
	}

	public void setSqContent(String sqContent) {
		this.sqContent = sqContent;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getSqCount() {
		return sqCount;
	}

	public void setSqCount(int sqCount) {
		this.sqCount = sqCount;
	}

	public Date getSqCreateDate() {
		return sqCreateDate;
	}

	public void setSqCreateDate(Date sqCreateDate) {
		this.sqCreateDate = sqCreateDate;
	}

	public Date getSqModifyDate() {
		return sqModifyDate;
	}

	public void setSqModifyDate(Date sqModifyDate) {
		this.sqModifyDate = sqModifyDate;
	}

	public String getSqStatus() {
		return sqStatus;
	}

	public void setSqStatus(String sqStatus) {
		this.sqStatus = sqStatus;
	}

	public String getsNmae() {
		return sNmae;
	}

	public void setsNmae(String sNmae) {
		this.sNmae = sNmae;
	}

	@Override
	public String toString() {
		return "SQna [sqId=" + sqId + ", sqCategory=" + sqCategory + ", sqTitle=" + sqTitle + ", sqContent=" + sqContent
				+ ", sNo=" + sNo + ", sqCount=" + sqCount + ", sqCreateDate=" + sqCreateDate + ", sqModifyDate="
				+ sqModifyDate + ", sqStatus=" + sqStatus + ", sNmae=" + sNmae + "]";
	}
	
	

}
