package com.kh.panda.admin.violate.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;

@Repository("vDao")
public class ViolateDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("violateMapper.getListCount");
	}
	
	public ArrayList<Violate> selectList(PageInfo pi){
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("violateMapper.selectList", null, rowBounds);
	}
	
	
	public int updateSellerCount(int sNo) {
		return sqlSession.update("violateMapper.updateSellerCount",sNo);
	}
	
	public int updateProductCount(int pId) {
		return sqlSession.update("violateMapper.updateProductCount",pId);
	}
	
	public int insertViolate(Violate v) {	
		return sqlSession.insert("violateMapper.insertViolate", v);
	}
	
	public Violate violateDetail(int vNo) {
		return sqlSession.selectOne("violateMapper.violateDetail", vNo);
	}
	
	public Violate selectInfo(int pId) {
		return sqlSession.selectOne("violateMapper.selectInfo",pId);
	}

	
}
