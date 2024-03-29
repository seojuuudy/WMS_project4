package com.itwillbs.wms4.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.wms4.service.OutcomeService;
import com.itwillbs.wms4.vo.Out_schedule_per_productVO;
import com.itwillbs.wms4.vo.PageInfo;

@Controller
public class OutcomeController {

	@Autowired
	private OutcomeService service;
	
	// 출고예정항목리스트
	@GetMapping(value = "/OutScheduleProductList.out")
	public String WarehouseList(
	@RequestParam(defaultValue = "") String searchType,
	@RequestParam(defaultValue = "") String keyword,
	@RequestParam(defaultValue = "1") int pageNum,
	Model model,
	HttpSession session) {
		// 페이징 처리를 위한 변수 선언
		int listLimit = 11; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		List<Out_schedule_per_productVO> outList = service.getOutList(searchType, keyword, startRow, listLimit);
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
		if(pageNum > endPage) {
		    pageNum = endPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// ---------------------------------------------------------------------------
		model.addAttribute("outList", outList);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println("outList" + outList);
		return "out_schedule/out_schedule_product_list";
	}
	
	// 한시적 출고 수정폼 요청
	@GetMapping("/OutModify.out")
	public String outModify(String out_schedule_cd, int product_cd, Model model) {
			List<Out_schedule_per_productVO> outModify = service.getOutModify(out_schedule_cd, product_cd);
			model.addAttribute("outModify", outModify);
			System.out.println(outModify);
			return "out_schedule/out_detail_modify";
	}
	
	// 입고 예정 항목 수정 비즈니스 작업 
	@ResponseBody
	@PostMapping(value = "/OutUpdatePro.out")
	public int OutUpdatePro(
			 @ModelAttribute Out_schedule_per_productVO outProductVO, 
			 @RequestParam Date out_date, 
			 @RequestParam int out_schedule_qty, 
			 @RequestParam String out_schedule_cd,
			@RequestParam String remarks) {
		
		 System.out.println("out_date: " + out_date);
		 System.out.println("out_schedule_qty: " + out_schedule_qty);
		 System.out.println("remarks: " + remarks);
		 System.out.println("out_schedule_cd: " + out_schedule_cd);
		
		 int updateCount = service.OutUpdate(
		 		outProductVO, 
		 		out_date, 
		 		out_schedule_qty, 
		 		out_schedule_cd, 
		 		remarks);
		
		 return updateCount;
	}
}
