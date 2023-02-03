package com.itwillbs.wms4.vo;

public class Stock_workVO {
	
	private String work_type_cd;
	private String work_type_name;
	
	public Stock_workVO() {
		super();
	}

	public Stock_workVO(String work_type_cd, String work_type_name) {
		super();
		this.work_type_cd = work_type_cd;
		this.work_type_name = work_type_name;
	}

	public String getWork_type_cd() {
		return work_type_cd;
	}

	public void setWork_type_cd(String work_type_cd) {
		this.work_type_cd = work_type_cd;
	}

	public String getWork_type_name() {
		return work_type_name;
	}

	public void setWork_type_name(String work_type_name) {
		this.work_type_name = work_type_name;
	}

	@Override
	public String toString() {
		return "Stock_workVO [work_type_cd=" + work_type_cd + ", work_type_name=" + work_type_name + "]";
	}
	
}
