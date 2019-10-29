package com.kh.panda;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
		public ModelAndView home(@RequestParam(name="category", required=false, defaultValue = "1000") int category, ModelAndView mv, Locale locale, Model model) {
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			ArrayList<Product> HotTopList = pService.HotTopList(category);
			ArrayList<Product> NewTopList = pService.NewTopList(category);
			ArrayList<Product> Newest = pService.Newest();

			mv.addObject("HotTopList",HotTopList).addObject("NewTopList",NewTopList).addObject("Newest",Newest).setViewName("home");
			
			return mv;
	}
	
	
}
