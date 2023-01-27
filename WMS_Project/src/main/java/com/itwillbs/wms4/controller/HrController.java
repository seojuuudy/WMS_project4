package com.itwillbs.wms4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.wms4.service.HrService;

@Controller
public class HrController {
	
	@Autowired
	private HrService service;
	
	@GetMapping(value = "/Detail.hr")
	public String hrDetail() {
		return "hr/employee_detail";
	}
	
	@GetMapping(value = "/List.hr")
	public String hrList() {
		return "hr/employee_list";
	}
	
	@GetMapping(value = "/Regist.hr")
	public String hrRegist() {
		return "hr/employee_regist";
	}

}
