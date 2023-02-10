package com.itwillbs.wms4.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PageController {
	
	@GetMapping(value = "/buttons")
	public String buttons() {
		return "pages/ui-features/buttons";
	}
	
	@GetMapping(value = "/dropdowns")
	public String dropdowns() {
		return "pages/ui-features/dropdowns";
	}
	
	@GetMapping(value = "/typography")
	public String typography() {
		return "pages/ui-features/typography";
	}
	
	@GetMapping(value = "/mdi")
	public String mdi() {
		return "pages/icons/mdi";
	}
	
	@GetMapping(value = "/basic_elements")
	public String basic_elements() {
		return "pages/forms/basic_elements";
	}
	
	@GetMapping(value = "/charts")
	public String charts() {
		return "pages/charts/charts";
	}
	
	@GetMapping(value = "/basic-table")
	public String basictable() {
		return "pages/tables/basic-table";
	}
	
	@GetMapping(value = "/MainInsertList")
	public String mainlistPage(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // login O
				
			return "insert_list_page";
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		} // ~~~~ if-else end~~~~
		
	}
	@GetMapping(value = "/MainWMSList")
	public String mainwmspage(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // login O
			
			return "wms_list_page";
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		} // ~~~~ if-else end~~~~
		
	}



}
