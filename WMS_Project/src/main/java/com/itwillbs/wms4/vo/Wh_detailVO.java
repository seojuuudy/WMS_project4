package com.itwillbs.wms4.vo;

public class Wh_detailVO {
	private String wh_name;
	private String wh_area;
	private String wh_loc_in_area;
	private int wh_loc_in_area_cd;
	
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public String getWh_area() {
		return wh_area;
	}
	public void setWh_area(String wh_area) {
		this.wh_area = wh_area;
	}
	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}
	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}
	public int getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}
	public void setWh_loc_in_area_cd(int wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}
	@Override
	public String toString() {
		return "Wh_detailVO [wh_name=" + wh_name + ", wh_area=" + wh_area + ", wh_loc_in_area=" + wh_loc_in_area
				+ ", wh_loc_in_area_cd=" + wh_loc_in_area_cd + "]";
	}
	
	
}
