package com.kh.panda.myShopping.review.model.vo;

import java.util.Date;

public class Review {
	
	private int rId;
	private String rTitle;
	private String rContents;
	private Date rDate;
	private int rCount;
	private int mNo;
	private String mId;
	private String rDel;
	private int rCommend;
	private int payId;
	private String rImage;
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int rId, String rTitle, String rContents, Date rDate, int rCount, int mNo, String mId, String rDel,
			int rCommend, int payId, String rImage) {
		super();
		this.rId = rId;
		this.rTitle = rTitle;
		this.rContents = rContents;
		this.rDate = rDate;
		this.rCount = rCount;
		this.mNo = mNo;
		this.mId = mId;
		this.rDel = rDel;
		this.rCommend = rCommend;
		this.payId = payId;
		this.rImage = rImage;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContents() {
		return rContents;
	}

	public void setrContents(String rContents) {
		this.rContents = rContents;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
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

	public String getrDel() {
		return rDel;
	}

	public void setrDel(String rDel) {
		this.rDel = rDel;
	}

	public int getrCommend() {
		return rCommend;
	}

	public void setrCommend(int rCommend) {
		this.rCommend = rCommend;
	}

	public int getPayId() {
		return payId;
	}

	public void setPayId(int payId) {
		this.payId = payId;
	}

	public String getrImage() {
		return rImage;
	}

	public void setrImage(String rImage) {
		this.rImage = rImage;
	}

	@Override
	public String toString() {
		return "Review [rId=" + rId + ", rTitle=" + rTitle + ", rContents=" + rContents + ", rDate=" + rDate
				+ ", rCount=" + rCount + ", mNo=" + mNo + ", mId=" + mId + ", rDel=" + rDel + ", rCommend=" + rCommend
				+ ", payId=" + payId + ", rImage=" + rImage + "]";
	}
	
	
	
	

}
