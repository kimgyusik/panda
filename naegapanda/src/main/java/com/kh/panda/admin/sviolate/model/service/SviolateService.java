package com.kh.panda.admin.sviolate.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.sviolate.model.vo.Sviolate;
import com.kh.panda.common.PageInfo;
import com.kh.panda.seller.model.vo.Seller;

public interface SviolateService {

	int getListCount();
	
	ArrayList<Sviolate> selectList(PageInfo pi);
}
