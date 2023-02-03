package com.itwillbs.wms4.vo;

public class In_typeVO {
	
	private String in_type_cd;
	private String in_type_name;
	
	public In_typeVO() {
		super();
	}

	public In_typeVO(String in_type_cd, String in_type_name) {
		super();
		this.in_type_cd = in_type_cd;
		this.in_type_name = in_type_name;
	}

	public String getIn_type_cd() {
		return in_type_cd;
	}

	public void setIn_type_cd(String in_type_cd) {
		this.in_type_cd = in_type_cd;
	}

	public String getIn_type_name() {
		return in_type_name;
	}

	public void setIn_type_name(String in_type_name) {
		this.in_type_name = in_type_name;
	}

	@Override
	public String toString() {
		return "In_typeVO [in_type_cd=" + in_type_cd + ", in_type_name=" + in_type_name + "]";
	}
	
}
