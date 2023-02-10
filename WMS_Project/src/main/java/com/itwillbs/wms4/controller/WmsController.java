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

import com.itwillbs.wms4.service.WmsService;
import com.itwillbs.wms4.vo.PageInfo;
import com.itwillbs.wms4.vo.StockVO;
import com.itwillbs.wms4.vo.WarehouseVO;
import com.itwillbs.wms4.vo.WhAreaVO;
import com.itwillbs.wms4.vo.WhLocationVO;

@Controller
public class WmsController {

	@Autowired
	private WmsService service;
	// 전체 창고,구역,위치 목록 + 전체 재고목록 조회 (재직중인 사원만 조회)
	@GetMapping(value = "/Wh.wms")
	public String whWms(Model model, @RequestParam(defaultValue = "") String searchArea,
			@RequestParam(defaultValue = "") String searchLocation,
			@RequestParam(defaultValue = "") String searchGo,
			@RequestParam(defaultValue = "1") int pageNum, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 8; // 사원조회 권한 01000과 비교
				
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				int listLimit = 10;
				int startRow = (pageNum-1) * listLimit;

				List<StockVO> stList = service.getStockList(searchArea, searchLocation, searchGo, startRow, listLimit);
				
				int listCount = service.getStockListCount(searchArea, searchLocation, searchGo);
				System.out.println("listCount : "+listCount);
				int pageListLimit = 8;
				int maxPage = listCount/listLimit + (listCount%listLimit!=0? 1 : 0);
				int startPage = (pageNum-1) / pageListLimit * pageListLimit + 1;
				int endPage = startPage * pageListLimit - 1;
				
				if(endPage>maxPage) {
					endPage = maxPage;
				}
				
				// PageInfo 객체 생성 후 페이징 처리 정보 저장
				PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
				List<WarehouseVO> whList = service.getWhList();
				List<WhAreaVO> arList = service.getAreaList(searchArea);
				List<WhLocationVO> loList = service.getLocationList(searchArea, searchLocation);
				model.addAttribute("loList",loList);
				model.addAttribute("pageInfo", pageInfo);				
				model.addAttribute("whList",whList);
				model.addAttribute("arList",arList);
				model.addAttribute("stList",stList);
				
				return "wms/wh_wms";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
		
	}
	
	
	//삭제**************************************************
	//구역명 삭제
	@GetMapping("/AreaDelete.wms")
	public String areaDelete(HttpSession session, 
			@ModelAttribute WhAreaVO area, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		// 1. 세션 아이디가 없을 경우 "잘못된 접근"
		if(sId == null || sId.equals("")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
			int deleteCount = service.removeArea(area.getWh_area_cd());
			
			if(deleteCount > 0) { // 성공
				return "redirect:/Wh.wms";
			} else { // 실패
				model.addAttribute("msg", "구역명 삭제 실패!");
				return "fail_back";
			}
		}
	}
	//위치명 삭제
	@GetMapping("/LocDelete.wms")
	public String locationDelete(HttpSession session, 
			@ModelAttribute WhLocationVO location, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		// 1. 세션 아이디가 없을 경우 "잘못된 접근"
		if(sId == null || sId.equals("")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		} else {
			int deleteCount = service.removeLocation(location.getWh_loc_in_area_cd());
			
			if(deleteCount > 0) { // 성공
				return "redirect:/Wh.wms";
			} else { // 실패
				model.addAttribute("msg", "위치명 삭제 실패!");
				return "fail_back";
			}
		}
	}
		
	
	//수정**************************************************
	//구역명 수정 폼
	// 사원정보 수정 폼 요청
	@GetMapping(value = "/UpdateArea.wms")
	public String areaUpdate(@ModelAttribute WhAreaVO area, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 4; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				return "wms/area_modify";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	//위치명 수정 폼
	@GetMapping(value = "/UpdateLoc.wms")
	public String locationUpdate(@ModelAttribute WhLocationVO location, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 4; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				return "wms/loc_modify";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	//구역수정 비즈니스 로직
	// 사원정보 수정을 위한 비즈니스 로직 수행
	@PostMapping(value = "/UpdateAreaPro.wms")
	public String areaUpdatePro(@ModelAttribute WhAreaVO area, Model model, HttpSession session) {
		
		int updateCount = service.modifyArea(area);

		if(updateCount > 0) { // 성공
			return "redirect:/Wh.wms";
		} else { // 실패
			model.addAttribute("msg", "구역명 수정 실패!");
			return "fail_back";
		}
	}	
	//위치수정 비즈니스 로직
	@PostMapping(value = "/UpdateLocPro.wms")
	public String locationUpdatePro(@ModelAttribute WhLocationVO location, Model model, HttpSession session) {
		
		int updateCount = service.modifyLocation(location);

		if(updateCount > 0) { // 성공
			return "redirect:/Wh.wms";
		} else { // 실패
			model.addAttribute("msg", "위치명 수정 실패!");
			return "fail_back";
		}
	}
	
	// 등록*************************************************
	// 구역 등록 폼
	@GetMapping(value = "/RegistArea.wms")
	public String areaRegist(@ModelAttribute WhAreaVO area, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
				
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 4; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				return "wms/area_regist";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	// 위치 등록 폼
	@GetMapping(value = "/RegistLoc.wms")
	public String locationRegist(@ModelAttribute WhLocationVO location, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
				
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 4; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				return "wms/loc_regist";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	//구역등록 비즈니스 로직
	@PostMapping(value = "/RegistAreaPro.wms")
	public String areaRegistPro(@ModelAttribute WhAreaVO area, Model model, HttpSession session) {
		int insertCount = service.registArea(area);

		if(insertCount > 0) { // 성공
			return "redirect:/Wh.wms";
		} else { // 실패
			model.addAttribute("msg", "구역 등록 실패!");
			return "fail_back";
		}
	}
	//위치등록 비즈니스 로직
	@PostMapping(value = "/RegistLocPro.wms")
	public String locRegistPro(@ModelAttribute WhLocationVO loc, Model model, HttpSession session) {
		int insertCount = service.registLocation(loc);
		
		if(insertCount > 0) { // 성공
			return "redirect:/Wh.wms";
		} else { // 실패
			model.addAttribute("msg", "위치 등록 실패!");
			return "fail_back";
		}
	}
}
