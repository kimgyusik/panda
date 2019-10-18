package com.kh.panda.admin.board.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.board.notice.model.vo.Notice;
import com.kh.panda.common.PageInfo;

@Repository("nDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}
	
	public ArrayList<Notice> selectList(PageInfo pi){
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int updateCount(int nId) {
		return sqlSession.update("noticeMapper.updateCount", nId);
	}
	
	public Notice noticeDetail(int nId) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nId);
	}
	
	public int deleteNotice(int nId) {
		return sqlSession.update("noticeMapper.deleteNotice", nId);
	}
	
	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
}
