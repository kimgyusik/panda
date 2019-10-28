package com.kh.panda.admin.board.qna.seller.model.vo;

import java.sql.Date;

public class SAnswer {

	private int sqId;
	private int qId;
	private String saTitle;
	private String saContent;
	private String saWriter;
	private Date saCreateDate;
	private String saStatus;
	
	public SAnswer() {
		
	}

	public SAnswer(int sqId, int qId, String saTitle, String saContent, String saWriter, Date saCreateDate,
			String saStatus) {
		super();
		this.sqId = sqId;
		this.qId = qId;
		this.saTitle = saTitle;
		this.saContent = saContent;
		this.saWriter = saWriter;
		this.saCreateDate = saCreateDate;
		this.saStatus = saStatus;
	}

	public int getSqId() {
		return sqId;
	}

	public void setSqId(int sqId) {
		this.sqId = sqId;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public String getSaTitle() {
		return saTitle;
	}

	public void setSaTitle(String saTitle) {
		this.saTitle = saTitle;
	}

	public String getSaContent() {
		return saContent;
	}

	public void setSaContent(String saContent) {
		this.saContent = saContent;
	}

	public String getSaWriter() {
		return saWriter;
	}

	public void setSaWriter(String saWriter) {
		this.saWriter = saWriter;
	}

	public Date getSaCreateDate() {
		return saCreateDate;
	}

	public void setSaCreateDate(Date saCreateDate) {
		this.saCreateDate = saCreateDate;
	}

	public String getSaStatus() {
		return saStatus;
	}

	public void setSaStatus(String saStatus) {
		this.saStatus = saStatus;
	}

	@Override
	public String toString() {
		return "SAnswer [sqId=" + sqId + ", qId=" + qId + ", saTitle=" + saTitle + ", saContent=" + saContent
				+ ", saWriter=" + saWriter + ", saCreateDate=" + saCreateDate + ", saStatus=" + saStatus + "]";
	}
	
	
}
