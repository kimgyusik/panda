package com.kh.panda.product.model.vo;

public class Home {
	
	private int pId;
	private String pName;
	private String cName;
	private String cName2;
	private String paOriginName;
	private String paChangeName;
	private int oPrice;
	
	public Home() {}

	public Home(int pId, String pName, String cName, String cName2, String paOriginName, String paChangeName,
			int oPrice) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.cName = cName;
		this.cName2 = cName2;
		this.paOriginName = paOriginName;
		this.paChangeName = paChangeName;
		this.oPrice = oPrice;
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

	public String getPaOriginName() {
		return paOriginName;
	}

	public void setPaOriginName(String paOriginName) {
		this.paOriginName = paOriginName;
	}

	public String getPaChangeName() {
		return paChangeName;
	}

	public void setPaChangeName(String paChangeName) {
		this.paChangeName = paChangeName;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	@Override
	public String toString() {
		return "Home [pId=" + pId + ", pName=" + pName + ", cName=" + cName + ", cName2=" + cName2 + ", paOriginName="
				+ paOriginName + ", paChangeName=" + paChangeName + ", oPrice=" + oPrice + "]";
	}
	
}
