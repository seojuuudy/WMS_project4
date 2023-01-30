package com.itwillbs.wms4.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.wms4.service.HrService;
import com.itwillbs.wms4.vo.EmpInfoVO;
import com.itwillbs.wms4.vo.EmployeesVO;
import com.itwillbs.wms4.vo.PageInfo;

@Controller
public class HrController {
	
	@Autowired
	private HrService service;
	
	// 사원 등록 폼
	@GetMapping(value = "/Regist.hr")
	public String hrRegist() {
		return "hr/employee_regist";
	}
	
	// 사원 등록을 위한 비지니스 로직
	@PostMapping(value = "/RegistPro.hr")
	public String hrRegistPro(@ModelAttribute EmployeesVO employees, Model model, HttpSession session) {
		
		// 사원 사진 업로드 기능
		String uploadDir = "/resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		Path path = Paths.get(saveDir);
//		System.out.println("실제경로 : " + saveDir);
		
		try {
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MultipartFile pFile = employees.getFile();
		String photoFile = pFile.getOriginalFilename();
		System.out.println(photoFile);
		
		employees.setPhoto(photoFile);
		
		// 권한번호 부여
		int sum = 0;
		String privCd = "";
		String[] arr = employees.getPriv_cd().split(",");
		int[] privArr = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
		
		for(int i = 0; i < privArr.length; i++) {
			System.out.println(privArr[i]);
			sum += privArr[i];
			System.out.println(sum);
		}
		
		privCd = String.format("%5s", Integer.toBinaryString(sum)).replaceAll(" ", "0");
        employees.setPriv_cd(privCd);
        
        // 사원 등록
 		int insertCount = service.registEmployee(employees);
 		
 		// 사원번호 업데이트
 		int updateCount = service.getEmp_num(employees);
		
		if(insertCount > 0 && updateCount > 0) { // 사원 등록 성공
			try {
				MultipartFile file = employees.getFile();
				
				if(!file.getOriginalFilename().equals("")) {
					file.transferTo(
						new File(saveDir, employees.getPhoto())	
					);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return "redirect:/List.hr";
		} else { // 사원 등록 실패
			model.addAttribute("msg", "사원 등록 실패!");
			return "fail_back";
		}
	}
	
	// 사원 목록 (재직중인 사원만 조회)
	@GetMapping(value = "/List.hr")
	public String hrList(Model model, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum) {
		
		int listLimit = 10;
		int startRow = (pageNum-1) * listLimit;
		
		List<EmpInfoVO> empList = service.getEmpList(searchType, keyword, startRow, listLimit);
		
		int listCount = service.getEmpListCount(keyword);
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
		
		return "hr/employee_list";
	}
	
	// 사원 상세정보 조회
	@GetMapping(value = "/Detail.hr")
	public String hrDetail(String emp_email, HttpSession session, Model model) {
//		String sId = (String)session.getAttribute("sId");
		
		// 추후 권한에 따라 조회 가능여부 판별 기능 필요
		EmployeesVO employees = service.getEmployeesInfo(emp_email);
		
		model.addAttribute("emp", employees);
		
		return "hr/employee_detail";
	}
	
	// 사원정보 수정 폼 요청
	@GetMapping(value = "/Update.hr")
	public String updateEmployees(String emp_email, Model model) {
		
		EmployeesVO employees = service.getEmployeesInfo(emp_email);
		model.addAttribute("emp", employees);
		
		return "hr/employee_modify";
	}
	
	// 사원정보 수정을 위한 비즈니스 로직 수행
	@PostMapping(value = "/UpdatePro.hr")
	public String updateEmployeesPro(@ModelAttribute EmployeesVO employees, Model model) {
		
		// 사원 정보 업데이트
		int updateCount = service.modifyEmployees(employees);
		
		// 사원 번호 업데이트
		int updateCount2 = service.modifyEmp_num(employees);
		
		if(updateCount > 0 && updateCount2 > 0) { // 사원정보 수정 성공
			return "redirect:/";
			
		} else { // 사원정보 수정 실패
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}

}
