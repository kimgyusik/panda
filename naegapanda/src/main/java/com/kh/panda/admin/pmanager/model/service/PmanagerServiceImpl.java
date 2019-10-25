package com.kh.panda.admin.pmanager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.pmanager.model.dao.PmanagerDao;
import com.kh.panda.admin.pmanager.model.vo.Pmanager;
import com.kh.panda.common.PageInfo;

@Service("pmService")
public class PmanagerServiceImpl implements PmanagerService{

	@Autowired
	private PmanagerDao pmDao;

	@Override
	public int getListCount() {
		return pmDao.getListCount();
	}

	@Override
	public ArrayList<Pmanager> selectList(PageInfo pi, String cName2) {
		return pmDao.selectList(pi, cName2);
	}
}
