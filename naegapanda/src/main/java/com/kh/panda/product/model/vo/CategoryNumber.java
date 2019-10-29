package com.kh.panda.product.model.vo;

public class CategoryNumber {
	
	private int startNum;
	private int endNum;
	
	public CategoryNumber() {}

	public CategoryNumber(int startNum, int endNum) {
		super();
		this.startNum = startNum;
		this.endNum = endNum;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	@Override
	public String toString() {
		return "CategoryNumber [startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
}
