package com.kh.panda.admin.violate.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.model.vo.PageInfo;

public interface ViolateService {

	
	// 1_1. 게시판 총 갯수 조회
	int getListCount();
	// 1_2. 게시판 리스트 조회
	ArrayList<Violate> selectList(PageInfo pi);
	
	
	
}
