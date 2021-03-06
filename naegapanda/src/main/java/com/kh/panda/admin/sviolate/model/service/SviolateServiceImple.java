package com.kh.panda.admin.sviolate.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.sviolate.model.dao.SviolateDao;
import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.admin.violate.model.vo.SearchCondition;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;

@Service("svService")
public class SviolateServiceImple implements SviolateService{

	@Autowired
	private SviolateDao svDao;

	@Override
	public int getAllListCount() {
		return svDao.getAllListCount();
	}

	@Override
	public ArrayList<Sviolate> selectAllList(PageInfo pi) {
		return svDao.selectAllList(pi);
	}
	
	@Override
	public int getPersonalListCount(int sNo) {
		return svDao.getPersonalListCount(sNo);
	}

	@Override
	public ArrayList<Sviolate> selectPersonalList(PageInfo pi, int sNo) {
		return svDao.selectPersonalList(pi, sNo);
	}

	@Override
	public Violate violateDetail(int vNo) {
		return svDao.selectDetail(vNo);
	}

	@Override
	public int sellerDelete(int sNo) {
		return svDao.sellerDelete(sNo);
	}
	@Override
	public int sellerPermission(int sNo) {
		return svDao.sellerPermission(sNo);
	}

	@Override
	public int getAllListCount(SearchCondition sc) {
		return svDao.getAllListCount(sc);
	}

	@Override
	public ArrayList<Sviolate> selectAllList(SearchCondition sc, PageInfo pi) {
		return svDao.selectAllList(sc, pi);
	}
	
}
