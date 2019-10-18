package com.kh.panda.admin.board.qna.model.vo;

import java.sql.Date;

public class Qna {

	private int qId;
	private String qTitle;
	private String qContent;
	private Date qCreateDate;
	private Date qModifyDate;
	private String qStatus;
	private int qCount;
	private String aTitle;
	private String aContent;
	private Date aCreateDate;
	private int mNo;
	private int sNo;
	
	public Qna() {
		
	}
	
	public Qna(int qId, String qTitle, String qContent, Date qCreateDate, Date qModifyDate, String qStatus, int qCount,
			String aTitle, String aContent, Date aCreateDate, int mNo, int sNo) {
		super();
		this.qId = qId;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qCreateDate = qCreateDate;
		this.qModifyDate = qModifyDate;
		this.qStatus = qStatus;
		this.qCount = qCount;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aCreateDate = aCreateDate;
		this.mNo = mNo;
		this.sNo = sNo;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqCreateDate() {
		return qCreateDate;
	}

	public void setqCreateDate(Date qCreateDate) {
		this.qCreateDate = qCreateDate;
	}

	public Date getqModifyDate() {
		return qModifyDate;
	}

	public void setqModifyDate(Date qModifyDate) {
		this.qModifyDate = qModifyDate;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public int getqCount() {
		return qCount;
	}

	public void setqCount(int qCount) {
		this.qCount = qCount;
	}

	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public Date getaCreateDate() {
		return aCreateDate;
	}

	public void setaCreateDate(Date aCreateDate) {
		this.aCreateDate = aCreateDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	@Override
	public String toString() {
		return "Qna [qId=" + qId + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qCreateDate=" + qCreateDate
				+ ", qModifyDate=" + qModifyDate + ", qStatus=" + qStatus + ", qCount=" + qCount + ", aTitle=" + aTitle
				+ ", aContent=" + aContent + ", aCreateDate=" + aCreateDate + ", mNo=" + mNo + ", sNo=" + sNo + "]";
	}
	
	
	
}
