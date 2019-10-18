package com.kh.panda.admin.vmessage.model.vo;

import java.sql.Date;

public class Vmessage {

	private int vmNo;			// 신고메세지 번호
	private int sNo;			// 판매자 번호
	private String sName;		// 판매자 이름
	private String vmTitle; 	// 신고메세지 제목
	private String vmContent;	// 신고메세지 내용
	private Date vmSendDate;	// 신고메세지 발신 날짜
	private Date vmCheckDate;	// 신고메세지 확인 날짜
	private String vmStatus;	// 신고메세지 확인 상태


	public Vmessage() {}


	public Vmessage(int vmNo, int sNo, String sName, String vmTitle, String vmContent, Date vmSendDate,
			Date vmCheckDate, String vmStatus) {
		super();
		this.vmNo = vmNo;
		this.sNo = sNo;
		this.sName = sName;
		this.vmTitle = vmTitle;
		this.vmContent = vmContent;
		this.vmSendDate = vmSendDate;
		this.vmCheckDate = vmCheckDate;
		this.vmStatus = vmStatus;
	}


	public int getVmNo() {
		return vmNo;
	}


	public void setVmNo(int vmNo) {
		this.vmNo = vmNo;
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


	public String getVmTitle() {
		return vmTitle;
	}


	public void setVmTitle(String vmTitle) {
		this.vmTitle = vmTitle;
	}


	public String getVmContent() {
		return vmContent;
	}


	public void setVmContent(String vmContent) {
		this.vmContent = vmContent;
	}


	public Date getVmSendDate() {
		return vmSendDate;
	}


	public void setVmSendDate(Date vmSendDate) {
		this.vmSendDate = vmSendDate;
	}


	public Date getVmCheckDate() {
		return vmCheckDate;
	}


	public void setVmCheckDate(Date vmCheckDate) {
		this.vmCheckDate = vmCheckDate;
	}


	public String getVmStatus() {
		return vmStatus;
	}


	public void setVmStatus(String vmStatus) {
		this.vmStatus = vmStatus;
	}


	@Override
	public String toString() {
		return "Vmessage [vmNo=" + vmNo + ", sNo=" + sNo + ", sName=" + sName + ", vmTitle=" + vmTitle + ", vmContent="
				+ vmContent + ", vmSendDate=" + vmSendDate + ", vmCheckDate=" + vmCheckDate + ", vmStatus=" + vmStatus
				+ "]";
	}

	

	
}