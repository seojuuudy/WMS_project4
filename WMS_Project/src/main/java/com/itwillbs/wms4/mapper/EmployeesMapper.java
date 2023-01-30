package com.itwillbs.wms4.mapper;

import com.itwillbs.wms4.vo.EmployeesVO;

public interface EmployeesMapper {

	String selectPasswd(String emp_email);

	EmployeesVO selectEmployee(int idx);

	int selectIdx(String emp_email);

}
