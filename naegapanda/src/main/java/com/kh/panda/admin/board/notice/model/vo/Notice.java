package com.kh.panda.admin.board.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int nId;
	private String nTitle;
	private String nContent;
	private int nCount;
	private Date nCreateDate;
	private Date nModifyDate;
	private String nFileName;
	private String nStatus;
	
	public Notice() {
		
	}
	
	public Notice(int nId, String nTitle, String nContent, int nCount, Date nCreateDate, Date nModifyDate,
			String nFileName, String nStatus) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nFileName = nFileName;
		this.nStatus = nStatus;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnFileName() {
		return nFileName;
	}

	public void setnFileName(String nFileName) {
		this.nFileName = nFileName;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nCount=" + nCount
				+ ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nFileName=" + nFileName
				+ ", nStatus=" + nStatus + "]";
	}
	
	
	
	

}
