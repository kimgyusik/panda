package com.kh.panda.admin.vmessage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.vmessage.model.dao.VmessageDao;
import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;

@Service("vmService")
public class VmessageServiceImpl implements VmessageService{

	@Autowired
	private VmessageDao vmDao;

	@Override
	public int getListCount() {
		return vmDao.getListCount();
	}

	@Override
	public ArrayList<Vmessage> selectList(PageInfo pi) {
		return vmDao.selectList(pi);
	}
	
}
