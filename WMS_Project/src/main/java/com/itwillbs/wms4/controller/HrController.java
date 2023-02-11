package com.itwillbs.wms4.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.wms4.service.HrService;
import com.itwillbs.wms4.service.MailService;
import com.itwillbs.wms4.vo.EmpInfoVO;
import com.itwillbs.wms4.vo.EmployeesVO;
import com.itwillbs.wms4.vo.PageInfo;

@Controller
public class HrController {
	
	@Autowired
	private HrService service;
	@Autowired
	private MailService mailService;
	
	// 사원 등록 폼
	@GetMapping(value = "/Regist.hr")
	public String hrRegist(@ModelAttribute EmployeesVO employees, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
				
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 4; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				return "hr/employee_regist";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 이메일 중복체크
	@ResponseBody
	@GetMapping(value = "/checkEmail.hr")
	public void checkEmail(@RequestParam("emp_email") String emp_email, HttpServletResponse response) {
		
		int count = service.getEmail(emp_email);
		if(count != 0) {
			try {
				response.getWriter().print("1");
				System.out.println("이미 사용되고 있단다");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 사원 등록을 위한 비지니스 로직 
	@PostMapping(value = "/RegistPro.hr")
	public String hrRegistPro(@ModelAttribute EmployeesVO employees, Model model, HttpSession session) {
		
		// 비즈니스 로직은 권한 부여 필요없음
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
        // ---------------------------------------------------
        // 임시 비밀번호 부여
 		UUID uid = UUID.randomUUID();
 		String emp_passwd = uid.toString().substring(0,6);
 		employees.setEmp_passwd(emp_passwd);
       
 		// 임시 비밀번호를 보낸 후 비밀번호 암호화
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
		employees.setEmp_passwd(passwdEncoder.encode(emp_passwd));
 		// ---------------------------------------------------
        // 사원 등록
 		int insertCount = service.registEmployee(employees);
 		
 		// 사원번호 업데이트
 		int updateCount = service.getEmp_num(employees);
		
		if(insertCount > 0 && updateCount > 0) { // 사원 등록 성공
			// ---------------------------------------------------
			// 사원 등록 성공시 임시 비밀번호 메일 보내기
			String addr = "brbr9667@gmail.com";
			String subject = "[WMS] 임시 비밀번호 발급";
			String body = employees.getEmp_name() + "님의 임시 비밀번호는 : " 
					+ emp_passwd + "입니다. 비밀번호를 변경하여 사용하세요.";
			employees.setEmp_email(employees.getEmp_email1() + '@' + employees.getEmp_email2());
			
			mailService.sendEmail(employees.getEmp_email(), addr, subject, body);
			// ---------------------------------------------------
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
				
				List<EmpInfoVO> empList = service.getEmpList(searchType, keyword, startRow, listLimit);
				
				int listCount = service.getEmpListCount(searchType, keyword);
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
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
		
	}
	
	// 사원 상세정보 조회
	@GetMapping(value = "/Detail.hr")
	public String hrDetail(String emp_email, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		// 해당 회원의 권한 조회
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 8; // 사원조회 권한 01000과 비교
					
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				
				EmployeesVO employees = service.getEmployeesInfo(emp_email);
				
				model.addAttribute("emp", employees);
				
				return "hr/employee_detail";
			} else { // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 사원정보 수정 폼 요청
	@GetMapping(value = "/Update.hr")
	public String updateEmployees(String emp_email, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) { // 로그인O
			// 해당 회원의 권한 가져오기
			String priv_cd = (String)session.getAttribute("priv_cd");
			// 문자열로 저장된 2진수 데이터 권한코드를 2진수로 변환
			int num = Integer.parseInt(priv_cd, 2);
			int cpriv_cd = 4; // 사원관리 권한 00100과 비교
			
			if((num & cpriv_cd) == cpriv_cd) { // 권한 일치시
				EmployeesVO employees = service.getEmployeesInfo(emp_email);
				model.addAttribute("emp", employees);
				return "hr/employee_modify";
			} else {  // 권한 불일치시
				model.addAttribute("msg", "접근 권한 없음!");
				return "fail_back";
			}
		} else { // 로그인X
			model.addAttribute("msg", "로그인 후 이용가능 합니다!");
			return "fail_back";
		}
	}
	
	// 사원정보 수정을 위한 비즈니스 로직 수행
		@PostMapping(value = "/UpdatePro.hr")
		public String updateEmployeesPro(@ModelAttribute EmployeesVO employees, Model model, HttpSession session) {
			
			String sId = (String)session.getAttribute("sId");
			
			// 권한번호 수정
			if(employees.getPriv_cd() != null && employees.getPriv_cd().equals("")) {
				
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
			}
	        
			// 사진 수정
	        String uploadDir = "/resources/upload";
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			Path path = Paths.get(saveDir);
//			System.out.println("실제경로 : " + saveDir);
			
			try {
				Files.createDirectories(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			MultipartFile pFile = employees.getFile();
			String photoFile = pFile.getOriginalFilename();
			System.out.println(photoFile);
			
			employees.setPhoto(photoFile);
	        
			// 사원 정보 업데이트
			int updateCount = service.modifyEmployees(employees);
			
			// 사원 번호 업데이트
			int updateCount2 = service.modifyEmp_num(employees);
			
			if(updateCount > 0 && updateCount2 > 0) { // 사원정보 수정 성공
		        
				// 수정 된 권한을 세션에 다시 저장
				if(sId == employees.getEmp_email()) { // 세션 아이디와 수정된 사원이 같을때
					session.setAttribute("priv_cd", employees.getPriv_cd());
				}
				return "redirect:/";
				
			} else { // 사원정보 수정 실패
				model.addAttribute("msg", "수정 실패!");
				return "fail_back";
			}
		}

	}
