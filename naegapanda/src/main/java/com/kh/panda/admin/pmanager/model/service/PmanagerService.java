package com.kh.panda.admin.pmanager.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.panda.admin.pmanager.model.vo.Pmanager;
import com.kh.panda.admin.violate.model.vo.Violate;
import com.kh.panda.common.PageInfo;

@Service
public interface PmanagerService {
	
	// 리스트 총 갯수 조회
	int getListCount();
	// 리스트 조회
	ArrayList<Pmanager> selectList(PageInfo pi, String cName2);
	// 리스트(판매중지) 조회
	ArrayList<Pmanager> selectxList(PageInfo pi, String cName2);
	
	// 신고 리스트 조회
	ArrayList<Pmanager> pmViolateList(PageInfo pi, int pId);
	
	// 판매중지
	int pmStop(int pId);
	
	// 판매재개
	int pmrestart(int pId);
	
	// 신고 디테일 뷰
	Violate violateDetailView(int vNo);
	
	// 판매승인 리스트 조회
	ArrayList<Pmanager> approvalList(PageInfo pi);
	
	// 판매승인 
	int approval(int pId);
	
}
