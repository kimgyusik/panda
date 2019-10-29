package com.kh.panda.admin.pmanager.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.pmanager.model.vo.Pmanager;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;

@Repository("pmDao")
public class PmanagerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("pmanagerMapper.getListCount");
	}
	
	public ArrayList<Pmanager> selectList(PageInfo pi, String cName2){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("pmanagerMapper.selectList", cName2, rowBounds);
	}
	
	public ArrayList<Pmanager> pmViolateList(PageInfo pi, int pId){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("pmanagerMapper.pmViolateList", pId, rowBounds);
	}
	
	public int pmStop(int pId) {
		return sqlSession.update("pmanagerMapper.pmStop", pId);
	}
	
	public int pmrestart(int pId) {
		return sqlSession.update("pmanagerMapper.pmrestart", pId);
	}
	
	public Violate violateDetailView(int vNo) {
		return sqlSession.selectOne("violateMapper.violateDetail", vNo);
	}
	
	public ArrayList<Pmanager> approvalList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("pmanagerMapper.approvalList", null, rowBounds);
	}
	
	public int approval(int pId) {
		return sqlSession.update("pmanagerMapper.approval", pId);
	}
	
	public ArrayList<Pmanager> selectxList(PageInfo pi, String cName2){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("pmanagerMapper.selectxList", cName2, rowBounds);
	}
}
