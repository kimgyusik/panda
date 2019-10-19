package com.kh.panda.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.member.model.vo.Member;

@Repository("mDao") 
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	public Member loginMember(Member m) {
	
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}
	
	

	public String find_id(String email){
		return sqlSession.selectOne("memberMapper.find_id", email);
	}

	
	
	
}




