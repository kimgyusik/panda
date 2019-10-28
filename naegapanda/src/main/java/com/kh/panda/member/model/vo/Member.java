package com.kh.panda.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;




public class Member {
	private int mNo;
	private String id;
	private String pwd;
	private String name;
	private String birthDate;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private Date joinDate;
	private String dropYn;
	private String blackCode;
	private String emailKey;
	
	
	public Member() {}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}


	public String getDropYn() {
		return dropYn;
	}


	public void setDropYn(String dropYn) {
		this.dropYn = dropYn;
	}


	public String getBlackCode() {
		return blackCode;
	}


	public void setBlackCode(String blackCode) {
		this.blackCode = blackCode;
	}


	public String getEmailKey() {
		return emailKey;
	}


	public void setEmailKey(String emailKey) {
		this.emailKey = emailKey;
	}


	public Member(int mNo, String id, String pwd, String name, String birthDate, String gender, String email,
			String phone, String address, Date joinDate, String dropYn, String blackCode, String emailKey) {
		super();
		this.mNo = mNo;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.joinDate = joinDate;
		this.dropYn = dropYn;
		this.blackCode = blackCode;
		this.emailKey = emailKey;
	}


	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birthDate=" + birthDate
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", joinDate=" + joinDate + ", dropYn=" + dropYn + ", blackCode=" + blackCode + ", emailKey="
				+ emailKey + "]";
	}


}