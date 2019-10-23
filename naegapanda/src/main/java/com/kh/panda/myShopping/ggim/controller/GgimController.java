package com.kh.panda.myShopping.ggim.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.ggim.model.service.GgimService;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;

@Controller
public class GgimController {
	
	@Autowired
	private GgimService ggService;
	
	private int getmNo(HttpSession session) {
		return ((Member)session.getAttribute("loginUser")).getmNo();
	}
	
	// 내 찜 리스트 조회
	@RequestMapping("ggimList.gg")
	public ModelAndView selectGgimList(ModelAndView mv, HttpSession session/*, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage*/) {
		
//		int listCount = gService.getListCount(getmNo(session));
//		PageInfo pi = Pagination.getPageInfo(listCount, currentPage);
//		ArrayList<Ggim> list = gService.selectList(pi, getmNo(session));
//		mv.addObject("pi", pi);
		
		
		//ArrayList<Ggim> list = ggService.selectGgimList(getmNo(session)); 결과 처리 size 0이상 조건 넣어야함
		ArrayList<Ggim> list = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		//sdf.format(date);
			
		list.add(new Ggim(1, 2, "좋은상품11111111111111", 20001, "소분류11", "대분류1", "이지몰", date));
		list.add(new Ggim(2, 4, "좋은상품22222222222", 11233, "소분류22222222", "대분류22", "슈퍼몰", date));
		list.add(new Ggim(3, 64, "좋은상품333333333333", 244, "소분류3333333", "대분류333", "또와", date));
		list.add(new Ggim(5, 44, "좋은상품244444444", 14444, "소분류444", "대분류22", "이마트", date));

		
		ArrayList<String> category = new ArrayList<>();
		
		for(Ggim g : list) {
			category.add(g.getCategory2());
		}
		
		for (int i =0; i < category.size(); i++) {
            for (int j =0; j < category.size(); j++) {
                if (i == j) {
                }else if (category.get(j).equals(category.get(i))) {
                	category.remove(j);
                }
            }
        }
		
		// 이미지 가져와야함
		
		mv.addObject("category", category);
		mv.addObject("list", list);
		mv.setViewName("myShopping/ggim/ggimList");
		
		return mv;
	}
	
	// 찜하기/취소 토글 처리
	@ResponseBody
	@RequestMapping(value="changeGgim.gg")
	public String changeGgim(int pId, int flag, HttpSession session /*, HttpServletResponse response*/) throws IOException {
		
		// flag 0이나 1로 넘길건지 선택해야함
		
		Ggim ggim = new Ggim();
		ggim.setmNo(getmNo(session));
		ggim.setpId(pId);
		
		int result = ggService.changeGgim(ggim, flag);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 찜 취소 처리
	@RequestMapping("deleteGgim.gg") // ajax로 처리하려면 리턴 void로 
	public String deleteGgim(int pId, HttpServletRequest request, HttpSession session) {
		
		Ggim ggim = new Ggim();
		ggim.setmNo(getmNo(session));
		ggim.setpId(pId);
		
		int result = ggService.deleteGgim(ggim);
		
		if(result > 0) {
			return "redirect:ggimList.gg";
		}else {
			return "common/errorPage"; // 에러페이지 설정
		}
	}
	
	// 찜 추가
	@RequestMapping("addGgim.gg") // ajax로 처리하려면 리턴 void로 
	public String addGgim(int pId, HttpServletRequest request, HttpSession session) {
		
		Ggim ggim = new Ggim();
		ggim.setmNo(getmNo(session));
		ggim.setpId(pId);
		
		int result = ggService.addGgim(ggim);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 찜 갯수(메인메뉴바)
	@RequestMapping("currentGgim.gg")
	public void currentGgim(HttpServletResponse response) throws JsonIOException, IOException {
		
		int count = 22;
		
		//int count = ggService.getListCount(getmNo(session));
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(count, response.getWriter());
		
	}

}
