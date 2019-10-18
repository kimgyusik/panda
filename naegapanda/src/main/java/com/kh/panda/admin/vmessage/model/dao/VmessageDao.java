package com.kh.panda.admin.vmessage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;

@Repository("vmDao")
public class VmessageDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public int getListCount() {
		return sqlsession.selectOne("vmessageMapper.getListCount");
	}
	
	public ArrayList<Vmessage> selectList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlsession.selectList("vmessageMapper.selectList", null, rowBounds);
	}
}
