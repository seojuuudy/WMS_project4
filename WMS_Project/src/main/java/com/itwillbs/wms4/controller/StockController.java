package com.itwillbs.wms4.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.itwillbs.wms4.service.StockService;
import com.itwillbs.wms4.vo.PageInfo;
import com.itwillbs.wms4.vo.Stock_controlVO;
import com.itwillbs.wms4.vo.Stock_historyVO;
import com.itwillbs.wms4.vo.Stock_history_listVO;
import com.itwillbs.wms4.vo.Stock_listVO;
import com.itwillbs.wms4.vo.Wh_detailVO;

@Controller
public class StockController {

	@Autowired
	private StockService service;
	// 전체 재고 조회 리스트
	@GetMapping(value = "Stock.st")
	public String stockList(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		int listLimit = 10;
		int startRow = (pageNum-1) * listLimit;
		
		List<Stock_listVO> stock_list = service.getStockList(searchType, keyword, startRow, listLimit);
		
		int listCount = service.getStockListCount(keyword);
		int pageListLimit = 10;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("stock_list", stock_list);
		
		
		return "stock/stock_list";
	}
	// 재고 조정시 사용할 재고 리스트 팝업
	@GetMapping(value = "StockPopup.st")
	public String stockListPopup(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, 
			@RequestParam(defaultValue = "1") int index,
			HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		int listLimit = 10;
		int startRow = (pageNum-1) * listLimit;
		
		List<Stock_listVO> stock_list = service.getStockList(searchType, keyword, startRow, listLimit);
		
		int listCount = service.getStockListCount(keyword);
		int pageListLimit = 10;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("stock_list", stock_list);
		model.addAttribute("index", index);
		
		
		return "stock/stock_list_popup";
	}
	// 재고 조정시 사용할 위치 조회 팝업
	@GetMapping(value = "Stock_area_popup.st")
	public String stockAreaPopup(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "1") int index,
			HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		int listLimit = 10;
		int startRow = (pageNum-1) * listLimit;
		
		List<Wh_detailVO> wh_detail = service.getAreaList(searchType, keyword, startRow, listLimit);
		
		int listCount = service.getAreaListCount(keyword);
		int pageListLimit = 10;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("wh_detail", wh_detail);
		model.addAttribute("index", index);
		
		
		return "stock/stock_area_popup";
	}
	
	@ResponseBody
	@PostMapping(value = "/StockListAjax.st")
	public String stockListAjax(@RequestBody List<Stock_listVO> stock_list, HttpServletResponse response,
			RedirectAttributes redirect) {
		System.out.println(stock_list);
		
		
		return "redirect:/StockControl.st";
	}
	
	@GetMapping(value = "/StockControl.st")
	public String stockRevise() {
		
		return "stock/stock_control";
	}
	
	@ResponseBody
	@PostMapping(value = "/StockAjaxPro.st")
	public void revisePro(@RequestBody List<Stock_listVO> stock_list, HttpServletResponse response, 
			Model model, @RequestParam(defaultValue = "1") int pageNum) {
//		System.out.println("revisePro: " + stock_list);
		
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		JSONArray jsonArray = new JSONArray();
		
		for(Stock_listVO stock : stock_list) {
			JSONObject jsonObject = new JSONObject(stock);
			
			jsonArray.put(jsonObject);
		}
		try {
			// 생성된 JSON 객체를 활용하여 응답 데이터를 직접 생성 후 웹페이지에 출력
			// response 객체의 setCharacterEncoding() 메서드로 출력 데이터 인코딩 지정 후
			// response 객체의 getWriter() 메서드로 PrintWriter 객체를 리턴받아
			// PrintWriter 객체의 print() 메서드를 호출하여 응답데이터 출력
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray); // toString() 생략됨
		} catch (IOException e) {
			e.printStackTrace();
		}
//		model.addAttribute("stock_list", stock_list);
		
		
	}
	
	@GetMapping(value = "/StockControlPro.st")
	   public String controlPro(@ModelAttribute Stock_controlVO control, HttpSession session, Model model) {
	      String sId = (String)session.getAttribute("sId");
//	      System.out.println("controlPro: " + control);
	      
	      for(int i = 0; i < control.getStock_cd_arr().length; i++) {
	         
	         Stock_controlVO stock_control = new Stock_controlVO();
	         
	         stock_control.setStock_cd(control.getStock_cd_arr()[i]);
	         stock_control.setControl_qty(control.getControl_qty_arr()[i]);
	         stock_control.setMoving_stock_cd(control.getMoving_stock_cd_arr()[i]);
	         stock_control.setMoving_qty(control.getMoving_qty_arr()[i]);
	         stock_control.setProduct_name(control.getProduct_name_arr()[i]);
	         
	         // 상세 위치 문자열을 찾기 위해 "창고 구역 위치" 전체를 갖고 와서 자름
	         System.out.println("loc_in_area을 찾기!: " + control.getWh_loc_in_area_arr()[i].isEmpty());
	         
	         String loc_in_area = "";
	         if(control.getWh_loc_in_area_arr()[i].isEmpty() == false) {
	            loc_in_area = control.getWh_loc_in_area_arr()[i];
	            loc_in_area.lastIndexOf(" ");
	            
	            loc_in_area = loc_in_area.substring(loc_in_area.lastIndexOf(" ") + 1);
	            
	            System.out.println("문자열 찾기: " + loc_in_area);
	         } 
	         
//	         System.out.println("적요값: " + control.getRemarks_arr()[i]);
	         
	         if(control.getRemarks_arr()[i].isEmpty()) {
	            stock_control.setRemarks("");
	         } else {
	            stock_control.setRemarks(control.getRemarks_arr()[i]);
	         }
	         
	         System.out.println("기존 재고 번호: " + control.getStock_cd_arr()[i] + ", " + "조정 재고수량: " + control.getControl_qty_arr()[i] 
	               + ", 이동할 재고 번호: " + control.getMoving_stock_cd_arr()[i] + ", 이동 재고수량 : " + control.getMoving_qty_arr()[i]);
	         
	         int stock_cd = stock_control.getStock_cd();
//	         System.out.println("stock_cd: " + stock_cd);
	         int stock_qty = stock_control.getControl_qty();
	         // 기존 재고 번호에 대한 수량 변경
	         int updateCount = service.modifyStock(stock_cd, stock_qty);
	         
	         if(updateCount > 0) {
	            
	            int moving_qty = stock_control.getMoving_qty();
	            System.out.println("moving_qty: " + moving_qty);
	            // 이동할 재고 수량이 있는 경우
	            if(moving_qty != 0) {
	               int moving_stock_cd = stock_control.getMoving_stock_cd();
	               // 이동할 재고 수량이 있지만 재고 번호가 없는 경우(이동 재고 번호가 0인 경우
	               // 위치만 가져가서 재고 번호를 제외한 나머지를 stock에 insert 하기
	               // 이동랑 수량이 
	               if(moving_stock_cd == 0 && !loc_in_area.equals("")) {
	                  
	                  String product_name = stock_control.getProduct_name();
	                  int product_cd = service.getProduct_cd(product_name);
	                  int wh_loc_in_area_cd = service.getAreaCd(loc_in_area);
	                  
	                  int insertCount = service.registStock(product_cd, moving_qty, wh_loc_in_area_cd);
	                  
	                  
	               } else {
	                  
	                  // 이동 재고 번호를 조회하여 이동할 재고 수량 update
	                  int updateCount2 = service.modifyMovingStock(moving_stock_cd, moving_qty);
	                  // 이동 재고 수량 update 성공시 -> 재고 이력 테이블 컬럼 추가
	                  if(updateCount2 > 0) {
	                     // 재고 이력 테이블 컬럼 추가를 위한 product_cd와 emp_num 조회 필요
	                     String product_name = stock_control.getProduct_name();
	                     int product_cd = service.getProduct_cd(product_name);
	                     System.out.println("product_cd: " + product_cd);
	                     String emp_num = service.getEmpNum(sId);
	                     String remarks = stock_control.getRemarks();
	                     System.out.println("remarks: " + remarks);
	                     int insertCount = service.registStockHistory(stock_cd, product_cd, moving_stock_cd, moving_qty, emp_num, remarks);
	                     int insertCount2 = service.registMovingStockHistory(stock_cd, product_cd, moving_stock_cd, moving_qty, emp_num, remarks);
	                     
	                  }
	               }
	               
	            }
	            
	         } else {
	            model.addAttribute("msg", "재고 조정 작업 실패!");
	            return "fail_back";
	         }
	         
	      }

	      return "redirect:/Stock.st";
	   }
	
	@GetMapping(value = "Stock_history_popup.st")
	public String stockPopupHistory(@RequestParam(defaultValue = "1") int stock_cd, 
									@RequestParam(defaultValue = "1") int pageNum, 
									Model model) {
		System.out.println("stock_cd: " + stock_cd);
		// 팝업창 클릭시 파라미터로 가져온 stock_cd의 재고이력을 조회
		
		//페이징처리
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		List<Stock_history_listVO> stock_history = service.getStockHistory(stock_cd, startRow, listLimit);
		
		int listCount = service.getStockHistoryListCount(stock_cd);
		int pageListLimit = 10;
		int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		System.out.println(stock_history);
		
		model.addAttribute("stock_history", stock_history);
		model.addAttribute("pageInfo", pageInfo);
		
		return "stock/stock_history_popup";
	}
	
	
}
