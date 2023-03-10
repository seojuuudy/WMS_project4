package com.itwillbs.wms4.mapper;

import com.itwillbs.wms4.vo.Employee_detailVO;
import com.itwillbs.wms4.vo.EmployeesVO;

public interface EmployeesMapper {

	String selectPasswd(String emp_email);

	Employee_detailVO selectEmployee(String sId);

	int selectIdx(String emp_email);

	// 해당 회원의 권한 조회 
	public String selectPriv_cd(String emp_email);

	// 사이드바 사진 출력
	String selectPhoto(String emp_email);
}
