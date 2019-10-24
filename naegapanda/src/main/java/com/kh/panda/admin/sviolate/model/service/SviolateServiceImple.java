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
	public int getListCount() {
		return svDao.getListCount();
	}
	
	@Override
	public int getSviolateListCount() {
		return svDao.getSviolateListCount();
	}

	@Override
	public ArrayList<Sviolate> selectList(PageInfo pi) {
		return svDao.selectSviolateList(pi);
	}
	
}
