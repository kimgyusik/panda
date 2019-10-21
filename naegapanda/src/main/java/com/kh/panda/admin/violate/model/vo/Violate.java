package com.kh.panda.admin.violate.model.vo;

import java.sql.Date;

public class Violate {

	private int vNo;					// 신고 번호
	private int sNo;					// 신고 대상 판매자
	private String sName;				// 판매자명
	private int mNo;					// 신고자
	private	String mName;				// 신고자명
	private int pId;					// 신고 상품 번호
	private String pName;				// 신고 상품 이름
	private int stNo;					// 신고 방송
	private String vTitle;				// 신고 제목
	private String vContent;			// 신고 내용
	private Date vDate;					// 신고 일자
	private String vOriginalFileName; 	// 신고 파일 원래 이름
	private String vRenameFileName; 	// 신고 파일 변경 이름
	private String vStatus;				// 처리 상태
		
	
	public Violate() {}


	public Violate(int vNo, int sNo, String sName, int mNo, String mName, int pId, String pName, int stNo,
			String vTitle, String vContent, Date vDate, String vOriginalFileName, String vRenameFileName,
			String vStatus) {
		super();
		this.vNo = vNo;
		this.sNo = sNo;
		this.sName = sName;
		this.mNo = mNo;
		this.mName = mName;
		this.pId = pId;
		this.pName = pName;
		this.stNo = stNo;
		this.vTitle = vTitle;
		this.vContent = vContent;
		this.vDate = vDate;
		this.vOriginalFileName = vOriginalFileName;
		this.vRenameFileName = vRenameFileName;
		this.vStatus = vStatus;
	}


	public int getvNo() {
		return vNo;
	}


	public void setvNo(int vNo) {
		this.vNo = vNo;
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


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
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


	public int getStNo() {
		return stNo;
	}


	public void setStNo(int stNo) {
		this.stNo = stNo;
	}


	public String getvTitle() {
		return vTitle;
	}


	public void setvTitle(String vTitle) {
		this.vTitle = vTitle;
	}


	public String getvContent() {
		return vContent;
	}


	public void setvContent(String vContent) {
		this.vContent = vContent;
	}


	public Date getvDate() {
		return vDate;
	}


	public void setvDate(Date vDate) {
		this.vDate = vDate;
	}


	public String getvOriginalFileName() {
		return vOriginalFileName;
	}


	public void setvOriginalFileName(String vOriginalFileName) {
		this.vOriginalFileName = vOriginalFileName;
	}


	public String getvRenameFileName() {
		return vRenameFileName;
	}


	public void setvRenameFileName(String vRenameFileName) {
		this.vRenameFileName = vRenameFileName;
	}


	public String getvStatus() {
		return vStatus;
	}


	public void setvStatus(String vStatus) {
		this.vStatus = vStatus;
	}


	@Override
	public String toString() {
		return "Violate [vNo=" + vNo + ", sNo=" + sNo + ", sName=" + sName + ", mNo=" + mNo + ", mName=" + mName
				+ ", pId=" + pId + ", pName=" + pName + ", stNo=" + stNo + ", vTitle=" + vTitle + ", vContent="
				+ vContent + ", vDate=" + vDate + ", vOriginalFileName=" + vOriginalFileName + ", vRenameFileName="
				+ vRenameFileName + ", vStatus=" + vStatus + "]";
	}



}