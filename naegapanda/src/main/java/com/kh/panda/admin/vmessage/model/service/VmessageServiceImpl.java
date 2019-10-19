package com.kh.panda.admin.vmessage.model.service;

import java.sql.Date;
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
	public int getSellerListCount(int sNo) {
		return vmDao.getSellerListCount(sNo);
	}

	@Override
	public ArrayList<Vmessage> selectList(PageInfo pi) {
		return vmDao.selectList(pi);
	}
	@Override
	public ArrayList<Vmessage> selectSellerList(PageInfo pi, int sNo) {
		return vmDao.selectSellerList(pi,sNo);
	}

	@Override
	public Vmessage vmessageDetail(int vmNo, int sNo) {
		
		if(sNo > 0) {
			String check = vmDao.vmessageCheck(vmNo);
			
				if(check == null){
					int date = vmDao.vmessageCheckDate(vmNo);
				}
				
		}
			return vmDao.vmessageDetail(vmNo);
		
	}


	
}
