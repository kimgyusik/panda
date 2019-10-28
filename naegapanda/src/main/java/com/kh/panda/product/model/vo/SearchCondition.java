package com.kh.panda.product.model.vo;

public class SearchCondition {


	private String keyword;
	private int startNum;
	private int endNum;

	public SearchCondition() {}

	public SearchCondition(String keyword, int startNum, int endNum) {
		super();
		this.keyword = keyword;
		this.startNum = startNum;
		this.endNum = endNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
		return "SearchCondition [keyword=" + keyword + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
}
