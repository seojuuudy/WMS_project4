package com.itwillbs.wms4.vo;

public class PrivilegeVO {
//	CREATE TABLE privilege (
//			PRIV_CD VARCHAR(10) NOT NULL,
//			PRIV_TYPE VARCHAR(50) NOT NULL
//		);
	
	private String priv_cd;
	private String priv_type;
	
	public PrivilegeVO() {
		super();
	}

	public PrivilegeVO(String priv_cd, String priv_type) {
		super();
		this.priv_cd = priv_cd;
		this.priv_type = priv_type;
	}

	public String getPriv_cd() {
		return priv_cd;
	}

	public void setPriv_cd(String priv_cd) {
		this.priv_cd = priv_cd;
	}

	public String getPriv_type() {
		return priv_type;
	}

	public void setPriv_type(String priv_type) {
		this.priv_type = priv_type;
	}

	@Override
	public String toString() {
		return "PrivilegeVO [priv_cd=" + priv_cd + ", priv_type=" + priv_type + "]";
	}
	
}
