package com.kh.panda.admin.pmanager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.pmanager.model.dao.PmanagerDao;
import com.kh.panda.admin.pmanager.model.vo.Pmanager;
import com.kh.panda.admin.violate.model.vo.Violate;
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
	public int getListCount1() {
		return pmDao.getListCount1();
	}
	
	@Override
	public int getListCount2() {
		return pmDao.getListCount2();
	}

	
	@Override
	public int getListCount3() {
		return pmDao.getListCount3();
	}

	@Override
	public ArrayList<Pmanager> selectList(PageInfo pi, String cName2) {
		return pmDao.selectList(pi, cName2);
	}

	@Override
	public ArrayList<Pmanager> pmViolateList(PageInfo pi, int pId) {
		return pmDao.pmViolateList(pi, pId);
	}

	@Override
	public int pmStop(int pId) {
		return pmDao.pmStop(pId);
	}

	@Override
	public Violate violateDetailView(int vNo) {
		return pmDao.violateDetailView(vNo);
	}

	@Override
	public ArrayList<Pmanager> approvalList(PageInfo pi) {
		return pmDao.approvalList(pi);
	}

	@Override
	public int approval(int pId) {
		return pmDao.approval(pId);
	}

	@Override
	public ArrayList<Pmanager> selectxList(PageInfo pi2, String cName2) {
		return pmDao.selectxList(pi2, cName2);
	}

	@Override
	public int pmrestart(int pId) {
		return pmDao.pmrestart(pId);
	}


	


	
}
