package com.itwillbs.wms4.controller;

import java.io.IOException;
import java.util.List;

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
import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.EmployeesVO;
import com.itwillbs.wms4.vo.PageInfo;
import com.itwillbs.wms4.vo.WarehouseVO;

@Controller
public class WarehouseController {
	
	@Autowired
	private WarehouseService service;
	
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
	
	// 창고 목록
	@GetMapping(value = "/List.wh")
	public String WarehouseList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model) {
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		List<WarehouseVO> warehouseList = service.getWhList(searchType, keyword, startRow, listLimit);
		// 페이징 처리
		int listCount = service.getBoardListCount(searchType, keyword);
				System.out.println("총 게시물 수 : " + listCount);
		
		int pageListLimit = 10;
		
		int maxPage = listCount / listLimit 
						+ (listCount % listLimit == 0 ? 0 : 1); 
		
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// ---------------------------------------------------------------------------
		// 조회 결과를 Model 객체에 "client" 속성명으로 저장
		model.addAttribute("warehouseList", warehouseList);
		model.addAttribute("pageInfo", pageInfo);
		
		System.out.println("warehouseList " + warehouseList);
		
		return "warehouse/wh_list";
	}
	
	// 창고 상세정보
	@GetMapping(value = "/WhDetail.wh")
	public String clientDetail(
			@RequestParam(defaultValue = "") String wh_cd, 
			@RequestParam(defaultValue = "") String wh_name, 
			Model model
			) {
		WarehouseVO wh = service.getWarehouse(wh_cd, wh_name);
		
		model.addAttribute("wh", wh);
		return "warehouse/wh_list_detail";
	}
	
	@PostMapping("/WhModify.wh")
	public String warehouseModify() {
		
		return "warehouse/wh_modify";
	}
	
	// 창고 삭제
	@PostMapping(value = "/WhDelete.wh")
	public String whDelete() {
		
		return "warehouse/wh_delete";
	}
	
	
	
	
	
	
	
	
	
	
	
}
