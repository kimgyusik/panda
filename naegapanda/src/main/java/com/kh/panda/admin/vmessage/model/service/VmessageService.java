package com.kh.panda.admin.vmessage.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;

public interface VmessageService {
	
	int getListCount();
	int getSellerListCount(int sNo);
	
	ArrayList<Vmessage> selectList(PageInfo pi);
	ArrayList<Vmessage> selectSellerList(PageInfo pi,int sNo);
	
	
	Vmessage vmessageDetail(int vmNo);
	Vmessage vmessageSellerDetail(int vmNo, int sNo);
	
	int insertVmessage(Vmessage vm);

}
