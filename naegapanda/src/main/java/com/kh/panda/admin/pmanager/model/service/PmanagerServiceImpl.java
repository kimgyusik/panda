package com.kh.panda.admin.pmanager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.pmanager.model.dao.PmanagerDao;

@Service("pService")
public class PmanagerServiceImpl implements PmanagerService{

	@Autowired
	private PmanagerDao pDao;
}
