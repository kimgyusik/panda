package com.kh.panda.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter	
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
//@EqualsAndHashCode

//@Data -> 위의 모두를 다 처리해주는 어노테이션(단, 매개변수 생성자는 안됨)
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
	
}
