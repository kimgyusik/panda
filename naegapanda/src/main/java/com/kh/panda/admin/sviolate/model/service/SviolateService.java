package com.kh.panda.admin.sviolate.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.admin.violate.model.vo.SearchCondition;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;

public interface SviolateService {

	int getAllListCount();
	
	int getAllListCount(SearchCondition sc);
	
	ArrayList<Sviolate> selectAllList(PageInfo pi);
	
	ArrayList<Sviolate> selectAllList(SearchCondition sc, PageInfo pi);
	
	int getPersonalListCount();
	
	ArrayList<Sviolate> selectPersonalList(PageInfo pi, int sNo);
	
	Violate violateDetail(int vNo);
	
	int sellerDelete(int sNo);
	

}
