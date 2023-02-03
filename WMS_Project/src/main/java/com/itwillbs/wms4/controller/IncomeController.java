package com.itwillbs.wms4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itwillbs.wms4.service.IncomeService;

@Controller
public class IncomeController {
	
	@Autowired
	private IncomeService service;
}
