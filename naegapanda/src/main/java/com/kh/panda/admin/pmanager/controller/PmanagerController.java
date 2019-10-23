package com.kh.panda.admin.pmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.panda.admin.pmanager.model.service.PmanagerService;

@Controller
public class PmanagerController {

	@Autowired
	private PmanagerService pService;
	
	@RequestMapping("categoryView.do")
	public String categoryView() {
		return "admin/pmanager/categoryViewForm";
	}
}
