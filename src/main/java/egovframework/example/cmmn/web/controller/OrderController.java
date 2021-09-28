package egovframework.example.cmmn.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import egovframework.example.cmmn.web.mapper.MemberMapper;
import egovframework.example.cmmn.web.mapper.ProductMapper;

@Controller
public class OrderController {
	
	private IamportClient api;
	
	public OrderController() {
	this.api = new IamportClient("5298144876096746","9d3903ea8bd2cb48d85013cfe98820dca5d3fd255e3048a8e2ec059b552bb57738acec50cd86f782");
	}
	@Resource
	ProductMapper productmapper;
	@Resource
	MemberMapper mambermapper;
	
	@RequestMapping(value="/ordersheetview.do")
	public String orderSheetView(@RequestParam HashMap<String, Object> map, Model model, HttpSession session, HttpServletRequest request) {
		
		//HttpSession httpSession = request.getSession();
		HashMap<String, Object> user = new HashMap<String, Object>();
		user.put("user_id", (String)request.getSession().getAttribute("user"));
		System.out.println("login = " + (String)request.getSession().getAttribute("user"));
		System.out.println("user = " + mambermapper.userInfo(user));
		
		user = mambermapper.userInfo(user);
		
		
		List<HashMap<String, Object>> list = productmapper.buyList(map);
		System.out.println("list.get(0) = " + list.get(0));
		System.out.println("list.get(0).get(\"prd_price\") = " + list.get(0).get("prd_price"));
		
		user.put("totalprice", list.get(0).get("prd_price"));
		
		model.addAttribute("buyList", list);
		model.addAttribute("userInfo", user);
		return "order/OrderSheet";
	}
	
	@RequestMapping(value="/ordersheet.do", method=RequestMethod.POST)
	public String pay(@RequestParam HashMap<String, Object> map, Model model) {
	
		model.addAttribute("name", map.get("name"));
//		model.addAttribute("name", "abc");
		System.out.println("totalprice = " + map.get("totalprice"));
		model.addAttribute("totalprice", map.get("totalprice"));
//		
//		System.out.println("map = " + map);
//		System.out.println("name = " + map.get("name"));
		
		System.out.println("return");
		return "forward:/payview.do";
	}
	
	@RequestMapping(value="/payview.do")
	public String payView() {
		return "order/Pay";
	}
	
	@RequestMapping(value="/paysuccess.do")
	public String paySuccessView() {
	
		return "order/PaySuccess";
	}

	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
}
