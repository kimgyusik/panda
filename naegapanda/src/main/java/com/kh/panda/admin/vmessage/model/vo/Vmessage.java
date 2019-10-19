package com.kh.panda.admin.vmessage.model.vo;

import java.sql.Date;

public class Vmessage {

	private int vmNo;					// 신고메세지 번호
	private int sNo;					// 판매자 번호
	private String sName;				// 판매자 이름
	private int pId;					// 상품 번호
	private String pName;				// 상품 이름
	private String vmTitle; 			// 신고메세지 제목
	private String vmContent;			// 신고메세지 내용
	private Date vmSendDate;			// 신고메세지 발신 날짜
	private Date vmCheckDate;			// 신고메세지 확인 날짜	
	private String vmOriginalFileName;	// 신고메세지 첨부파일 원래이름
	private String vmRenameFileName;		// 신고메세지 첨부파일 변경이름
	private String vmStatus;			// 신고메세지 확인 상태


	public Vmessage() {}


	public Vmessage(int vmNo, int sNo, String sName, int pId, String pName, String vmTitle, String vmContent,
			Date vmSendDate, Date vmCheckDate, String vmOriginalFileName, String vmRenameFileName, String vmStatus) {
		super();
		this.vmNo = vmNo;
		this.sNo = sNo;
		this.sName = sName;
		this.pId = pId;
		this.pName = pName;
		this.vmTitle = vmTitle;
		this.vmContent = vmContent;
		this.vmSendDate = vmSendDate;
		this.vmCheckDate = vmCheckDate;
		this.vmOriginalFileName = vmOriginalFileName;
		this.vmRenameFileName = vmRenameFileName;
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


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
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


	public String getVmOriginalFileName() {
		return vmOriginalFileName;
	}


	public void setVmOriginalFileName(String vmOriginalFileName) {
		this.vmOriginalFileName = vmOriginalFileName;
	}


	public String getVmRenameFileName() {
		return vmRenameFileName;
	}


	public void setVmRenameFileName(String vmRenameFileName) {
		this.vmRenameFileName = vmRenameFileName;
	}


	public String getVmStatus() {
		return vmStatus;
	}


	public void setVmStatus(String vmStatus) {
		this.vmStatus = vmStatus;
	}


	@Override
	public String toString() {
		return "Vmessage [vmNo=" + vmNo + ", sNo=" + sNo + ", sName=" + sName + ", pId=" + pId + ", pName=" + pName
				+ ", vmTitle=" + vmTitle + ", vmContent=" + vmContent + ", vmSendDate=" + vmSendDate + ", vmCheckDate="
				+ vmCheckDate + ", vmOriginalFileName=" + vmOriginalFileName + ", vmRenameFileName=" + vmRenameFileName
				+ ", vmStatus=" + vmStatus + "]";
	}

	
}