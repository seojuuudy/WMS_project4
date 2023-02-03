package com.itwillbs.wms4.vo;

public class WhAreaVO {
	
	private String wh_cd;
	private String wh_area;
	private int wh_area_cd;
	
	public WhAreaVO() {
		super();
	}

	public WhAreaVO(String wh_cd, String wh_area, int wh_area_cd) {
		super();
		this.wh_cd = wh_cd;
		this.wh_area = wh_area;
		this.wh_area_cd = wh_area_cd;
	}

	public String getWh_cd() {
		return wh_cd;
	}

	public void setWh_cd(String wh_cd) {
		this.wh_cd = wh_cd;
	}

	public String getWh_area() {
		return wh_area;
	}

	public void setWh_area(String wh_area) {
		this.wh_area = wh_area;
	}

	public int getWh_area_cd() {
		return wh_area_cd;
	}

	public void setWh_area_cd(int wh_area_cd) {
		this.wh_area_cd = wh_area_cd;
	}

	@Override
	public String toString() {
		return "WhAreaVO [wh_cd=" + wh_cd + ", wh_area=" + wh_area + ", wh_area_cd=" + wh_area_cd + "]";
	}
	
	
}
