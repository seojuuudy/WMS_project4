package com.itwillbs.wms4.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.wms4.service.ClientService;
import com.itwillbs.wms4.service.ProductService;
import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.PageInfo;
import com.itwillbs.wms4.vo.ProductGroupBottomVO;
import com.itwillbs.wms4.vo.ProductGroupInfoVO;
import com.itwillbs.wms4.vo.ProductGroupTopVO;
import com.itwillbs.wms4.vo.ProductVO;

@Controller
public class productController {

	@Autowired
	private ProductService service;
	@Autowired
	private ClientService cservice;
	
	/*
	품목 컨트롤러
	
	<품목 그룹 관련>
		1. 품목 그룹 조회 Group List(line 179)
		2. 품목 그룹 등록 Group Regist(line 112), Group Regist Pro(line 144)
		3. 품목 그룹 삭제 Delete Group(line 230)
	
	<품목 관련>
		4. 품목 조회 Product List(line 61)
		5. 품목 등록 Product Regist(line 265), Product Regist Pro(line 302)
		6. 품목 상세정보 조회 Product Detail(line 574)
		7. 품목 수정 Product Modify Pro(line 613)
		8. 품목 삭제 Product Delete(line 720)
	
	<팝업창 관련>
		9. 품목 그룹 찾기 FindGroup(line 408)
		10. 팝업창에서 품목 그룹 생성 GrRegistPopUp(line 459), GrRegistPopUpPro(line 488)
		11. 거래처 찾기 FindClient(line 523)
	
	*/
	
	//====================== 기본 페이지-품목관리 눌렀을 때 (품목 목록 조회 페이지) : 재고 조회 권한 필요 ======================
		@GetMapping(value = "/ProductList.pr")
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
					
					List<ProductVO> productList = service.getProductList(searchType, keyword, startRow, listLimit);
					
					int listCount = service.getProductListCount(searchType, keyword);
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
					
					return "product/product_list";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else { // 로그인X
				model.addAttribute("msg", "로그인 후 이용가능 합니다!");
				return "fail_back";
			}
			
		};
	//==========================================================================================================================

	//======================================== 품목 그룹 등록 폼 : 재고 관리 권한 필요 =========================================
		@GetMapping(value = "/GroupRegist.pr")
		public String groupRegist(HttpSession session, Model model) {
			
			String sId = (String)session.getAttribute("sId");
			String priv_cd = (String)session.getAttribute("priv_cd");
//				System.out.println("session id : " + sId + ", priv_cd : " + priv_cd);  //--> 잘 뜸!
			
			//로그인o vs 로그인x & if 로그인o -> 권한o vs 권한x
			if(sId != null) {
				//권한 판별
				int num = Integer.parseInt(priv_cd, 2);
				int cpriv_cd = 1; // 품목관리 권한 00001과 비교
				
				if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
					
					List<ProductGroupTopVO> prGrTopNameList = service.getPrGrTopNameList();	
					model.addAttribute("prGrTopNameList", prGrTopNameList);
					
					return "product/product_group_regist";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용가능!");
				return "fail_back";
			} // ~~~~~~~~~~~~~~~~if-else end~~~~~~~~~~~~~~~~~~~
			
		}
	//==========================================================================================================================
		
	//================================================== 품목 그룹 등록 처리 ===================================================
		@PostMapping(value = "/GroupRegistPro.pr")
		public String groupRegistPro(@RequestParam String product_group_bottom_name,@RequestParam String product_group_top_name,  Model model) {
//			System.out.println("controller's product_group_bottom_name : " + product_group_bottom_name);
//			System.out.println("controller's product_group_top_name : " + product_group_top_name);
			
			// 상위그룹  이름으로 조회해서 조회가 안된다면 상위그룹 인서트 후 인서트한 상위그룹의 코드 조회 > 그다움 하위그룹 인서트 할거임
			
			// 상위 그룹 이름으로 테이블 조회하기
			int selectCount = service.getCount(product_group_top_name);
			
			// top name 으로 조회해서 조회가 안된다면(조회 결과가 1보다 작으면) > 상위그룹은 insert 하고 그 인서트 한 상위그룹의 이름으로 코드 조회 후 하위 그룹 인서트 하기
			if(selectCount < 1 ) { 
				int insertTopCount = service.registTopGroup(product_group_top_name);
//				System.out.println("controller : insert top group 결과 : " + insertTopCount);
				
			}
			// top name 으로 조회해서 조회가 된다면(조회 결과가 1보다 크거나 같으면) 상위그룹은 insert 안해도 됨. 상위그룹 코드 조회 후 하위그룹 인서트
			int product_group_top_cd = service.getCode(product_group_top_name);
//			System.out.println("controller : product group top의 코드 조회 결과 product_group_top_cd : " + product_group_top_cd);
			
			// 조회한 코드와 입력폼에서 입력받은 하위그룹 이름으로 product group 등록하기
			int insertBottomCount = service.registBottomGroup(product_group_top_cd, product_group_bottom_name);
//			System.out.println("controller : insert bottom group 결과 : " + insertBottomCount);
			
			if(insertBottomCount > 0) { // success
				return "redirect:/GroupList.pr";
			} else { // fail
				model.addAttribute("msg", "품목 그룹 등록 실패!");
				return "fail_back";
			}
			
		}
	//==========================================================================================================================

	//================================== 품목 그룹 목록 조회 페이지 : 재고 조회 권한 필요 ======================================
		@GetMapping(value = "/GroupList.pr")
		public String groupList(@RequestParam(defaultValue = "") String searchType, 
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
					
					List<ProductGroupInfoVO> prGroupList = service.getPrGrList(searchType, keyword, startRow, listLimit);
					
					int listCount = service.getPrGrListCount(searchType, keyword);
					int pageListLimit = 10;
					int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
					int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
					int endPage = startPage * pageListLimit - 1;
					
					if(endPage > maxPage) {
						endPage = maxPage;
					}
					
					PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
					
					model.addAttribute("prGroupList", prGroupList);
					model.addAttribute("pageInfo", pageInfo);
					
					return "product/product_group_list";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else { // 로그인X
				model.addAttribute("msg", "로그인 후 이용가능 합니다!");
				return "fail_back";
			}
			
		}
	//==========================================================================================================================

	//========================================= 품목 그룹 삭제 처리 : 관리 권한필요 ============================================
		@GetMapping(value = "/DeleteGroup.pr")
		public String deleteGroup(@RequestParam String product_group_bottom_cd, Model model, HttpSession session) {
//					System.out.println("전달받은 품목코드 : " + product_group_bottom_cd);
			String sId = (String)session.getAttribute("sId");
			
			if(sId != null) { // 로그인O
				// 해당 회원의 권한 가져오기
				String priv_cd = (String)session.getAttribute("priv_cd");
				// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
				int num = Integer.parseInt(priv_cd, 2);
				int cpriv_cd = 1; // 재고관리 권한 00100과 비교
				
				if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
					
					int deleteCount = service.removeProductGroup(product_group_bottom_cd);
			
					if(deleteCount > 0) {// 삭제 성공
				
						return "redirect:/GroupList.pr";
					} else { // 삭제 실패
						model.addAttribute("msg", "품목 그룹 삭제 실패!");
						return "fail_back";
					} // if-else end
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			}  else {
				model.addAttribute("msg", "로그인 후 이용가능 합니다!");
				return "fail_back";	
			}
		}	
		//==========================================================================================================================				
		
	//=========================================== 품목 등록 폼 : 재고 관리 권한 필요 ===========================================
		@GetMapping(value = "/ProductRegist.pr")
		public String prRegist(HttpSession session, Model model) {
			
			String sId = (String)session.getAttribute("sId");
			String priv_cd = (String)session.getAttribute("priv_cd");
//			System.out.println("session id : " + sId + ", priv_cd : " + priv_cd);  //--> 잘 뜸!
			
			//로그인o vs 로그인x & if 로그인o -> 권한o vs 권한x
			if(sId != null) {
				//권한 판별
				int num = Integer.parseInt(priv_cd, 2);
				int cpriv_cd = 1; // 품목관리 권한 00001과 비교
				
				if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
					
					//품목 리스트 셀렉트 박스에 출력
					List<ProductGroupBottomVO> prGrBottomNameList = service.getPrGrBottomNameList();	
					model.addAttribute("prGrBottomNameList", prGrBottomNameList);
					
					//거래처 리스트 셀렉트박스에 출력
					List<ClientVO> clientNameList = service.getClientNameList();
					model.addAttribute("clientNameList", clientNameList);
					
					return "product/product_regist";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용가능!");
				return "fail_back";
			} // ~~~~~~~~~~~~~~~~if-else end~~~~~~~~~~~~~~~~~~~
			
		}
	//==========================================================================================================================
		
	//===================================================== 품목 등록 처리 =====================================================
		@PostMapping(value = "/ProductRegistPro.pr")
		public String prRegistPro(@ModelAttribute ProductVO product, 
								@RequestParam(defaultValue = "") String purchasePrice, 
								@RequestParam(defaultValue = "") String sellingPrice, 
								HttpSession session, Model model) {
			// 품목 코드, 품목명, 품목 그룹, 규격, 단위, 바코드, 입고단가, 출고단가, 품목구분, 구매 거래처, 대표이미지, 적요 
//			System.out.println(product);
			
			//------------------------------- 바코드 생성 ---------------------------------
			String bsCd = product.getBusiness_no().substring(3);
			String productGr = String.format("%04d", product.getProduct_group_bottom_cd());
			
//			System.out.println("substring 한 사업자등록번호 bsCd : " + bsCd);
//			System.out.println("0으로 채워지는 상품코드 productGr : " + productGr);
			
			String barcode = "880" + bsCd + productGr;
			
//			System.out.println("생성된 barcode : " + barcode);
			
			//vo 객체에 바코드 저장
			product.setBarcode(barcode);
			
			//-------------------------------입고단가, 판매단가 계산-------------------------------------
//			System.out.println("purchasePrice : " + purchasePrice);
//			System.out.println("sellingPrice : " + sellingPrice);
//			System.out.println("수량 : " + product.getUnit());
			
			// 나중에 추가한 컬럼이라서 코드 더럽습니다ㅜㅜ
			product.setPurchase_price(Integer.parseInt(purchasePrice));
			product.setSell_price(Integer.parseInt(sellingPrice));
			// ----------------------------------------------------------
			
			//불러온 가격 double 타입으로 계산, 수량도 걍 double로 바꾸기
			double units = Double.parseDouble(product.getUnit());
			
			double purchasePr = (Double.parseDouble(purchasePrice)) ;
			double sellingPr = (Double.parseDouble(sellingPrice)) ;
			
//			System.out.println("purchasePr : " + purchasePr);
//			System.out.println("sellingPr : " + sellingPr);
//			System.out.println("units : " + units);

			double in_unit_price = Double.parseDouble(String.format("%.2f", purchasePr / units));
			double out_unit_price = Double.parseDouble(String.format("%.2f", sellingPr / units));
//			System.out.println("최종으로 입력할(더블로 형변환 완, 코드 줄이는중) 단가 : " + in_unit_price + ", " + out_unit_price);
			
			//vo 객체에 입고단가, 판매단가 저장
			product.setIn_unit_price(in_unit_price);
			product.setOut_unit_price(out_unit_price);
			
			//--------------------------------- 사진등록 ---------------------------------
			String uploadDir = "/resources/upload";
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			Path path = Paths.get(saveDir);
//			System.out.println("실제경로 : " + saveDir);
			
			try {
				Files.createDirectories(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			MultipartFile pFile = product.getFile();
//			System.out.println("pFile : " + pFile); 
			
			// multipartFile 객체에서 파일명 꺼냄
			String photoFile = pFile.getOriginalFilename();
//			System.out.println("photoFile : " + photoFile);
			//중복방지 처리
			String uploadFileName = "";
			if(!photoFile.equals("")) {
				String uuid = UUID.randomUUID().toString();
//				System.out.println(uuid);
				uploadFileName = uuid + "_" + photoFile;
			}
			
			product.setProduct_image(uploadFileName);
			//--------------------------------- 진짜로 등록 처리^-^ ---------------------------------
			int insertProductCount = service.registProduct(product);
			
			if(insertProductCount > 0) { // success
				try {
					MultipartFile file = product.getFile();
					
					if(!file.getOriginalFilename().equals("")) {
						file.transferTo(
							new File(saveDir, product.getProduct_image())	
						);
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return "redirect:/ProductList.pr";
			} else { // fail
				model.addAttribute("msg", "품목 등록 실패!");
				return "fail_back";
			} // if-else 끝

		}
	//==========================================================================================================================
		
	//==================================== 팝업 : 품목 그룹 찾기 : 재고 조회 권한 필요 =======================================
		@GetMapping(value = "/FindGroup.pr")
		public String findGroup(@RequestParam(defaultValue = "") String searchType, 
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
					
					List<ProductGroupInfoVO> prGroupList = service.getPrGrList(searchType, keyword, startRow, listLimit);
					
					int listCount = service.getPrGrListCount(searchType, keyword);
					int pageListLimit = 10;
					int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
					int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
					int endPage = startPage * pageListLimit - 1;
					
					if(endPage > maxPage) {
						endPage = maxPage;
					}
					
					PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
					
					model.addAttribute("prGroupList", prGroupList);
					model.addAttribute("pageInfo", pageInfo);
					
					return "product/product_popup_findgroup";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else { // 로그인X
				model.addAttribute("msg", "로그인 후 이용가능 합니다!");
				return "fail_back";
			}
			
		}
	//==========================================================================================================================
	
	//=================================== 팝업 : 품목 그룹 신규등록 : 재고 관리 권한 필요 ======================================
		@GetMapping(value = "/GrRegistPopUp.pr")
		public String registGroupPopUp(HttpSession session, Model model) {
			String sId = (String)session.getAttribute("sId");
			String priv_cd = (String)session.getAttribute("priv_cd");
			
			//로그인o vs 로그인x & if 로그인o -> 권한o vs 권한x
			if(sId != null) {
				//권한 판별
				int num = Integer.parseInt(priv_cd, 2);
				int cpriv_cd = 1; // 품목관리 권한 00001과 비교
				
				if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
					
					List<ProductGroupTopVO> prGrTopNameList = service.getPrGrTopNameList();	
					model.addAttribute("prGrTopNameList", prGrTopNameList);
					
					return "product/product_popup_group_regist";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용가능!");
				return "fail_back";
			} // ~~~~~~~~~~~~~~~~if-else end~~~~~~~~~~~~~~~~~~~
		}
	//==========================================================================================================================

	//================================= 팝업 : 품목 그룹 신규등록 처리 : 재고 관리 권한 필요 ===================================
		@PostMapping(value = "/GrRegistPopUpPro.pr")
		public String registGroupPopUpPro(@RequestParam String product_group_bottom_name,@RequestParam String product_group_top_name,  Model model) {
//			System.out.println("controller's product_group_bottom_name : " + product_group_bottom_name);
//			System.out.println("controller's product_group_top_name : " + product_group_top_name);
			
			// 상위그룹  이름으로 조회해서 조회가 안된다면 상위그룹 인서트 후 인서트한 상위그룹의 코드 조회 > 그다움 하위그룹 인서트 할거임
			
			// 상위 그룹 이름으로 테이블 조회하기
			int selectCount = service.getCount(product_group_top_name);
			
			// top name 으로 조회해서 조회가 안된다면(조회 결과가 1보다 작으면) > 상위그룹은 insert 하고 그 인서트 한 상위그룹의 이름으로 코드 조회 후 하위 그룹 인서트 하기
			if(selectCount < 1 ) { 
				int insertTopCount = service.registTopGroup(product_group_top_name);
//				System.out.println("controller : insert top group 결과 : " + insertTopCount);
				
			}
			// top name 으로 조회해서 조회가 된다면(조회 결과가 1보다 크거나 같으면) 상위그룹은 insert 안해도 됨. 상위그룹 코드 조회 후 하위그룹 인서트
			int product_group_top_cd = service.getCode(product_group_top_name);
//			System.out.println("controller : product group top의 코드 조회 결과 product_group_top_cd : " + product_group_top_cd);
			
			// 조회한 코드와 입력폼에서 입력받은 하위그룹 이름으로 product group 등록하기
			int insertBottomCount = service.registBottomGroup(product_group_top_cd, product_group_bottom_name);
//			System.out.println("controller : insert bottom group 결과 : " + insertBottomCount);
			
			if(insertBottomCount > 0) { // success
				return "redirect:/FindGroup.pr";
			} else { // fail
				model.addAttribute("msg", "품목 그룹 등록 실패!");
				return "fail_back";
			}
			
		}
	//==========================================================================================================================
		
	//========================= 팝업 : 거래처 찾기 : 재고조회 권한 필요(임시로 재고조회권한으로 함) ============================
		@GetMapping(value = "/FindClient.pr")
		public String findClient(@RequestParam(defaultValue = "") String searchType, 
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
					
					List<ClientVO> clientList = cservice.getClientList(searchType, keyword, startRow, listLimit);
					int listCount = cservice.getClientListCount(searchType, keyword);
					
					int pageListLimit = 10;
					int maxPage = listCount / listLimit + (listCount % listLimit != 0 ? 1 : 0);
					int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
					int endPage = startPage * pageListLimit - 1;
					
					if(endPage > maxPage) {
						endPage = maxPage;
					}
					
					PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
					
					model.addAttribute("clientList", clientList);
					model.addAttribute("pageInfo", pageInfo);
					
					return "product/product_popup_findclient";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else { // 로그인X
				model.addAttribute("msg", "로그인 후 이용가능 합니다!");
				return "fail_back";
			}
			
		}
	//==========================================================================================================================
	
	//===================================== 품목 상제정보와 수정폼 : 재고 관리 권한 필요 =======================================
		@GetMapping(value = "/ProductDetail.pr")
		public String prdetail(@RequestParam int product_cd, HttpSession session, Model model) {
			
			String sId = (String)session.getAttribute("sId");
			String priv_cd = (String)session.getAttribute("priv_cd");
//					System.out.println("session id : " + sId + ", priv_cd : " + priv_cd);  //--> 잘 뜸!
			
			//로그인o vs 로그인x & if 로그인o -> 권한o vs 권한x
			if(sId != null) {
				//권한 판별
				int num = Integer.parseInt(priv_cd, 2);
				int cpriv_cd = 1; // 품목관리 권한 00001과 비교
				
				if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
					ProductVO productInfo = service.getProductDetail(product_cd);
					model.addAttribute("productInfo", productInfo);
					
					//품목 리스트 셀렉트 박스에 출력
					List<ProductGroupBottomVO> prGrBottomNameList = service.getPrGrBottomNameList();	
					model.addAttribute("prGrBottomNameList", prGrBottomNameList);
					
					//거래처 리스트 셀렉트박스에 출력
					List<ClientVO> clientNameList = service.getClientNameList();
					model.addAttribute("clientNameList", clientNameList);
					
					return "product/product_modify";
				} else { // 권한 불일치시
					model.addAttribute("msg", "접근 권한 없음!");
					return "fail_back";
				}
			} else {
				model.addAttribute("msg", "로그인 후 이용가능!");
				return "fail_back";
			} // ~~~~~~~~~~~~~~~~if-else end~~~~~~~~~~~~~~~~~~~
			
		}
	//==========================================================================================================================	
		
	//=================================================== 품목 수정 처리 =======================================================
		@PostMapping(value = "/ProductModifyPro.pr")
		public String prModifyPro(@ModelAttribute ProductVO product, 
								@RequestParam(defaultValue = "") String purchasePrice, 
								@RequestParam(defaultValue = "") String sellingPrice, 
								HttpSession session, Model model) {
//			System.out.println(product);
			
			//------------------------------- 바코드 생성 ---------------------------------
			String bsCd = product.getBusiness_no().substring(3);
			
			String productGr = String.format("%04d", product.getProduct_group_bottom_cd());
			
//			System.out.println("substring 한 사업자등록번호 bsCd : " + bsCd);
			
//			System.out.println("0으로 채워지는 상품코드 productGr : " + productGr);
			
			String barcode = "880" + bsCd + productGr;
			
//			System.out.println("생성된 barcode : " + barcode);
			
			//vo 객체에 바코드 저장
			product.setBarcode(barcode);
			
			//-------------------------------입고단가, 판매단가 계산-------------------------------------
//			System.out.println("purchasePrice : " + purchasePrice);
//			System.out.println("sellingPrice : " + sellingPrice);
//			System.out.println("수량 : " + product.getUnit());
			
			// 나중에 추가한 컬럼이라서 코드 더럽습니다ㅜㅜ
			product.setPurchase_price(Integer.parseInt(purchasePrice));
			product.setSell_price(Integer.parseInt(sellingPrice));
			// ----------------------------------------------------------
			
			//불러온 가격 double 타입으로 계산, 수량도 걍 double로 바꾸기
			double units = Double.parseDouble(product.getUnit());
			
			double purchasePr = (Double.parseDouble(purchasePrice)) ;
			double sellingPr = (Double.parseDouble(sellingPrice)) ;
			
//			System.out.println("purchasePr : " + purchasePr);
//			System.out.println("sellingPr : " + sellingPr);
//			System.out.println("units : " + units);

			double in_unit_price = Double.parseDouble(String.format("%.2f", purchasePr / units));
			double out_unit_price = Double.parseDouble(String.format("%.2f", sellingPr / units));
//			System.out.println("최종으로 입력할(더블로 형변환 완, 코드 줄이는중) 단가 : " + in_unit_price + ", " + out_unit_price);
			
			//vo 객체에 입고단가, 판매단가 저장
			product.setIn_unit_price(in_unit_price);
			product.setOut_unit_price(out_unit_price);
			
			//--------------------------------- 사진등록 ---------------------------------
			String uploadDir = "/resources/upload";
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			Path path = Paths.get(saveDir);
			System.out.println("실제경로 : " + saveDir);
			
			try {
				Files.createDirectories(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			MultipartFile pFile = product.getFile();
			System.out.println("pFile : " + pFile); 
			
			// multipartFile 객체에서 파일명 꺼냄
			String photoFile = pFile.getOriginalFilename();
			System.out.println("photoFile : " + photoFile);
			//중복방지 처리
			String uploadFileName = "";
			if(!photoFile.equals("")) {
				String uuid = UUID.randomUUID().toString();
				System.out.println(uuid);
				uploadFileName = uuid + "_" + photoFile;
			}
			
			product.setProduct_image(uploadFileName);
			//--------------------------------- 진짜로 수정 처리^-^ ---------------------------------
			int updateProductCount = service.modifyProduct(product);
			
			if(updateProductCount > 0) { // success
				try {
					MultipartFile file = product.getFile();
					
					if(!file.getOriginalFilename().equals("")) {
						file.transferTo(
							new File(saveDir, product.getProduct_image())	
						);
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return "redirect:/ProductList.pr";
			} else { // fail
				model.addAttribute("msg", "수정 실패!");
				return "fail_back";
			} // if-else 끝

		}
	//==========================================================================================================================
	
	//========================================= 품목 삭제 처리 : 재고 관리 권한필요 ============================================
	@GetMapping(value = "/ProductDelete.pr")
	public String delete(@RequestParam String product_cd, Model model, HttpSession session) {
		System.out.println("전달받은 품목코드 : " + product_cd);
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 1; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
		
				String realFile = service.getRealFile(product_cd);
				System.out.println(realFile);
				int deleteCount = service.removeProduct(product_cd);
		
				if(deleteCount > 0) {// 삭제 성공
					//사진 파일 삭제도 해야함
					if(realFile != null || !realFile.equals("")) {
						String uploadDir = "/resources/upload"; // 가상의 업로드 경로(루트(webapp) 기준)
						String saveDir = session.getServletContext().getRealPath(uploadDir);
						
						Path path = Paths.get(saveDir + "/" + realFile);
						
						try {
							Files.deleteIfExists(path);
						} catch (IOException e1) {
							e1.printStackTrace();
						} // try-catch end
						
					} // if 파일 있을 경우 삭제 end
			
					return "redirect:/ProductList.pr";
					
				} else { // 삭제 실패
					model.addAttribute("msg", "품목 삭제 실패!");
					return "fail_back";
				} // if-else end
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		}  else {
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";	
		}
	}	
	//==========================================================================================================================
		
		
	} //================================================== product Controller ==================================================