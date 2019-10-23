package com.kh.panda.admin.sviolate.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.common.PageInfo;

public interface SviolateService {

	int getListCount();
	
	int getSviolateListCount();
	
	ArrayList<Sviolate> selectList(PageInfo pi);

}
