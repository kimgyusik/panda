package com.kh.panda.member.model.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.panda.member.model.dao.MemberDao;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.seller.model.dao.SellerDao;

@Service("mService") 
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SellerDao sDao;

	@Override
	public Member loginMember(Member m) {
		
		return mDao.loginMember(m);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(m);
	}

	@Override
	public int updateMember(Member m) {
		
		return mDao.updateMember(m);
	}

	@Override
	public int deleteMember(String id) {
		
		return mDao.deleteMember(id);
	}

	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}

	
	
	
	
	@Override
	public String find_id(String email) {
		return mDao.find_id(email);
	}

	
	
	
	@Inject
    private JavaMailSender mailSender;

	
	
	@Override
	public int newPassword(Member m) {
		return mDao.newPassword(m);
	}

	@Override
	public int pwdUpdate(Member mp) {
		return mDao.pwdUpdate(mp);
	}
	
	
	

}
