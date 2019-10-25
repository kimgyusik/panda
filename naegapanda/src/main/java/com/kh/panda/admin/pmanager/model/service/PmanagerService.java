package com.kh.panda.admin.pmanager.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.panda.admin.pmanager.model.vo.Pmanager;
import com.kh.panda.common.PageInfo;

@Service
public interface PmanagerService {
	
	int getListCount();
	
	ArrayList<Pmanager> selectList(PageInfo pi, String cName2);
	
}
