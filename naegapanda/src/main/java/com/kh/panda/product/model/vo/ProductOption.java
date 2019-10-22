package com.kh.panda.product.model.vo;

public class ProductOption {
	private int pId;
	private int oNo;
	private String oName;
	private int oPrice;
	private int oAmount;
	private String oStatus;
	private int oPurchase;
	private String changeName;
	private String filePath;
	
	public ProductOption() {}
	
	public ProductOption(int pId, int oNo, String oName, int oPrice, int oAmount, String oStatus, int oPurchase,
			String changeName) {
		super();
		this.pId = pId;
		this.oNo = oNo;
		this.oName = oName;
		this.oPrice = oPrice;
		this.oAmount = oAmount;
		this.oStatus = oStatus;
		this.oPurchase = oPurchase;
		this.changeName = changeName;
	}
	

	public ProductOption(int pId, int oNo, String oName, int oPrice, int oAmount, String oStatus, int oPurchase,
			String changeName, String filePath) {
		super();
		this.pId = pId;
		this.oNo = oNo;
		this.oName = oName;
		this.oPrice = oPrice;
		this.oAmount = oAmount;
		this.oStatus = oStatus;
		this.oPurchase = oPurchase;
		this.changeName = changeName;
		this.filePath = filePath;
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

	public int getoAmount() {
		return oAmount;
	}

	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public int getoPurchase() {
		return oPurchase;
	}

	public void setoPurchase(int oPurchase) {
		this.oPurchase = oPurchase;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ProductOption [pId=" + pId + ", oNo=" + oNo + ", oName=" + oName + ", oPrice=" + oPrice + ", oAmount="
				+ oAmount + ", oStatus=" + oStatus + ", oPurchase=" + oPurchase + ", changeName=" + changeName
				+ ", filePath=" + filePath + "]";
	}

}
