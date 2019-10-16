package com.kh.panda.myShopping.review.model.vo;

public class Commend {
	
	private int mNo;
	private int rId;
	
	public Commend() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Commend(int mNo, int rId) {
		super();
		this.mNo = mNo;
		this.rId = rId;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	@Override
	public String toString() {
		return "Commend [mNo=" + mNo + ", rId=" + rId + "]";
	}
	
	

}
