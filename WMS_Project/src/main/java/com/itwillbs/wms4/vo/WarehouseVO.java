package com.itwillbs.wms4.vo;

public class WarehouseVO {

//	CREATE TABLE warehouse (
//			WH_CD VARCHAR(10) NOT NULL,
//			WH_NAME VARCHAR(100) NOT NULL,
//			WH_GUBUN VARCHAR(1),
//			WH_LOCATION VARCHAR(1),
//			WH_ADDR VARCHAR(500),
//			WH_TEL VARCAHR(50),
//			WH_MAN_NAME VARCHAR(50),
//			WH_USE VARCHAR(1),
//			REMARKS VARCHAR(2000)
//		);
	
	private String wh_cd;
	private String wh_name;
	private String wh_gubun;
	private String wh_location;
	private String wh_addr;
	private String wh_tel;
	private String wh_man_name;
	private String wh_use;
	private String remarks;
	
	public WarehouseVO() {
		super();
	}

	public WarehouseVO(String wh_cd, String wh_name, String wh_gubun, String wh_location, String wh_addr, String wh_tel,
			String wh_man_name, String wh_use, String remarks) {
		super();
		this.wh_cd = wh_cd;
		this.wh_name = wh_name;
		this.wh_gubun = wh_gubun;
		this.wh_location = wh_location;
		this.wh_addr = wh_addr;
		this.wh_tel = wh_tel;
		this.wh_man_name = wh_man_name;
		this.wh_use = wh_use;
		this.remarks = remarks;
	}

	public String getWh_cd() {
		return wh_cd;
	}

	public void setWh_cd(String wh_cd) {
		this.wh_cd = wh_cd;
	}

	public String getWh_name() {
		return wh_name;
	}

	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}

	public String getWh_gubun() {
		return wh_gubun;
	}

	public void setWh_gubun(String wh_gubun) {
		this.wh_gubun = wh_gubun;
	}

	public String getWh_location() {
		return wh_location;
	}

	public void setWh_location(String wh_location) {
		this.wh_location = wh_location;
	}

	public String getWh_addr() {
		return wh_addr;
	}

	public void setWh_addr(String wh_addr) {
		this.wh_addr = wh_addr;
	}

	public String getWh_tel() {
		return wh_tel;
	}

	public void setWh_tel(String wh_tel) {
		this.wh_tel = wh_tel;
	}

	public String getWh_man_name() {
		return wh_man_name;
	}

	public void setWh_man_name(String wh_man_name) {
		this.wh_man_name = wh_man_name;
	}

	public String getWh_use() {
		return wh_use;
	}

	public void setWh_use(String wh_use) {
		this.wh_use = wh_use;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "WarehouseVO [wh_cd=" + wh_cd + ", wh_name=" + wh_name + ", wh_gubun=" + wh_gubun + ", wh_location="
				+ wh_location + ", wh_addr=" + wh_addr + ", wh_tel=" + wh_tel + ", wh_man_name=" + wh_man_name
				+ ", wh_use=" + wh_use + ", remarks=" + remarks + "]";
	}
	
	
}
