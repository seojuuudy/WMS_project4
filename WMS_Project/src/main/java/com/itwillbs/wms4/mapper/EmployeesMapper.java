package com.itwillbs.wms4.mapper;

import com.itwillbs.wms4.vo.EmployeesVO;

public interface EmployeesMapper {

	String selectPasswd(String emp_email);

	EmployeesVO selectEmployee(String sId);

	int selectIdx(String emp_email);

}
