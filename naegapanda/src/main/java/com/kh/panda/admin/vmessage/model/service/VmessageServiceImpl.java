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
	public int getscListCount(String keyword) {
		return vmDao.getscListCount(keyword);
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
	public ArrayList<Vmessage> selectscList(PageInfo pi, String keyword) {
		return vmDao.selectscList(pi,keyword);
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
		
		String check = vmDao.vmessageCheck(vmNo,sNo);
		
		
		if(check == null){
			int result = vmDao.vmessageCheckDate(vmNo);
		}
		
		
			return vmDao.vmessageDetail(vmNo);
		
	}
	
	@Override
	public int insertVmessage(Vmessage vm) {
		int vNo = vm.getvNo();
		
		int result = vmDao.violateStatus(vNo);
		
		return vmDao.vmessageInsert(vm);
	}
	
	@Override
	public int vmessageStautsY(Vmessage vm) {
		return vmDao.vmessageStatusY(vm);
	}
	@Override
	public int vmessageStautsN(Vmessage vm) {
		return vmDao.vmessageStatusN(vm);
	}
	@Override
	public int vmessageOkY(Vmessage vm) {
		return vmDao.vmessageOkY(vm);
	}


	
}
