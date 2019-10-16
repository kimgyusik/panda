package com.kh.panda.myShopping.ggim.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.common.PageInfo;
import com.kh.panda.myShopping.ggim.model.dao.GgimDao;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Service("gService")
public class GgimServiceImpl implements GgimService{
	
	@Autowired
	private GgimDao gDao;
	
	@Override
	public int getListCount(int mNo) {
		return gDao.getListCount(mNo);
	}

	@Override
	public ArrayList<Ggim> selectGgimList(PageInfo pi, int mNo) {
		return gDao.selectGgimList(pi, mNo);
	}
	
	@Override
	public ArrayList<Ggim> selectGgimList(int mNo) {
		return gDao.selectGgimList(mNo);
	}

	@Override
	public int changeGgim(Ggim ggim, int flag) {
		
		if(flag == 0) {
			return gDao.addGgim(ggim);
		}else {
			return gDao.deleteGgim(ggim);
		}
		
	}
	
	@Override
	public int deleteGgim(Ggim ggim) {
		return gDao.deleteGgim(ggim);
	}

	

}
