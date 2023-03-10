package com.itwillbs.wms4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.wms4.service.ClientService;
import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.EmployeesVO;
import com.itwillbs.wms4.vo.PageInfo;

@Controller
public class ClientController {

	@Autowired
	private ClientService service;
	
	@GetMapping(value = "/ClientList.cl") // 거래처 목록조회
	public String clientList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum,
			HttpSession session,
			Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		// 해당 회원의 권한 조회
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 2; // 재고 조회 권한 00010과 비교
			
		if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시	
		// ---------------------------------------------------------------------------
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
//				System.out.println("startRow = " + startRow);
		// ---------------------------------------------------------------------------
		// Service 객체의 getClientList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수   
		// => 리턴타입 : List<ClientVO> clientList
		List<ClientVO> clientList = service.getClientList(searchType, keyword, startRow, listLimit);
		// ---------------------------------------------------------------------------
		// 페이징 처리
		int listCount = service.getClientListCount(searchType, keyword);
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
		model.addAttribute("clientList", clientList);
		model.addAttribute("pageInfo", pageInfo);
		
		System.out.println("clientList " + clientList);
		
		return "client/clientList";
			} else {
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인 X 
		
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}

	@GetMapping(value = "/ClientRegist.cl") // 거래처 등록폼
	public String clientRegist() {
		
		return "client/clientRegist";
	}

	@GetMapping(value = "/ClientRegistPro.cl") // 거래처 등록작업
	public String clientRegistPro(@ModelAttribute ClientVO client, Model model, HttpSession session) {
		
		System.out.println(client);
		String sId = (String)session.getAttribute("sId");
		// 해당 회원의 권한 조회
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 3; // 재고 조회, 재고 관리 권한 00011과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
			
			client.setUptae(client.getUptae().replaceAll(",", "/"));
			client.setJongmok(client.getJongmok().replaceAll(",", "/"));
			int insertCount = service.registClient(client);
			// 등록 성공/실패에 따른 포워딩 작업 수행
				if(insertCount > 0) { // 성공
					
					return "redirect:/ClientList.cl";
				} else { // 실패
					// "msg" 속성명으로 "글 쓰기 실패!" 메세지 전달 후 fail_back 포워딩
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
	// 거래처 상세정보
	@GetMapping(value = "/ClientDetail.cl")
	public String clientDetail(
			@RequestParam(defaultValue = "") String business_no, 
			@RequestParam(defaultValue = "") String cust_name, 
			HttpSession session,
			Model model
			) {
		String sId = (String)session.getAttribute("sId");
		// 해당 회원의 권한 조회
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 3; // 재고 조회, 재고 관리 권한 00011과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				ClientVO client = service.getClient(business_no, cust_name);
				System.out.println(client);
				
				model.addAttribute("client", client);
				return "client/clientDetail";
			} else { // 권한 불일치
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}	
		} else { // 로그인 X 
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}	
	}	
	
	// 거래처 수정
	@PostMapping(value = "/ClientModify.cl")
	public String clientModify(
			@ModelAttribute ClientVO client,
			HttpSession session,
			Model model
			) {
		String sId = (String)session.getAttribute("sId");
		// 해당 회원의 권한 조회
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 3; // 재고 조회, 재고 관리 권한 00011과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
					
		//		System.out.println("수정하기전 " + client);
				client.setUptae(client.getUptae().replaceAll(",", "/"));
				client.setJongmok(client.getJongmok().replaceAll(",", "/"));
				int updateCount = service.clientModify(client);
		//		System.out.println("수정후 "+ client);
				if(updateCount > 0) {
					return "redirect:/ClientList.cl";
				} else {
					model.addAttribute("msg", "수정 실패!");
					return "fail_back";
				}
			}  else { // 권한 불일치
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}	
		} else { // 로그인 X 
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}	
	}	
	
	// 거래처 삭제
	@GetMapping(value = "/ClientDelete.cl")
	public String clientDelete(
			HttpSession session, @ModelAttribute ClientVO client, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null) { // 로그인 O
			String priv_cd = (String)session.getAttribute("priv_cd");
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 3; // 재고 조회, 재고 관리 권한 00011과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				service.removeClient(client);
				return "redirect:/ClientList.cl";
			} else { // 권한 불일치
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}	
		} else { // 로그인 X 
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}	
	}
	
	@GetMapping(value="/CheckBusinessNo.cl")
	public void checkBusinessNo(
			@RequestParam(defaultValue = "") String business_no,
			@RequestParam(defaultValue = "") String cust_name,
			Model model,
			HttpServletResponse response) 
			{
		ClientVO isBusinessNo = service.getClient(business_no, cust_name);
		if(isBusinessNo == null) {
			System.out.println("거래처코드 조회 완료");
			System.out.println("check isBusinessNo : " + isBusinessNo);
			try {
				response.getWriter().print("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
