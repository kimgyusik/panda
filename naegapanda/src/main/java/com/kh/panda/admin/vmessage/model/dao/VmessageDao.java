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
	public int getSellerListCount(int sNo) {
		return sqlsession.selectOne("vmessageMapper.getSellerListCount",sNo);
	}
	
	
	
	public ArrayList<Vmessage> selectList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlsession.selectList("vmessageMapper.selectList", null, rowBounds);
	}
	public ArrayList<Vmessage> selectSellerList(PageInfo pi, int sNo){
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlsession.selectList("vmessageMapper.selectSellerList", sNo, rowBounds);
	}
	
	
	
	
	public String vmessageCheck(int vmNo) {
		return sqlsession.selectOne("vmessageMapper.vmessageCheck",vmNo);
	}
	
	public int vmessageCheckDate(int vmNo) {
		return sqlsession.update("vmessageMapper.vmessageCheckDate", vmNo);
	}
	
	
	public Vmessage vmessageDetail(int vmNo) {
		return sqlsession.selectOne("vmessageMapper.vmessageDetail",vmNo);
	}
	
	public int vmessageInsert(Vmessage vm){
		return sqlsession.insert("vmessageMapper.vmessageInsert",vm);
	}
	
	public int violateStatus(int vNo) {
		return sqlsession.insert("vmessageMapper.violateStatus",vNo);
	}
	
	public int vmessageStatusY(Vmessage vm) {
		return sqlsession.insert("vmessageMapper.vmessageStatusY",vm);
	}
	
	public int vmessageStatusN(Vmessage vm) {
		return sqlsession.insert("vmessageMapper.vmessageStatusY",vm);
	}
	
	public int vmessageOkY(Vmessage vm) {
		return sqlsession.insert("vmessageMapper.vmessageStatusY",vm);
	}
}
