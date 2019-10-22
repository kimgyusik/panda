package com.kh.panda.myShopping.ggim.model.service;

import java.util.ArrayList;

import com.kh.panda.common.PageInfo;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

public interface GgimService {
	
	// 찜 추가/삭제 토글
	int changeGgim(Ggim ggim, int flag);
	
	// 찜 갯수(메인메뉴바), 페이징 처리 시 필요
	int getListCount(int mNo);
	
	// 내 찜 리스트(페이징 처리)
	ArrayList<Ggim> selectGgimList(PageInfo pi, int mNo);
	
	// 내 찜 리스트(페이징 x)
	ArrayList<Ggim> selectGgimList(int mNo);
	
	// 찜 삭제
	int deleteGgim(Ggim ggim);
	
	// 찜 추가
	int addGgim(Ggim ggim);
	

}
