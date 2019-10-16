package com.kh.panda.admin.violate.model.vo;

import java.sql.Date;

public class Violate {

	private int vNo;			// 신고번호
	private int sNo;			// 신고대상 판매자
	private int mNo;			// 신고자
	private int pId;			// 신고상품
	private int stNo;			// 신고방송
	private String vTitle;		// 신고제목
	private String vContent;	// 신고내용
	private Date vDate;			// 신고일자
	private String vPhoto;		// 신고첨부
	private String vStatus;		// 처리상태
	
	
	public Violate() {}


	public Violate(int vNo, int sNo, int mNo, int pId, int stNo, String vTitle, String vContent, Date vDate,
			String vPhoto, String vStatus) {
		super();
		this.vNo = vNo;
		this.sNo = sNo;
		this.mNo = mNo;
		this.pId = pId;
		this.stNo = stNo;
		this.vTitle = vTitle;
		this.vContent = vContent;
		this.vDate = vDate;
		this.vPhoto = vPhoto;
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


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
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


	public String getvPhoto() {
		return vPhoto;
	}


	public void setvPhoto(String vPhoto) {
		this.vPhoto = vPhoto;
	}


	public String getvStatus() {
		return vStatus;
	}


	public void setvStatus(String vStatus) {
		this.vStatus = vStatus;
	}


	@Override
	public String toString() {
		return "Violate [vNo=" + vNo + ", sNo=" + sNo + ", mNo=" + mNo + ", pId=" + pId + ", stNo=" + stNo + ", vTitle="
				+ vTitle + ", vContent=" + vContent + ", vDate=" + vDate + ", vPhoto=" + vPhoto + ", vStatus=" + vStatus
				+ "]";
	}

	
	

}