package com.kh.panda.member.model.vo;

import java.sql.Date;





//@Data -> 위의 모두를 다 처리해주는 어노테이션(단, 매개변수 생성자는 안됨)
public class Member {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String gender;
	//private int age;
	private String age;
	private String phone;
	private String address;
	private Date enrollDate;
	private Date updateDate;
	private String mStatus;
	
}
