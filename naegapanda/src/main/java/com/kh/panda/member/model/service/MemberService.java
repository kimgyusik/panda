package com.kh.panda.member.model.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.kh.panda.member.model.vo.Member;

public interface MemberService {
	
	// 1. 회원 로그인 서비스를 위한 메소드
	Member loginMember(Member m);
	
	// 2. 회원 가입 서비스를 위한 메소드
	int insertMember(Member m);
	
	// 3. 회원 정보 수정 서비스를 위한 메소드
	int updateMember(Member m);
	
	// 4. 회원 탈퇴 서비스를 위한 메소드
	int deleteMember(String id);
	
	// 5. 아이디 중복체크를 위한 메소드
	int idCheck(String id);

	
	// 6. 아이디를 찾기 위한 메소드
	String find_id(String email);

	
	int newPassword(Member m);

	
	int pwdUpdate(Member mp);


	
	
	/*
	 * // 이메일도전 int emailConfirm(String sId);
	 */
	
	
}
