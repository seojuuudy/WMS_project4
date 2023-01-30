package com.itwillbs.wms4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.EmpInfoVO;
import com.itwillbs.wms4.vo.EmployeesVO;

public interface HrMapper {

	// 사원 등록
	// 파라미터 : EmployeesVO 객체, 리턴타입 : int
	public int insertEmployee(EmployeesVO employees);

	// 사원 번호
	public int updateEmp_num(EmployeesVO employees);

	// 사원 목록 조회
	public List<EmpInfoVO> selectEmpList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 재직중인 사원 수 조회
	public int selectEmpListCount(String keyword);

	// 사원 상세정보 조회
	public EmployeesVO selectEmpInfo(String emp_email);

	// 사원 정보 수정
	public int updateEmployees(EmployeesVO employees);
	
	// 사원 정보수정 시 사원번호 수정
	public int modifyEmp_num(EmployeesVO employees);
}
