package com.kh.panda.product.model.vo;

import java.sql.Date;

public class ProductAttachment {

	private int paId;
	private Date paCreateDate;
	private String paOriginName;
	private String paChangeName;
	private int paFileLevel;
	private String paStatus;
	private int pId;
	private String filePath;
	
	public ProductAttachment() {}
	
	public ProductAttachment(int paId, Date paCreateDate, String paOriginName, String paChangeName, int paFileLevel,
			String paStatus, int pId) {
		super();
		this.paId = paId;
		this.paCreateDate = paCreateDate;
		this.paOriginName = paOriginName;
		this.paChangeName = paChangeName;
		this.paFileLevel = paFileLevel;
		this.paStatus = paStatus;
		this.pId = pId;
	}
	

	public ProductAttachment(int paId, Date paCreateDate, String paOriginName, String paChangeName, int paFileLevel,
			String paStatus, int pId, String filePath) {
		super();
		this.paId = paId;
		this.paCreateDate = paCreateDate;
		this.paOriginName = paOriginName;
		this.paChangeName = paChangeName;
		this.paFileLevel = paFileLevel;
		this.paStatus = paStatus;
		this.pId = pId;
		this.filePath = filePath;
	}

	public int getPaId() {
		return paId;
	}

	public void setPaId(int paId) {
		this.paId = paId;
	}

	public Date getPaCreateDate() {
		return paCreateDate;
	}

	public void setPaCreateDate(Date paCreateDate) {
		this.paCreateDate = paCreateDate;
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

	public int getPaFileLevel() {
		return paFileLevel;
	}

	public void setPaFileLevel(int paFileLevel) {
		this.paFileLevel = paFileLevel;
	}

	public String getPaStatus() {
		return paStatus;
	}

	public void setPaStatus(String paStatus) {
		this.paStatus = paStatus;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ProductAttachment [paId=" + paId + ", paCreateDate=" + paCreateDate + ", paOriginName=" + paOriginName
				+ ", paChangeName=" + paChangeName + ", paFileLevel=" + paFileLevel + ", paStatus=" + paStatus
				+ ", pId=" + pId + ", filePath=" + filePath + "]";
	}

}
