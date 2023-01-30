package com.itwillbs.wms4.controller;

import org.springframework.stereotype.Controller;
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
}
