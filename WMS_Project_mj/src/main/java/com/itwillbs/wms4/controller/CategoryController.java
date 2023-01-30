package com.itwillbs.wms4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itwillbs.wms4.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
}
