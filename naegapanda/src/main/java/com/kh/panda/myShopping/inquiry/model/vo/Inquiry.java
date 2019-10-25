package com.kh.panda.myShopping.inquiry.model.vo;

import java.util.Date;

public class Inquiry {
	
	private int iId;
	private String iTitle;
	private String iContents;
	private Date iDate;
	private int mNo;
	private String mId;
	private String iAnswer;
	private Date iaDate;
	private String iState;
	private String iDel;
	private int pId;
	private String pName;
	private int sNo;
	private String openYn;
	private String paChangeName;
	
	public Inquiry() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Inquiry(int iId, String iTitle, String iContents, Date iDate, int mNo, String mId, String iAnswer,
			Date iaDate, String iState, String iDel, int pId, String pName, int sNo, String openYn,
			String paChangeName) {
		super();
		this.iId = iId;
		this.iTitle = iTitle;
		this.iContents = iContents;
		this.iDate = iDate;
		this.mNo = mNo;
		this.mId = mId;
		this.iAnswer = iAnswer;
		this.iaDate = iaDate;
		this.iState = iState;
		this.iDel = iDel;
		this.pId = pId;
		this.pName = pName;
		this.sNo = sNo;
		this.openYn = openYn;
		this.paChangeName = paChangeName;
	}

	public int getiId() {
		return iId;
	}

	public void setiId(int iId) {
		this.iId = iId;
	}

	public String getiTitle() {
		return iTitle;
	}

	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}

	public String getiContents() {
		return iContents;
	}

	public void setiContents(String iContents) {
		this.iContents = iContents;
	}

	public Date getiDate() {
		return iDate;
	}

	public void setiDate(Date iDate) {
		this.iDate = iDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getiAnswer() {
		return iAnswer;
	}

	public void setiAnswer(String iAnswer) {
		this.iAnswer = iAnswer;
	}

	public Date getIaDate() {
		return iaDate;
	}

	public void setIaDate(Date iaDate) {
		this.iaDate = iaDate;
	}

	public String getiState() {
		return iState;
	}

	public void setiState(String iState) {
		this.iState = iState;
	}

	public String getiDel() {
		return iDel;
	}

	public void setiDel(String iDel) {
		this.iDel = iDel;
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

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getOpenYn() {
		return openYn;
	}

	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}

	public String getPaChangeName() {
		return paChangeName;
	}

	public void setPaChangeName(String paChangeName) {
		this.paChangeName = paChangeName;
	}

	@Override
	public String toString() {
		return "Inquiry [iId=" + iId + ", iTitle=" + iTitle + ", iContents=" + iContents + ", iDate=" + iDate + ", mNo="
				+ mNo + ", mId=" + mId + ", iAnswer=" + iAnswer + ", iaDate=" + iaDate + ", iState=" + iState
				+ ", iDel=" + iDel + ", pId=" + pId + ", pName=" + pName + ", sNo=" + sNo + ", openYn=" + openYn
				+ ", paChangeName=" + paChangeName + "]";
	}

	
	
	

}
