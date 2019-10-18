package com.kh.panda.admin.board.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.panda.admin.board.qna.model.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qService;

}
