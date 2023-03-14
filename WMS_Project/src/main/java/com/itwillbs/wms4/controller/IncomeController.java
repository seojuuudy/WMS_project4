package com.itwillbs.wms4.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.wms4.service.ClientService;
import com.itwillbs.wms4.service.HrService;
import com.itwillbs.wms4.service.IncomeService;
import com.itwillbs.wms4.service.ProductService;
import com.itwillbs.wms4.service.StockService;
import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.EmpInfoVO;
import com.itwillbs.wms4.vo.InScheduleInfoVO;
import com.itwillbs.wms4.vo.In_scheduleVO;
import com.itwillbs.wms4.vo.In_schedule_per_productVO;
import com.itwillbs.wms4.vo.Inbound_ProductArrVO;
import com.itwillbs.wms4.vo.PageInfo;
import com.itwillbs.wms4.vo.ProductVO;
import com.itwillbs.wms4.vo.V_Inbound_ProcessingVO;
import com.itwillbs.wms4.vo.V_Inbound_ProductVO;
import com.itwillbs.wms4.vo.V_StockinfoVO;

@Controller
public class IncomeController {
	
	@Autowired
	private IncomeService service;
	@Autowired
	private ClientService service_cl;
	@Autowired
	private HrService service_hr;
	@Autowired
	private ProductService service_pr;
	@Autowired
	private StockService service_st;
	
	// 입고 예정 등록 폼
	@GetMapping(value = "/InboundScheduleRegist.in")
	public String inboundScheRegist() {
		return "inbound/inbound_schedule_regist";
	}
	
	// 입고 예정 등록을 위한 비지니스 로직 처리
	@PostMapping(value = "/InboundScheduleRegistPro.in")
	public String inboundScheRegistPro(@ModelAttribute In_scheduleVO inSchedule,
										@ModelAttribute In_schedule_per_productVO inSchedulePer, 
										Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		// 해당 회원의 권한 조회
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 3; // 재고 조회, 재고 관리 권한 00011과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시	
		
				int insertCount = service.registInSche(inSchedule);
				int insertCount2 = service.registInSchePer(inSchedulePer.getInSchedulePerList());
				
				if(insertCount > 0 && insertCount2 > 0) { // 성공
					return "redirect:/InboundScheduleList.in";
				} else { // 실패
					model.addAttribute("msg", "입고 예정 등록 실패!");
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
	
	// 입고 예정 등록 폼 내에서 거래처 리스트 - 팝업
	@GetMapping(value = "/InboundScheduleSearchClient.in")
	public String clientList(
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
					int listLimit = 8;
					int startRow = (pageNum - 1) * listLimit;
					// ---------------------------------------------------------------------------
					// Service_cl 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
					// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수   
					// => 리턴타입 : List<ClientVO> clientList
					List<ClientVO> clientList = service_cl.getClientList(searchType, keyword, startRow, listLimit);
					// ---------------------------------------------------------------------------
					// 페이징
					int listCount = service_cl.getClientListCount(searchType, keyword);
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
					
			//		System.out.println(clientList);
					return "inbound/inbound_schedule_searchCl";
		
				} else { // 권한 X
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else { // 로그인 X
				model.addAttribute("msg", "로그인 후 이용가능 합니다!");
				return "fail_back";
		}
	}
	
	// 입고 예정 등록 폼 내에서 담당자 리스트 - 팝업
	@GetMapping(value = "/InboundScheduleSearchEmployees.in")
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
			
				int listLimit = 8;
				int startRow = (pageNum-1) * listLimit;
				
				List<EmpInfoVO> empList = service_hr.getEmpList(searchType, keyword, startRow, listLimit);
				
				int listCount = service_hr.getEmpListCount(keyword, keyword);
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
				
				return "inbound/inbound_schedule_searchEmp";
			} else { // 권한 X
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인 X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 입고 예정 등록 폼 내에서 품목 리스트 - 팝업
	@GetMapping(value = "/InboundScheduleSearchProduct.in")
	public String prList(@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, 
			Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { 
			String priv_cd = (String)session.getAttribute("priv_cd");
			
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
			
				int listLimit = 10;
				int startRow = (pageNum-1) * listLimit;
				
				List<ProductVO> productList = service_pr.getProductList(searchType, keyword, startRow, listLimit);
				
				int listCount = service_pr.getProductListCount(searchType, keyword);
				int pageListLimit = 20;
				int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
				int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
				int endPage = startPage * pageListLimit - 1;
				
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
				model.addAttribute("productList", productList);
				model.addAttribute("pageInfo", pageInfo);
				
				return "inbound/inbound_schedule_searchPr";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}

	// 등록된 입고예정 목록 조회 ( + 탭기능 ) 
	@GetMapping(value = "/InboundScheduleList.in")
	public String inboundScheList(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "") String in_complete,
			HttpSession session) {
		
//		System.out.println("넘어왔나?" + in_complete);
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 O
			
				int listLimit = 10;
				int startRow = (pageNum-1) * listLimit;
				
				List<InScheduleInfoVO> InScheList = service.getInboundScheList(searchType, keyword, startRow, listLimit, in_complete);
				List<InScheduleInfoVO> InScheSum = service.getInboundScheListSum();
				List<InScheduleInfoVO> InScheCnt = service.getInboundScheListCnt();
//				Collections.reverse(InScheCount);
//				System.out.println(InScheCount);
				
				int listCount = service.getInboundScheListCount(keyword);
				int pageListLimit = 10;
				int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
				int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
				int endPage = startPage * pageListLimit - 1;
				
				if(endPage>maxPage) {
					endPage = maxPage;
				}
				
				// PageInfo 객체 생성 후 페이징 처리 정보 저장
				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
				model.addAttribute("InScheCnt", InScheCnt);
				model.addAttribute("InScheSum", InScheSum);
				model.addAttribute("InScheList", InScheList);
				model.addAttribute("pageInfo", pageInfo);
				
				return "inbound/inbound_schedule_list";
			} else { // 권한 X
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인 X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 등록된 입고 예정 목록 진행상태 조회 - 팝업
	@GetMapping(value = "/InboundScheduleStatus.in")
	public String hrDetail(String in_schedule_cd, HttpSession session, Model model) {
		
		// 해당 회원의 권한 조회
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
					
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				
				List<InScheduleInfoVO> InScheList = service.getInboundScheList(in_schedule_cd);
				
				model.addAttribute("InScheList", InScheList);
				return "inbound/inbound_schedule_status";
			} else { // 권한 X
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인 X 
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 종결여부 변경
	@ResponseBody
	@GetMapping(value = "/InboundComplete.in")
	public String complete(@ModelAttribute InScheduleInfoVO inSchedule,
							@RequestParam(value = "in_schedule_cd") String in_schedule_cd,
							@RequestParam(value = "in_complete") String in_complete,
							HttpServletResponse response, Model model, HttpSession session) {
		// 해당 회원의 권한 조회
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 3; // 재고 관리 권한 00011과 비교
					
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
					if(in_complete.equals("1")) { // 현재 종결상태
						int updateCount = service.modifyComplete(inSchedule, in_schedule_cd, in_complete);
						if(updateCount > 0) {
							return "success";
						}
					} else if(in_complete.equals("0")) { // 현재 미종결상태
						System.out.println("현재 미종결인" + in_complete);
						List<InScheduleInfoVO> InScheList = service.getInboundScheList(in_schedule_cd);
						List<String> InScheListS = InScheList.stream().map(InScheduleInfoVO::getIn_complete_pr).collect(Collectors.toList());
						List<Integer> InScheListI = InScheListS.stream().map(Integer::valueOf).collect(Collectors.toList());
						int result = InScheListI.stream().reduce(1, (a,b) -> a * b);
							if(result == 1) { // 하나의 발주서에 대한 모든 품목이 입고가 종결 되었을때
								int updateCount = service.modifyComplete(inSchedule, in_schedule_cd, in_complete);
								if(updateCount > 0) {
									return "success";
								}
							} else if(result == 0) { // 모든 품목의 입고가 완료되지 않았을때
								return "fail";
							}
					}
					return "inbound/inbound_schedule_list";
			} else { // 권한 X
				System.out.println("지금 종결인데22222  : " + in_complete);
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인 X 
					model.addAttribute("msg", "로그인 후 이용가능 합니다!");
					return "fail_back";
		}
	}

	// -------------------------- 입고예정항목 ----------------------------- //

	// 입고 예정 항목 목록
	@GetMapping(value = "/pdList.in")
	public String productList(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고조회 권한 00010과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
			
				int listLimit = 10;
				int startRow = (pageNum-1) * listLimit;
		
				// 입고 예정 항목 목록 조회
				List<V_Inbound_ProductVO> inProductList = service.getinProductList(searchType, keyword, startRow, listLimit);
				
				// 입고 예정 항목 목록 갯수 조회
				int listCount = service.getinProductListCount(searchType, keyword);
				int pageListLimit = 8;
				int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
				int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
				int endPage = startPage * pageListLimit - 1;
				
				if(endPage>maxPage) {
					endPage = maxPage;
				}
				
				// PageInfo 객체 생성 후 페이징 처리 정보 저장
				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				
				model.addAttribute("inProductList", inProductList);
				model.addAttribute("pageInfo", pageInfo);
				System.out.println(inProductList);
				
				return "inbound/inbound_productlist";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 입고 예정 항목 수정 폼
	@GetMapping(value = "/pdModify.in")
	public String productModify(String in_schedule_cd, String product_name, String in_date,
								Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 1; // 재고관리 권한 00001과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				// 입고 예정 항목의 정보 가져오기
				V_Inbound_ProductVO inProduct = service.getinProductInfo(in_schedule_cd, product_name, in_date);
				System.out.println("inProduct : " + inProduct);
				model.addAttribute("inProduct", inProduct);
				return "inbound/inbound_product_modify";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 입고 예정 항목 수정 비즈니스 작업 
	@ResponseBody
	@PostMapping(value = "/pdModifyPro.in")
	public int productModify(@ModelAttribute V_Inbound_ProductVO inProduct, @RequestParam String product_name, 
			@RequestParam int product_cd, @RequestParam int in_schedule_qty, 
			@RequestParam Date in_date, @RequestParam String remarks, @RequestParam String in_schedule_cd,
			@RequestParam Date ex_in_date ) {
		
		int updateCount = service.modifyProductInfo(inProduct, product_name, product_cd, in_schedule_qty, in_date, remarks, in_schedule_cd, ex_in_date);
		
		return updateCount;
	}
	
	// -------------------------------------------------- 입고처리
	// 입고 처리 목록 (체크박스로 넘긴 값들만)
	@GetMapping(value = "/pdProcessList.in")
	public String productProcessList(@RequestParam(defaultValue = "") String in_schedule_cd,
				@RequestParam(defaultValue = "") String product_cd,
				@RequestParam(defaultValue = "") String in_date , Model model
				, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 1; // 재고관리 권한 00001과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				String[] inSchedulecdArr = in_schedule_cd.split(",");
				String[] ProductcdArr = product_cd.split(",");
				String[] IndateArr = in_date.split(",");
				
				List<V_Inbound_ProcessingVO> inProductList = new ArrayList<V_Inbound_ProcessingVO>();
				
				for(int i=0;i<inSchedulecdArr.length;i++) {
					V_Inbound_ProcessingVO inProduct = new V_Inbound_ProcessingVO();
					in_schedule_cd = inSchedulecdArr[i];
					product_cd = ProductcdArr[i];
					in_date = IndateArr[i];
					
					// 입고 예정 항목 목록 조회
					inProduct = service.getinInboundList(in_schedule_cd, product_cd, in_date);
					inProductList.add(inProduct);
				}
				
				model.addAttribute("inProductList", inProductList);
				
				return "inbound/inbound_processing";
				
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}

	// 입고처리작업
	@PostMapping(value = "/DoInbound")
	public String plzTT(@ModelAttribute Inbound_ProductArrVO inboundArr, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 1; // 재고 관리 권한 00001과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 O {
				
				System.out.println("inboundArr : " + inboundArr);
				
				for(int i=0;i<inboundArr.getIn_schedule_cd().length;i++) {
					V_Inbound_ProcessingVO inProduct = new V_Inbound_ProcessingVO();
					inProduct.setIn_schedule_cd(inboundArr.getIn_schedule_cd()[i]); // 입고예정수량
					inProduct.setProduct_cd(inboundArr.getProduct_cd()[i]); // 품목 코드
					inProduct.setIn_date(inboundArr.getIn_date()[i]); // 납기일자
					inProduct.setIn_qty(inboundArr.getIn_qty()[i]); // 총입고수량
					inProduct.setEmp_num(inboundArr.getEmp_num()[i]); // 담당자 사원번호
					inProduct.setWh_area_cd(inboundArr.getWh_area_cd()[i]); // 구역코드 저장
					inProduct.setWh_loc_in_area_cd(inboundArr.getWh_loc_in_area_cd()[i]); // 위치코드 저장
					inProduct.setRemarks(inboundArr.getRemarks()[i]); // 적요 저장
					
					// 품목코드, 위치코드, 적요 가져오기
					int product_cd = inProduct.getProduct_cd();
					int wh_loc_in_area_cd = inProduct.getWh_loc_in_area_cd();
					String remarks = inProduct.getRemarks();
					
					// ----- 재고 번호 처리 
					if(inboundArr.getStock_cd()[i]==0) { // 불러온 재고코드가 0이면 (재고코드 존재X)
						int stockcd = service.getnewStockcd(); // 새재고코드 조회하러감
						inProduct.setStock_cd(stockcd); // 조회한 새재고번호 저장 
						
						// 조회한 재고번호 생성
						service.createStock_cd(stockcd, product_cd, wh_loc_in_area_cd); // 신규 재고번호를 생성
					} else { // 불러온 재고코드가 비어있지 않으면
						inProduct.setStock_cd(inboundArr.getStock_cd()[i]); // 받아온 재고코드로 변경
					} // if문 끝
					
					int stock_cd = inProduct.getStock_cd();
					
					// 1. 입고 처리 정보를 입력 받아 입고 정보 업데이트 (입고 수행)
					service.changeinInbound(inProduct);
					// 2. 재고에 입고수량 추가
					int updateCount = service.changeInqty(inProduct);
					// 3. 입고 예정 수량 - 입고 수량 = 0 -> 진행상태 완료(1)
					service.changeInComplete(inProduct);
					
					if(updateCount > 0) {
						// 입고 이력 추가를 위한 변수
						int in_qty = inProduct.getIn_qty();
						String emp_num = service_st.getEmpNum(sId);
						remarks = inProduct.getRemarks();
						
						// 입고 이력 등록
		                service.registStockHistory(stock_cd, product_cd, in_qty, emp_num, remarks);
		             } // 입고 이력 if문 
				} // 입고처리 전체 for문 
				return "redirect:/pdList.in";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 창고 위치 중복 검사
	@ResponseBody
	@GetMapping(value = "/ck_Locatecd")
	public int check_Locatecd(@RequestParam(defaultValue = "1") int location_cd,
				@RequestParam(defaultValue = "1") int product_cd
				) {
		System.out.println("location_cd : " + location_cd + ", product_cd : " + product_cd);
		
		int count = service.checkLocatecd(location_cd, product_cd);
		
		return count;
	}
		
	// ---------------------------------------------- 팝업창
	// 재고 목록 조회 - 키워드 처리
	@GetMapping(value = "/SearchStockcd")
	public String searcheStockcd(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "1") int index
			) {
		
		int listLimit = 10;
		int startRow = (pageNum-1) * listLimit;
		
		// 재고 목록 조회
		List<V_StockinfoVO> stockList = service.getStockList(searchType, keyword, startRow, listLimit);
		
		// 재고 목록 갯수 조회
		int listCount = service.getStockListCount(searchType, keyword);
		int pageListLimit = 8;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);

		model.addAttribute("stockList", stockList);
		model.addAttribute("pageInfo", pageInfo);
		// 부모인덱스를 자식창으로 넘겨줌
		model.addAttribute("index", index);
		
		return "inbound/search_stockcd";
	}
	
	// 품목명 목록 - 키워드 처리
	@GetMapping(value = "/SearchProduct")
	public String searcheLocation(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "1") int index) {
		
		int listLimit = 10;
		int startRow = (pageNum-1) * listLimit;
		
		// 품목 목록 조회
		List<V_Inbound_ProductVO> productList = service.getProductList(searchType, keyword, startRow, listLimit);
		
		// 목록 갯수 조회
		int listCount = service.getProductListCount(searchType, keyword);
		int pageListLimit = 8;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);

		model.addAttribute("productList", productList);
		model.addAttribute("pageInfo", pageInfo);
		// 부모인덱스를 자식창으로 넘겨줌
		
		return "inbound/search_product";
	}
	
	// 구역명_위치 목록 조회
	@GetMapping(value = "/SearchArea")
	public String searcheArea(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "1") int index,
			@RequestParam(defaultValue = "1") int product_cd) {
		
		int listLimit = 10;
		int startRow = (pageNum-1) * listLimit;
		
		// 구역명_위치 목록 조회
		List<V_StockinfoVO> areaList = service.getAreaList(searchType, keyword, startRow, listLimit);
		
		// 구역명_위치 목록 갯수 조회
		int listCount = service.getAreaListCount(searchType, keyword);
		int pageListLimit = 8;
		int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
		int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage * pageListLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);

		model.addAttribute("areaList", areaList);
		model.addAttribute("pageInfo", pageInfo);
		// 부모인덱스와 품목코드를 자식창으로 넘겨줌
		model.addAttribute("index", index);
		model.addAttribute("product_cd", product_cd);
		
		return "inbound/search_areacd";
	}

}
