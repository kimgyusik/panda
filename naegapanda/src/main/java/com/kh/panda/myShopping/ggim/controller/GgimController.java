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
		//return ((Member)session.getAttribute("loginUser")).getmNo();
		return 2;
	}
	
	// 내 찜 리스트 조회
	@RequestMapping("ggimList.gg")
	public ModelAndView selectGgimList(ModelAndView mv, HttpSession session/*, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage*/) {
		
//		int listCount = gService.getListCount(getmNo(session));
//		PageInfo pi = Pagination.getPageInfo(listCount, currentPage);
//		ArrayList<Ggim> list = gService.selectList(pi, getmNo(session));
//		mv.addObject("pi", pi);
		
		
		ArrayList<Ggim> list = ggService.selectGgimList(getmNo(session));
		
//		ArrayList<Ggim> list = new ArrayList<>();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date();
//			
//		list.add(new Ggim(1, 2, "좋은상품11111111111111", 20001, "df", "의류/잡화", "이지몰", date, "blog_5.jpg"));
//		list.add(new Ggim(2, 4, "좋은상품22222222222", 11233, "소분류22/222222", "대분류/22", "슈퍼몰", date, "best_6.png"));
//		list.add(new Ggim(3, 64, "좋은상품333333333333", 244, "소분류33|33333", "대분류3|33", "또와", date, "blog_4.jpg"));
//		list.add(new Ggim(5, 44, "좋은상품244444444", 14444, "소분류|444", "대분류2|2", "이마트", date, "blog_9.jpg"));

		
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
	public void currentGgim(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {

		int count = ggService.getListCount(getmNo(session));
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(count, response.getWriter());
		
	}

}
