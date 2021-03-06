package com.kh.panda.admin.violate.model.service;

import java.util.ArrayList;

import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;

public interface ViolateService {

	
	// 게시판 총 갯수 조회
	int getListCount();
	
	// 게시판 리스트 조회
	ArrayList<Violate> selectList(PageInfo pi);
	
	// 게시판 작성
	int insertViolate(Violate v);
	
	// 게시판 상세 보기
	Violate violateDetail(int vNo);
	
	// 상품 정보
	Violate selectInfo(int pId);
	
}
