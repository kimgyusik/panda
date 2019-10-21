package com.kh.panda.admin.vmessage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.violate.model.dao.ViolateDao;
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
	public Vmessage vmessageDetail(int vmNo) {
		return vmDao.vmessageDetail(vmNo);
	}
	
	@Override
	public Vmessage vmessageSellerDetail(int vmNo, int sNo) {
		
		String check = vmDao.vmessageCheck(vmNo);
		int result = 0;
		
		if(check == null){
			result = vmDao.vmessageCheckDate(vmNo);
		}
		System.out.println("11111111111111111");
		System.out.println(check);
		System.out.println(result);
		
		if(result > 0) {
			return vmDao.vmessageDetail(vmNo);
		}else {
			return null;
		}
	}
	
	@Override
	public int insertVmessage(Vmessage vm) {
		int vNo = vm.getvNo();
		
		int result = vmDao.violateStatus(vNo);
		
		return vmDao.vmessageInsert(vm);
	}


	
}
