package com.kh.panda.admin.sviolate.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.sviolate.model.dao.SviolateDao;
import com.kh.panda.admin.sviolate.model.vo.Sviolate;
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
	public int getPersonalListCount() {
		return svDao.getSviolateListCount();
	}

	@Override
	public ArrayList<Sviolate> selectPersonalList(PageInfo pi, int sNo) {
		return svDao.selectPersonalList(pi, sNo);
	}
	
}
