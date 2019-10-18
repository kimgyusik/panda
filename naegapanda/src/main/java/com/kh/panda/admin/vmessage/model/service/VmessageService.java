package com.kh.panda.admin.vmessage.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.vmessage.model.vo.Vmessage;
import com.kh.panda.common.PageInfo;

public interface VmessageService {
	
	int getListCount();
	
	ArrayList<Vmessage> selectList(PageInfo pi);

}
