package egovframework.example.cmmn.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.platform.commons.logging.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cmmn.web.mapper.ProductMapper;
import egovframework.example.cmmn.web.service.ProductDAO;

@Controller
public class HomeController {
	
	ProductDAO productdao = new ProductDAO();
	
	  @Resource
	   ProductMapper productmapper;

	  
	@RequestMapping("/homeview.do")
	public String viewHome(Model model) throws Exception {
		
		System.out.println("viewHome");
		
		List<Map<String, String>> list= productmapper.selectallproduct();
		Map<String, String> map = new HashMap<String, String>();
		


		model.addAttribute("map", map);
		model.addAttribute("productList", list);
		return "member/Home";
	}
	
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}


}