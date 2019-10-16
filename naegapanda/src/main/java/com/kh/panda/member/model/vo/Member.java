package com.kh.panda.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;




public class Member {
	private int mno;
	private String id;
	private String pwd;
	private String name;
	private String birthdate;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private Date joindate;
	private String dropyn;
	private String blackcode;
	
	
	public Member() {}

	
	
	

	public Member(int mno, String id, String pwd, String name, String birthdate, String gender, String email,
			String phone, String address, Date joindate, String dropyn, String blackcode) {
		super();
		this.mno = mno;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birthdate = birthdate;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.joindate = joindate;
		this.dropyn = dropyn;
		this.blackcode = blackcode;
	}



	



	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
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


	public String getBirthdate() {
		return birthdate;
	}


	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
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


	public Date getJoindate() {
		return joindate;
	}


	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	public String getDropyn() {
		return dropyn;
	}


	public void setDropyn(String dropyn) {
		this.dropyn = dropyn;
	}


	public String getBlackcode() {
		return blackcode;
	}


	public void setBlackcode(String blackcode) {
		this.blackcode = blackcode;
	}


	@Override
	public String toString() {
		return "Member [mno=" + mno + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birthdate=" + birthdate
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", joindate=" + joindate + ", dropyn=" + dropyn + ", blackcode=" + blackcode + "]";
	}
	
	
	
	
	
}
