package com.kh.panda.admin.sviolate.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.common.PageInfo;

public interface SviolateService {

	int getAllListCount();
	
	ArrayList<Sviolate> selectAllList(PageInfo pi);
	
	int getPersonalListCount();
	
	ArrayList<Sviolate> selectPersonalList(PageInfo pi, int sNo);

}
