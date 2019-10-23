package com.kh.panda.admin.board.qna.user.model.vo;

import java.sql.Date;

public class Answer {

	private int aId;
	private int qId;
	private String aTitle;
	private String aContent;
	private String aWriter;
	private Date aCreateDate;
	private String aStatus;
	
	public Answer() {
		
	}

	public Answer(int aId, int qId, String aTitle, String aContent, String aWriter, Date aCreateDate, String aStatus) {
		super();
		this.aId = aId;
		this.qId = qId;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aWriter = aWriter;
		this.aCreateDate = aCreateDate;
		this.aStatus = aStatus;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
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

	public String getaWriter() {
		return aWriter;
	}

	public void setaWriter(String aWriter) {
		this.aWriter = aWriter;
	}

	public Date getaCreateDate() {
		return aCreateDate;
	}

	public void setaCreateDate(Date aCreateDate) {
		this.aCreateDate = aCreateDate;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	@Override
	public String toString() {
		return "Answer [aId=" + aId + ", qId=" + qId + ", aTitle=" + aTitle + ", aContent=" + aContent + ", aWriter="
				+ aWriter + ", aCreateDate=" + aCreateDate + ", aStatus=" + aStatus + "]";
	}
	
	
	
}
