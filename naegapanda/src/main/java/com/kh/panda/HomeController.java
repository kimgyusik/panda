package com.kh.panda;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.panda.home.model.service.HomeService;
import com.kh.panda.home.model.vo.Home;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.myShopping.ggim.model.service.GgimService;
import com.kh.panda.myShopping.ggim.model.vo.Ggim;
import com.kh.panda.product.model.service.ProductService;
import com.kh.panda.product.model.vo.Product;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService hService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private GgimService ggService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
		public ModelAndView home(@RequestParam(name="category", required=false, defaultValue = "1000") int category, ModelAndView mv, Locale locale, Model model,HttpSession session) {
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			
			
			
			
			ArrayList<Product> HotTopList = pService.HotTopList(category);  	
			ArrayList<Product> Hot1List = pService.Hot1List();  	
			ArrayList<Product> Hot2List = pService.Hot2List();  	
			ArrayList<Product> Hot3List = pService.Hot3List();  	
			ArrayList<Product> Hot4List = pService.Hot4List();  	
			ArrayList<Product> Hot5List = pService.Hot5List();  	
			ArrayList<Product> Hot6List = pService.Hot6List();  	
			mv.addObject("HotTopList",HotTopList).addObject("Hot1List",Hot1List).addObject("Hot2List",Hot2List).addObject("Hot3List",Hot3List).addObject("Hot4List",Hot4List).addObject("Hot5List",Hot5List).addObject("Hot6List",Hot6List);
			
			
			
			ArrayList<Product> NewTopList = pService.NewTopList(category);
			ArrayList<Product> New1List = pService.New1List();
			ArrayList<Product> New2List = pService.New2List();
			ArrayList<Product> New3List = pService.New3List();
			ArrayList<Product> New4List = pService.New4List();
			ArrayList<Product> New5List = pService.New5List();
			ArrayList<Product> New6List = pService.New6List();
			ArrayList<Product> Newest = pService.Newest();
			
			// 로그인회원에 대한 찜리스트 반환
			ArrayList<Ggim> gglist = new ArrayList<>();
			
			Member m = (Member)session.getAttribute("loginUser");
		
			if(m != null) {
				gglist = ggService.selectGgimList(m.getmNo());
			}

			
			ArrayList<Product> LiveList = pService.LiveList();
			System.out.println(LiveList);
			mv.addObject("LiveList",LiveList);

			mv.addObject("Newest",Newest).addObject("NewTopList",NewTopList).addObject("gglist",gglist).addObject("New1List",New1List).addObject("New2List",New2List).addObject("New3List",New3List).addObject("New4List",New4List).addObject("New5List",New5List).addObject("New6List",New6List);

			ArrayList<Product> random = pService.random();
			
			mv.addObject("random",random);
			
			mv.setViewName("home");
			
			

			
			return mv;
	}
	
	
}
