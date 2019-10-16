package com.kh.panda.seller.model.vo;

public class Seller {
	
	private int sNo;
	private String sId;
	private String sPwd;
	private String sName;
	private String sAddress;
	private int sNum;	// 주민번호
	private String sEmail;
	private String comunication;	// 이메일수신여부
	private String sPhone;
	private String stNum;	// 전자통신등록번호
	private String sbNum;	// 사업자번호
	private String storeName;	// 상점명
	private String sCeoName;	// 대표이름
	private String state;	// 업태
	private String sector;	// 업종
	private String ssAddress;	// 사업장주소
	private String ssPhone;	// 사업장전화번호
	private String sOk;		// 승인여부
	private String sStatus; // 탈퇴여부
	
	public Seller() {
		
	}

	public Seller(int sNo, String sId, String sPwd, String sName, String sAddress, int sNum, String sEmail,
			String comunication, String sPhone, String stNum, String sbNum, String storeName, String sCeoName,
			String state, String sector, String ssAddress, String ssPhone, String sOk, String sStatus) {
		super();
		this.sNo = sNo;
		this.sId = sId;
		this.sPwd = sPwd;
		this.sName = sName;
		this.sAddress = sAddress;
		this.sNum = sNum;
		this.sEmail = sEmail;
		this.comunication = comunication;
		this.sPhone = sPhone;
		this.stNum = stNum;
		this.sbNum = sbNum;
		this.storeName = storeName;
		this.sCeoName = sCeoName;
		this.state = state;
		this.sector = sector;
		this.ssAddress = ssAddress;
		this.ssPhone = ssPhone;
		this.sOk = sOk;
		this.sStatus = sStatus;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsPwd() {
		return sPwd;
	}

	public void setsPwd(String sPwd) {
		this.sPwd = sPwd;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public String getsEmail() {
		return sEmail;
	}

	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	public String getComunication() {
		return comunication;
	}

	public void setComunication(String comunication) {
		this.comunication = comunication;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getStNum() {
		return stNum;
	}

	public void setStNum(String stNum) {
		this.stNum = stNum;
	}

	public String getSbNum() {
		return sbNum;
	}

	public void setSbNum(String sbNum) {
		this.sbNum = sbNum;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getsCeoName() {
		return sCeoName;
	}

	public void setsCeoName(String sCeoName) {
		this.sCeoName = sCeoName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public String getSsAddress() {
		return ssAddress;
	}

	public void setSsAddress(String ssAddress) {
		this.ssAddress = ssAddress;
	}

	public String getSsPhone() {
		return ssPhone;
	}

	public void setSsPhone(String ssPhone) {
		this.ssPhone = ssPhone;
	}

	public String getsOk() {
		return sOk;
	}

	public void setsOk(String sOk) {
		this.sOk = sOk;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	@Override
	public String toString() {
		return "Seller [sNo=" + sNo + ", sId=" + sId + ", sPwd=" + sPwd + ", sName=" + sName + ", sAddress=" + sAddress
				+ ", sNum=" + sNum + ", sEmail=" + sEmail + ", comunication=" + comunication + ", sPhone=" + sPhone
				+ ", stNum=" + stNum + ", sbNum=" + sbNum + ", storeName=" + storeName + ", sCeoName=" + sCeoName
				+ ", state=" + state + ", sector=" + sector + ", ssAddress=" + ssAddress + ", ssPhone=" + ssPhone
				+ ", sOk=" + sOk + ", sStatus=" + sStatus + "]";
	}
	
}
