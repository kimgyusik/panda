package com.kh.panda.admin.board.qna.model.vo;

import java.sql.Date;

public class Qna {

	private int qId;
	private String qTitle;
	private String qContent;
	private int mNo;
	private int sNo;
	private int qCount;
	private Date qCreateDate;
	private Date qModifyDate;
	private String qStatus;
	private String mName;
	
	
	public Qna() {
		
	}


	public Qna(int qId, String qTitle, String qContent, int mNo, int sNo, int qCount, Date qCreateDate,
			Date qModifyDate, String qStatus, String mName) {
		super();
		this.qId = qId;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.mNo = mNo;
		this.sNo = sNo;
		this.qCount = qCount;
		this.qCreateDate = qCreateDate;
		this.qModifyDate = qModifyDate;
		this.qStatus = qStatus;
		this.mName = mName;
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


	public int getqCount() {
		return qCount;
	}


	public void setqCount(int qCount) {
		this.qCount = qCount;
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


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	@Override
	public String toString() {
		return "Qna [qId=" + qId + ", qTitle=" + qTitle + ", qContent=" + qContent + ", mNo=" + mNo + ", sNo=" + sNo
				+ ", qCount=" + qCount + ", qCreateDate=" + qCreateDate + ", qModifyDate=" + qModifyDate + ", qStatus="
				+ qStatus + ", mName=" + mName + "]";
	}


	
	
	
	
	
	
}
