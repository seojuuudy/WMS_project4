package com.itwillbs.wms4.controller;


import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.wms4.service.EmployeesService;
import com.itwillbs.wms4.vo.EmployeesVO;

@Controller
public class EmployeesController {
	
	@Autowired
	private EmployeesService service;
	
	@GetMapping(value = "LoginForm.em")
	public String login() {
		return "login_form";
	}
	
	@GetMapping(value = "LoginPro.em")
	public String loginPro(@ModelAttribute EmployeesVO employees, Model model, HttpSession session, 
			@RequestParam(defaultValue = "false") String rememberEmail, HttpServletResponse response,
			RedirectAttributes redirect) {
		
		System.out.println("rememberEmail - " + rememberEmail);
		
		
		// 암호화된 패스워드끼리 비교하기 위한 BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
		
		String passwd = service.getPasswd(employees.getEmp_email());
//		int idx = service.getIdx(employees.getEmp_email());
		
		if(passwd == null || !passwdEncoder.matches(employees.getEmp_passwd(), passwd)) {
			model.addAttribute("msg", "로그인 실패!");
			return "fail_back";
		} else {
			// 체크 박스 값이 true일 경우 쿠키에 이메일을 저장한 후 reseponse에도 쿠키 저장
			if(rememberEmail.equals("true")) {
				Cookie cookie = new Cookie("remembered_email", employees.getEmp_email());
				response.addCookie(cookie);
				System.out.println("쿠키 저장됨");
				// 체크 박스 값이 false일 경우 쿠키 삭제
			} else if (rememberEmail.equals("false")){
				Cookie cookie = new Cookie("remembered_email", employees.getEmp_email());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
			}
			session.setAttribute("sId", employees.getEmp_email());
//			model.addAttribute("idx", employees.getIdx());
//			if(idx != 0) {
//				redirect.addAttribute("idx", idx);
//			}
			
			return "redirect:/";
		}
		
		
	}
	
	@GetMapping(value = "/Logout.em")
	public String logout(HttpSession session) {
		// 세션 초기화
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping(value = "/Employee_detail_mini.em")
	public void detail_mini(@RequestParam String sId, Model model,
				HttpServletResponse response) {
		System.out.println(sId);
		EmployeesVO employees = service.getEmployee(sId);
		
		JSONObject jsonObject = new JSONObject(employees);
		System.out.println(jsonObject);
		
//		model.addAttribute("employees", employees);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
//		return "employees/employee_detail_mini";
	}
	
}
