package com.itwillbs.wms4.vo;

public class WorkVO {
	
//	CREATE TABLE work (
//			WORK_CD VARCHAR(10) NOT NULL,
//			WORK_TYPE VARCHAR(50) NOT NULL
//		);
	
	private String work_cd;
	private String work_type;
	
	public WorkVO() {
		super();
	}
	public WorkVO(String work_cd, String work_type) {
		super();
		this.work_cd = work_cd;
		this.work_type = work_type;
	}
	public String getWork_cd() {
		return work_cd;
	}
	public void setWork_cd(String work_cd) {
		this.work_cd = work_cd;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	@Override
	public String toString() {
		return "work [work_cd=" + work_cd + ", work_type=" + work_type + "]";
	}
	
	
	
}
