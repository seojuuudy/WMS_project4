package com.itwillbs.wms4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.EmployeesMapper;
import com.itwillbs.wms4.vo.EmployeesVO;

@Service
public class EmployeesService {

	@Autowired
	private EmployeesMapper mapper;

	public String getPasswd(String emp_email) {
		return mapper.selectPasswd(emp_email);
	}
	
	public int getIdx(String emp_email) {
		return mapper.selectIdx(emp_email);
	}

	public EmployeesVO getEmployee(int idx) {
		return mapper.selectEmployee(idx);
	}


	
}
