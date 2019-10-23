package com.kh.panda.myShopping.payment.model.vo;

import java.util.Date;

public class Payment {
	
	private int payId;
	private int mNo;
	private int pId;
	private int oNo;
	private String oName;
	private int oPrice;
	private String oStatus;
	private String pStatus;
	private String deliverySpot;
	private String payRequest;
	private Date payDate;
	private int count;
	private String deliveryStatus;
	private String recipient;
	private String recipientPhone;
	private String pName;
	private String pContent;
	private int cId;
	private String cName;
	private String cName2;
	private int sNo;
	private String storeName;
	private String sBaddress;
	private String sBphone;
	
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payment(int payId, int mNo, int pId, int oNo, String oName, int oPrice, String oStatus, String pStatus,
			String deliverySpot, String payRequest, Date payDate, int count, String deliveryStatus, String recipient,
			String recipientPhone, String pName, String pContent, int cId, String cName, String cName2, int sNo,
			String storeName, String sBaddress, String sBphone) {
		super();
		this.payId = payId;
		this.mNo = mNo;
		this.pId = pId;
		this.oNo = oNo;
		this.oName = oName;
		this.oPrice = oPrice;
		this.oStatus = oStatus;
		this.pStatus = pStatus;
		this.deliverySpot = deliverySpot;
		this.payRequest = payRequest;
		this.payDate = payDate;
		this.count = count;
		this.deliveryStatus = deliveryStatus;
		this.recipient = recipient;
		this.recipientPhone = recipientPhone;
		this.pName = pName;
		this.pContent = pContent;
		this.cId = cId;
		this.cName = cName;
		this.cName2 = cName2;
		this.sNo = sNo;
		this.storeName = storeName;
		this.sBaddress = sBaddress;
		this.sBphone = sBphone;
	}

	public int getPayId() {
		return payId;
	}

	public void setPayId(int payId) {
		this.payId = payId;
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

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public String getDeliverySpot() {
		return deliverySpot;
	}

	public void setDeliverySpot(String deliverySpot) {
		this.deliverySpot = deliverySpot;
	}

	public String getPayRequest() {
		return payRequest;
	}

	public void setPayRequest(String payRequest) {
		this.payRequest = payRequest;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcName2() {
		return cName2;
	}

	public void setcName2(String cName2) {
		this.cName2 = cName2;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getsBaddress() {
		return sBaddress;
	}

	public void setsBaddress(String sBaddress) {
		this.sBaddress = sBaddress;
	}

	public String getsBphone() {
		return sBphone;
	}

	public void setsBphone(String sBphone) {
		this.sBphone = sBphone;
	}

	@Override
	public String toString() {
		return "Payment [payId=" + payId + ", mNo=" + mNo + ", pId=" + pId + ", oNo=" + oNo + ", oName=" + oName
				+ ", oPrice=" + oPrice + ", oStatus=" + oStatus + ", pStatus=" + pStatus + ", deliverySpot="
				+ deliverySpot + ", payRequest=" + payRequest + ", payDate=" + payDate + ", count=" + count
				+ ", deliveryStatus=" + deliveryStatus + ", recipient=" + recipient + ", recipientPhone="
				+ recipientPhone + ", pName=" + pName + ", pContent=" + pContent + ", cId=" + cId + ", cName=" + cName
				+ ", cName2=" + cName2 + ", sNo=" + sNo + ", storeName=" + storeName + ", sBaddress=" + sBaddress
				+ ", sBphone=" + sBphone + "]";
	}

	
	
	
	

}
