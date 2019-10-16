package com.kh.panda.admin.violate.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.violate.model.dao.ViolateDao;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;

@Service("vService")
public class ViolateServiceImpl implements ViolateService{
	
	@Autowired
	private ViolateDao vDao;
	
	@Override
	public int getListCount() {

		return vDao.getListCount();
	}

	@Override
	public ArrayList<Violate> selectList(PageInfo pi) {
		 
		return vDao.selectList(pi);
	}

	@Override
	public int insertViolate(Violate v) {
		return vDao.insertViolate(v);
	}
	
	
	

}
