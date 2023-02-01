package com.itwillbs.wms4.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.wms4.service.WarehouseService;
import com.itwillbs.wms4.vo.EmployeesVO;
import com.itwillbs.wms4.vo.WarehouseVO;

@Controller
public class WarehouseController {
	
	@Autowired
	private WarehouseService service;
	
	 // 창고 조회
	@GetMapping("/List.wh")
	public String inquiry() {
		return "warehouse/wh_list";
	}
	
	// 창고 등록
	@GetMapping("/Regist.wh")
	public String regist() {
		return "warehouse/wh_regist";
	}
	
	@PostMapping(value = "/RegistPro.wh")
	public String joinPro(@ModelAttribute WarehouseVO warehouse, Model model) {
		int insertCount = service.regist_wh(warehouse);
		
		// 가입 성공/실패에 따른 포워딩 작업 수행
		if(insertCount > 0) { // 성공
			System.out.println("컨트롤러 : " + warehouse);
			return "warehouse/wh_list";
		} else { // 실패
			model.addAttribute("msg", "가입 실패!");
			return "fail_back";
		}
		
	}
	
	// 창고코드 DB 존재여부
	@GetMapping("/CheckCode.wh")
	@ResponseBody
	public String checkId(String code) {
		int isCode = service.CheckCode(code);
		if(isCode > 0) {
			System.out.println("창고코드 조회 완료");
			return "true";
		} else {
			return "false";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
