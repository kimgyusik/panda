package com.kh.panda.home.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.panda.home.model.service.HomeService;
import com.kh.panda.home.model.vo.Home;

@Controller
public class HomeControllerTest {

	@Autowired
	private HomeService hService;
	
	@RequestMapping("HotTopList.do")
	public void HotTopList(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Home> list = hService.selectHotTopList();
		
		response.setContentType("application/json; charset=utf-8");
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
		
	}
	
	
	/* @RequestMapping("") */
	
	
}
