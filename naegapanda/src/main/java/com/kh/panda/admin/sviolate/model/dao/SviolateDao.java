package com.kh.panda.admin.sviolate.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.admin.violate.model.vo.SearchCondition;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;

@Repository("svDao")
public class SviolateDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int getAllListCount() {
		return sqlSession.selectOne("sviolateMapper.getAllListCount");
	}
	
	public int getAllListCount(SearchCondition sc) {
		return sqlSession.selectOne("sviolateMapper.getScListCount",sc);
	}
	
	public ArrayList<Sviolate> selectAllList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("sviolateMapper.selectAllList", null, rowBounds);
	}
	
	public ArrayList<Sviolate> selectAllList(SearchCondition sc, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("sviolateMapper.selectScList", sc, rowBounds);
	}
	
	public int getSviolateListCount() {
		return sqlSession.selectOne("sviolateMapper.getPersonalListCount");
	}
	
	public ArrayList<Sviolate> selectPersonalList(PageInfo pi, int sNo){
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("sviolateMapper.selectPersonalList", sNo, rowBounds);
	}
	
	public Violate selectDetail(int vNo) {
		return sqlSession.selectOne("violateMapper.violateDetail", vNo);
	}
	
	public int sellerDelete(int sNo) {
		return sqlSession.update("sviolateMapper.sellerDelete",sNo);
	}
	
	
}
