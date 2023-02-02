package com.itwillbs.wms4.controller;

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

import com.itwillbs.wms4.service.WarehouseService;
import com.itwillbs.wms4.vo.EmployeesVO;
import com.itwillbs.wms4.vo.PageInfo;
import com.itwillbs.wms4.vo.WarehouseVO;

@Controller
public class WarehouseController {
	
	@Autowired
	private WarehouseService service;
	
	// 창고 등록
	@GetMapping("/Regist.wh")
	public String regist(HttpSession session, Model model) {

		String sId = (String)session.getAttribute("sId");
				
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 16; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				return "warehouse/wh_regist";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 창고 등록작업
	@PostMapping(value = "/RegistPro.wh")
	public String joinPro(@ModelAttribute WarehouseVO warehouse, Model model) {
		int insertCount = service.regist_wh(warehouse);
		
		System.out.println("창고등록작업 컨트롤러 : " + warehouse);
		// 가입 성공/실패에 따른 포워딩 작업 수행
		if(insertCount > 0) { // 성공
			return "redirect:/List.wh";
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
		int listLimit = 14; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
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
	
	// 창고 삭제
	@GetMapping("/WhDelete.wh")
	public String clientDelete(
			HttpSession session, @ModelAttribute WarehouseVO warehouse, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		// 1. 세션 아이디가 없을 경우 "잘못된 접근"
		if(sId == null || sId.equals("")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
			service.removeWarehouse(warehouse);
			return "redirect:/List.wh";
		}
	}
	
	// 창고 수정 폼 요청
	@GetMapping("/WhModify.wh")
	public String warehouseModify(String wh_cd, Model model) { // 권한부여시 세션 넣기
		WarehouseVO warehouse = service.getWarehouse(wh_cd);
		model.addAttribute("wh", warehouse);
		return "warehouse/wh_modify";
	}
	
	// 창고 수정 작업
	@PostMapping("WhUpdatePro.wh")
	public String warehouseUpdatePro(
			@ModelAttribute WarehouseVO warehouse,
			Model model,
			HttpSession session ) {
		System.out.println("창고수정작업 컨트롤러 : " + warehouse);
		
		int modifyCount = service.warehouseUpdate(warehouse);
		
		if(modifyCount > 0) {
			session.setAttribute("warehouse", warehouse);
			return "redirect:/List.wh";
			
		} else {
			model.addAttribute("msg", "수정에 실패하였습니다.");
			return "fail_back";
		}
	}
	
	
	
	
	
	
	
	
}
