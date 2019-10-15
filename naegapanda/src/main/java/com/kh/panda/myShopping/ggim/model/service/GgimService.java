package com.kh.panda.myShopping.ggim.model.service;

import java.util.ArrayList;

import com.kh.panda.common.PageInfo;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

public interface GgimService {
	
	int changeGgim(Ggim ggim, int flag);
	
	int getListCount(int mNo);
	
	ArrayList<Ggim> selectList(PageInfo pi, int mNo);
	
	ArrayList<Ggim> selectList(int mNo);
	
	int deleteGgim(Ggim ggim);

}
