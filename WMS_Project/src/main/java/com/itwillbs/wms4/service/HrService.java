package com.itwillbs.wms4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.HrMapper;
import com.itwillbs.wms4.vo.EmpInfoVO;
import com.itwillbs.wms4.vo.EmployeesVO;

@Service
public class HrService {
	
	@Autowired
	private HrMapper mapper;

	// 사원 등록
	// 파라미터 : EmployeesVO 객체, 리턴타입 : int
	public int registEmployee(EmployeesVO employees) {
		return mapper.insertEmployee(employees);
	}

	// 사원 번호
	public int getEmp_num(EmployeesVO employees) {
		return mapper.updateEmp_num(employees);
	}
	
	// 사원 목록 조회
	public List<EmpInfoVO> getEmpList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectEmpList(searchType, keyword, startRow, listLimit);
	}
	
	// 재직중인 사원 수 조회
	public int getEmpListCount(String keyword) {
		return mapper.selectEmpListCount(keyword);
	}

	// 사원 상세정보 조회
	public EmployeesVO getEmployeesInfo(String emp_email) {
		return mapper.selectEmpInfo(emp_email);
	}

	// 사원 정보 수정
	public int modifyEmployees(EmployeesVO employees) {
		return mapper.updateEmployees(employees);
	}
	
	// 사원 정보수정 시 사원번호 수정
	public int modifyEmp_num(EmployeesVO employees) {
		return mapper.modifyEmp_num(employees);
	}

	// 사원 등록시 이메일 중복검사 
	public int getEmail(String emp_email) {
		return mapper.checkEmail(emp_email);
	}	

}
