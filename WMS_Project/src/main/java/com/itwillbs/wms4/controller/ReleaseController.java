package com.itwillbs.wms4.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.itwillbs.wms4.service.ClientService;
import com.itwillbs.wms4.service.HrService;
import com.itwillbs.wms4.service.ProductService;
import com.itwillbs.wms4.service.ReleaseService;
import com.itwillbs.wms4.service.StockService;
import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.EmpInfoVO;
import com.itwillbs.wms4.vo.OutProcess_cd_stockVO;
import com.itwillbs.wms4.vo.OutScheduleListVO;
import com.itwillbs.wms4.vo.Out_scheduleVO;
import com.itwillbs.wms4.vo.Out_schedule_per_productVO;
import com.itwillbs.wms4.vo.PageInfo;
import com.itwillbs.wms4.vo.ProductVO;
import com.itwillbs.wms4.vo.Stock_listVO;

@Controller
public class ReleaseController {

	@Autowired
	private ReleaseService service;
	
	@Autowired
	private HrService hrService;
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private StockService stockService;
	
	@GetMapping("/OutScheduleList.out") // 출고 예정 목록
	public String outScheduleList(
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String out_complete,
			Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");

		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 O
			// ---------------------------------------------------------------------------
			// 페이징 처리를 위한 변수 선언
			int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
	//						System.out.println("startRow = " + startRow);
			// ---------------------------------------------------------------------------
			// Service 객체의 getReleaseList() 메서드를 호출하여 게시물 목록 조회
			// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수   
			// => 리턴타입 : List<OutScheduleListVO> out_schedule_list
			List<OutScheduleListVO> out_schedule_list = service.getReleaseList(startRow, listLimit);
			List<OutScheduleListVO> outscheduleSum = service.getOut_schedule_sum();
			List<OutScheduleListVO> outscheduleCount = service.getOut_schedule_count();
			// ---------------------------------------------------------------------------
			System.out.println("이건 합계 " + outscheduleSum);
			System.out.println("이건 갯수 " + outscheduleCount);
			// 페이징 처리
			int listCount = 10;
	//				System.out.println("총 게시물 수 : " + listCount);
			
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
			// 조회 결과를 Model 객체에 "out_schedule_list" 속성명으로 저장
			model.addAttribute("out_schedule_list", out_schedule_list);
			model.addAttribute("outscheduleSum", outscheduleSum);
			model.addAttribute("outscheduleCount", outscheduleCount);
			model.addAttribute("pageInfo", pageInfo);
			
	//		System.out.println("out_schedule_list " + out_schedule_list);
			
			return "out_schedule/out_schedule_list";
			} else { // 권한 X
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인 X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	@GetMapping("/OutScheduleListIng.out") // 출고 예정 진행중 목록
	public String outScheduleList(
			@RequestParam(defaultValue = "1") int pageNum,
			@ModelAttribute OutScheduleListVO outscheduleList,
			HttpSession session,
			Model model) {
		
		// 해당 회원의 권한 조회
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
					
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
		// ---------------------------------------------------------------------------
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
//						System.out.println("startRow = " + startRow);
		// ---------------------------------------------------------------------------
		// Service 객체의 getReleaseList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수   
		// => 리턴타입 : List<OutScheduleListVO> out_schedule_list
//		System.out.println(outscheduleList.getOut_complete());
		List<OutScheduleListVO> out_schedule_list = service.getReleaseIngList(outscheduleList.getOut_complete(), startRow, listLimit);
		// ---------------------------------------------------------------------------
		// 페이징 처리
		int listCount = 10;
//				System.out.println("총 게시물 수 : " + listCount);
		
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
		// 조회 결과를 Model 객체에 "out_schedule_list" 속성명으로 저장
		model.addAttribute("out_schedule_list", out_schedule_list);
		model.addAttribute("pageInfo", pageInfo);
		
//		System.out.println("out_schedule_list " + out_schedule_list);
		
		return "out_schedule/out_schedule_list";
		} else { // 권한 X
			model.addAttribute("msg", "접근 권한 없음!");
			return "fail_back";
		}
	} else { // 로그인 X 
		model.addAttribute("msg", "로그인 후 이용가능 합니다!");
		return "fail_back";
	}
}
	
	
	@GetMapping("/OutDetail.out") // 출고 예정품목 리스트별 출고상태
	public String OutDetail(
		@ModelAttribute OutScheduleListVO outScheduleList,
		Model model) {
			List<OutScheduleListVO> outList = service.selectOutProcess(outScheduleList);
//			System.out.println(outList);
			
			model.addAttribute("outList", outList);
		return "out_schedule/out_detail";
	}
	
	@GetMapping("/OutRegist.out") // 출고 등록
	public String outScheduleRegist() {
		
		return "out_schedule/out_schedule_regist";
	}
	
//	@ResponseBody
	@PostMapping(value = "/OutRegistPro.out") // 출고 등록작업
	public String clientRegistPro(
			@ModelAttribute Out_scheduleVO release, 
			@ModelAttribute Out_schedule_per_productVO releaseProduct,
			HttpServletRequest request,
//			@RequestParam(value="product_cd[]") List<Integer> product_cd,
			Model model, HttpSession session) {
//		System.out.println(release);
//		System.out.println(releaseProduct);
//		String sId = (String)session.getAttribute("sId");
//		if(sId == null || sId.equals("")) {
//			model.addAttribute("msg", "로그인 필수!");
//			return "fail_back";
//		}
//		System.out.println(release);
//		System.out.println(releaseProduct);
//		System.out.println(releaseProduct.getProduct_cd());
//		System.out.println(releaseProduct.getOutProductList());
//		System.out.println(releaseProduct.getOut_schedule_cd());
//		System.out.println(releaseProduct.getProduct_cd().split(",")[0]);
		
//		List<Out_schedule_per_productVO> list = new ArrayList<Out_schedule_per_productVO>();
//		releaseProduct.getProduct_().split(",");
//		String[] out_Product = releaseProduct.getProduct_cd().split(",");
		
		
//		String[] arrayParam = request.getParameterValues("product_cd[]");
//		System.out.println(arrayParam);
//		for(int i = 0; i < arrayParam.length; i++) {
//			System.out.println(arrayParam[i]);
//		}
		
		String sId = (String)session.getAttribute("sId");
		
		// 해당 회원의 권한 조회
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 3; // 재고 조회, 재고 관리 권한 00011과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시	
		int insertCount = service.registRelease(release, releaseProduct.getOutProductList());
//		
//		
//		// 등록 성공/실패에 따른 포워딩 작업 수행
			if(insertCount > 0) { // 성공
				
				return "redirect:/OutScheduleList.out";
			} else { // 실패
//				 "msg" 속성명으로 "글 쓰기 실패!" 메세지 전달 후 fail_back 포워딩
				model.addAttribute("msg", "등록 실패!");
				return "fail_back";
			}
		} else { // 권한 불일치
			model.addAttribute("msg", "접근 권한 없음!");
			return "fail_back";
		}	
	} else { // 로그인 X 
		model.addAttribute("msg", "로그인 후 이용가능 합니다!");
		return "fail_back";
	}	
}
	
	@GetMapping(value = "/ClientSearchList.out") // 거래처 목록조회
	public String clientSearchList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 O
		// ---------------------------------------------------------------------------
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
//				System.out.println("startRow = " + startRow);
		// ---------------------------------------------------------------------------
		// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수   
		// => 리턴타입 : List<ClientVO> clientList
		List<ClientVO> clientList = clientService.getClientList(searchType, keyword, startRow, listLimit);
		// ---------------------------------------------------------------------------
		// 페이징 처리
		int listCount = clientService.getClientListCount(searchType, keyword);
//				System.out.println("총 게시물 수 : " + listCount);
		
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
		model.addAttribute("clientList", clientList);
		model.addAttribute("pageInfo", pageInfo);
		
//		System.out.println("clientList " + clientList);
		
		return "out_schedule/clientSearchList";
			} else { // 권한 X
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인 X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
	}
}
	
	@GetMapping(value = "/SearchList.out")
	public String hrList(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 O
			
			
				int listLimit = 10;
				int startRow = (pageNum-1) * listLimit;
				
				List<EmpInfoVO> empList = hrService.getEmpList(searchType, keyword, startRow, listLimit);
				
				int listCount = hrService.getEmpListCount(searchType, keyword);
				int pageListLimit = 8;
				int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
				int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
				int endPage = startPage * pageListLimit - 1;
				
				if(endPage>maxPage) {
					endPage = maxPage;
				}
				
				// PageInfo 객체 생성 후 페이징 처리 정보 저장
				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
				model.addAttribute("empList", empList);
				model.addAttribute("pageInfo", pageInfo);
				
				return "out_schedule/employee_Search_list";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
				
				
	};
	
	@GetMapping(value = "/ProductSearchList.out")
	public String prList(@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, 
			HttpSession session, 
			Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { 
			String priv_cd = (String)session.getAttribute("priv_cd");
			
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2;
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
			
				int listLimit = 10;
				int startRow = (pageNum-1) * listLimit;
				
				List<ProductVO> productList = productService.getProductList(searchType, keyword, startRow, listLimit);
				
				int listCount = productService.getProductListCount(searchType, keyword);
				int pageListLimit = 10;
				int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
				int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
				int endPage = startPage * pageListLimit - 1;
				
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
				model.addAttribute("productList", productList);
				model.addAttribute("pageInfo", pageInfo);
				
				return "out_schedule/out_product_list";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
		
	}
	
	@GetMapping(value = "/StockSearchList.out")
	public String stockList(@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "") String product_cd,
			@RequestParam(defaultValue = "1") int pageNum, 
			HttpSession session, 
			Model model) {
		
		String sId = (String)session.getAttribute("sId");
//		System.out.println("품목코드!" + product_cd);
		if(sId != null) { 
			String priv_cd = (String)session.getAttribute("priv_cd");
			
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2;
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
			
			int listLimit = 10;
			int startRow = (pageNum-1) * listLimit;
			
			int product_cd2 = Integer.parseInt(product_cd);
			List<Stock_listVO> stockList = stockService.getProcdStockList(product_cd2, searchType, keyword, startRow, listLimit);
			
			int listCount = stockService.getStockListCount(keyword);
			int pageListLimit = 10;
			int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			int endPage = startPage * pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("stockList", stockList);
			model.addAttribute("pageInfo", pageInfo);
//				System.out.println("출고 컨트롤러 왔어?");
				return "out_schedule/out_stock_list";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
		
	}
	
	@GetMapping("/outCompleteChange.out")
	public void completeChange(
			@RequestParam(defaultValue = "0") String out_schedule_cd,
			@RequestParam(defaultValue = "0") String out_complete,
			HttpServletResponse response, Model model) {
		
		int successModify = service.modifyComplete(out_schedule_cd, out_complete);
		if(successModify > 0) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			model.addAttribute("msg", "출고 미완료");
		}
	}

	@GetMapping("/OutProcess.out") // 출고 처리 
	public String outProcess(
			@RequestParam(defaultValue = "") String out_schedule_cd,
			@RequestParam(defaultValue = "") String product_cd, 
			@RequestParam(defaultValue = "") String outqty,
			Model model) {
		
		String[] outScheduleArr = out_schedule_cd.split(",");
		String[] product_cdArr = product_cd.split(",");
		String[] outqtyArr = outqty.split(",");
//		System.out.println("outScheduleArr : " + outScheduleArr + ", product_cdArr :" + product_cdArr + ", outqtyArr" + outqtyArr);
		List<OutProcess_cd_stockVO> processList = new ArrayList<OutProcess_cd_stockVO>();
		
		for(int i=0;i<outScheduleArr.length;i++) {
			out_schedule_cd = outScheduleArr[i];
			product_cd = product_cdArr[i];
			outqty = outqtyArr[i];
			OutProcess_cd_stockVO process = service.getOutScheduleProcess(out_schedule_cd, product_cd, outqty);
//			System.out.println("여기보자 " + process);
			processList.add(process);
		}
//		System.out.println("out_schedule_cd : " + out_schedule_cd + ", product_cd :" + product_cd + ",outqty : " + outqty);
		
		
		
		model.addAttribute("processList", processList);
//		System.out.println("processList : " + processList);
		
		
		return "out_schedule/out_process";
	}
//	@ResponseBody
//	@PostMapping("/OutProcess.out") // 출고 처리 
//	public void outProcess(
//			@RequestParam(defaultValue = "") String out_schedule_cd,
//			@RequestParam(defaultValue = "") String out_qty, 
////			@RequestBody String jsonData,
//			Model model) {
//		
//		String[] outScheduleArr = out_schedule_cd.split(",");
//		String[] out_qtyArr = out_qty.split(",");
//		
//		
//		for(int i=0;i<outScheduleArr.length;i++) {
//			out_schedule_cd = outScheduleArr[i];
//			out_qty = out_qtyArr[i];
//		}
////		System.out.println("여기있따 " + jsonData);
////		Gson gson = new Gson();
//		
////		List<OutProcess_cd_stockVO> processList = 
////				gson.fromJson(jsonData, new TypeToken<List<OutProcess_cd_stockVO>>(){}.getType());
//		
//		System.out.println("processList : " + processList);
////		List<OutProcess_cd_stockVO> processList2 = service.getOutScheduleProcess(processList);
//		
////		model.addAttribute("processList2", processList2);
//		
////		System.out.println("processList2 : " + processList2);
//		
//		return "out_schedule/out_process";
//	}
	
	@ResponseBody
	@PostMapping("/ControlOutqty.out")
	public void controlQutqty(
			@RequestBody String out_schedule_cdArr,
//			@ModelAttribute OutProcess_cd_stockVO outProcess,
			HttpSession session,
			HttpServletResponse response,
			Model model) {
		      System.out.println("ControlOutqty 여기로 와 ㅠ outProcess: " + out_schedule_cdArr);
		      Gson gson = new Gson();
		      // JSON 데이터(배열 내부에 객체가 저장되어 있는 JSON 문자열)을 파싱하여 저장할
		      // 자바의 객체로 변환하기 위해 Gson 객체의 fromJson() 메서드 활용
		      // => gson.fromJson(JSON 데이터, 파싱할클래스명.class);
		      // => 단, List 등의 복합 객체일 경우 별도의 클래스를 통해 타입을 지정해야함
		      //    ex) new TypeToken<List<BoardVO>>(){}.getType()
//		      Out_schedule_per_productVO[] array = gson.fromJson(out_schedule_cdArr, Out_schedule_per_productVO[].class);
//		      List<Out_schedule_per_productVO> osppList = Arrays.asList(array);
		      List<Out_schedule_per_productVO> osppList = 
						gson.fromJson(out_schedule_cdArr, new TypeToken<List<Out_schedule_per_productVO>>(){}.getType());
//		      
		      System.out.println(osppList);
		      
		      for(Out_schedule_per_productVO ospp : osppList) {
		    	  System.out.println("releaseController : " + ospp);
		    	  
		    	  int stockUpdateCount = service.outStockQty(ospp); // stock 테이블 재고 수량 수정
		    	  System.out.println(stockUpdateCount);
		    	  
		    	  int osppUpdateCount = service.modifyOutQty(ospp); // out_schedule_per_product 테이블 출고 수량 수정
		    	  if(osppUpdateCount > 0) {
		  				System.out.println("출고 수량 조정 완료");
		  			}
		  			
  					try {
  						response.setCharacterEncoding("UTF-8");
  						response.getWriter().print("true"); // toString() 생략됨
  					} catch (Exception e) {
  						e.printStackTrace();
  					}
		  	}   
		      
	}
}	
