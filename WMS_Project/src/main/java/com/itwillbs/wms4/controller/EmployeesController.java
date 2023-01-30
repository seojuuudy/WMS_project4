package com.itwillbs.wms4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itwillbs.wms4.service.EmployeesService;

@Controller
public class EmployeesController {
	
	@Autowired
	private EmployeesService service;
}
