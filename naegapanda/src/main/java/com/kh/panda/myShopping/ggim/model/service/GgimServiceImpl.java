package com.kh.panda.myShopping.ggim.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.common.PageInfo;
import com.kh.panda.myShopping.ggim.model.dao.GgimDao;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Service("ggService")
public class GgimServiceImpl implements GgimService{
	
	@Autowired
	private GgimDao ggDao;
	
	@Override
	public int getListCount(int mNo) {
		return ggDao.getListCount(mNo);
	}

	@Override
	public ArrayList<Ggim> selectGgimList(PageInfo pi, int mNo) {
		return ggDao.selectGgimList(pi, mNo);
	}
	
	@Override
	public ArrayList<Ggim> selectGgimList(int mNo) {
		return ggDao.selectGgimList(mNo);
	}

	@Override
	public int changeGgim(Ggim ggim, int flag) {
		
		if(flag == 0) {
			return ggDao.deleteGgim(ggim);
		}else {
			return ggDao.addGgim(ggim);
		}
		
	}
	
	@Override
	public int deleteGgim(Ggim ggim) {
		return ggDao.deleteGgim(ggim);
	}

	@Override
	public int addGgim(Ggim ggim) {
		
		int count = ggDao.selectGgim(ggim);
		
		if(count > 0) {
			return ggDao.addGgim(ggim);
		}
		
		return 0;
	}


	

}
