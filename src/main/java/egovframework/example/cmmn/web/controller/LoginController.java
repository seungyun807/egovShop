package egovframework.example.cmmn.web.controller;

import java.awt.List;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.cmmn.web.mapper.MemberMapper;
import egovframework.example.cmmn.web.mapper.ProductMapper;
import egovframework.example.cmmn.web.service.MemberDAO;


@Controller
public class LoginController {
	
	MemberDAO member = new MemberDAO();
	@Resource
	MemberMapper membermapper;

	@RequestMapping(value="/loginview.do")
	public String login() throws Exception {
		return "member/Login";
	}
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginHome(@RequestParam HashMap<String, Object> params, HttpSession session, Model model) throws Exception {

		//String name = member.loginCheck((String)params.get("id"), (String)params.get("password"));
		
		Map<String, String> map = new HashMap<String, String>();
		
		//map.put("userId", params.get("id").toString());
		
		int result = membermapper.loginCheck(params);
		String user_id = params.get("user_id").toString();
		System.out.println("result = " + result);
		model.addAttribute("map", map);
			
		if(result != 0) {
					  session.setAttribute("user", user_id);
					  map.put("userName", user_id);
					  map.put("msg", "success");
					  
			      } else {
			    	  System.out.println("아이디 또는 비밀번호가 일치하지 않습니다.");
			    	  map.put("msg", "failure");
			    	  return "forward:/loginview.do";
			      }
		System.out.println("result = "+result);
		return "redirect:/homeview.do";
		
	}
	
	
	@RequestMapping(value="/joinview.do")
	public String JoinView() throws Exception {
		return "member/Join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String Join(@RequestParam HashMap<String, Object> params, ModelMap model) throws Exception {
		System.out.println("join.do");
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFromat = new SimpleDateFormat(pattern);
		String date = simpleDateFromat.format(new Date(System.currentTimeMillis()));
		
		params.put("cs", null);
		params.put("regist", date);
		
		membermapper.UserJoin(params);
		
		System.out.println(params);
		
		model.addAttribute("joinmsg", "success");
		System.out.println(model.get("joinmsg"));
	
		return "forward:/joinview.do";
	}
	
	

	@RequestMapping(value="/idcheck.do")
	@ResponseBody
	public Map<String, Object> JoinIdCheck(@RequestParam Map<String, Object> commandMap) throws Exception {
		
		System.out.println("idcheck.do");

		//ModelAndView modelAndView = new ModelAndView();
		//modelAndView.setViewName("jsonView");
		int result = membermapper.UserIdCheck((String) commandMap.get("checkId"));
		System.out.println("result = " + result);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usedCnt", result);
		
		//modelAndView.addObject("usedCnt", result);
		
		//System.out.println(map.get("cnt"));
		return map;
	}
	
	
}
