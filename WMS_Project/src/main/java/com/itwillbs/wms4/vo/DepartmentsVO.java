package com.itwillbs.wms4.vo;

public class DepartmentsVO {
//	CREATE TABLE departments (
//			DEPT_CD VARCHAR(10) NOT NULL,
//			DEPT_NAME VARCHAR(100) NOT NULL
//		);
	
	private String dept_cd;
	private String dept_name;
	
	public DepartmentsVO() {
		super();
	}

	public DepartmentsVO(String dept_cd, String dept_name) {
		super();
		this.dept_cd = dept_cd;
		this.dept_name = dept_name;
	}

	public String getDept_cd() {
		return dept_cd;
	}

	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "DepartmentsVO [dept_cd=" + dept_cd + ", dept_name=" + dept_name + "]";
	}
	
	
	
}
