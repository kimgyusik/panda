package com.kh.panda.websocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chatController {
	
	@RequestMapping("chatMain.do")
	public String ChatMain() {
		return "chat/chatMain"; 
	}

}
