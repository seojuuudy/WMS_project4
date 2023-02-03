package com.itwillbs.wms4.vo;

public class WhIocationVO {
	
	private int wh_area_cd;
	private String wh_loc_in_area;
	private String wh_loc_in_area_cd;
	
	public WhIocationVO() {
		super();
	}

	public WhIocationVO(int wh_area_cd, String wh_loc_in_area, String wh_loc_in_area_cd) {
		super();
		this.wh_area_cd = wh_area_cd;
		this.wh_loc_in_area = wh_loc_in_area;
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}

	public int getWh_area_cd() {
		return wh_area_cd;
	}

	public void setWh_area_cd(int wh_area_cd) {
		this.wh_area_cd = wh_area_cd;
	}

	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}

	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}

	public String getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}

	public void setWh_loc_in_area_cd(String wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}

	@Override
	public String toString() {
		return "WhInnerAreaVO [wh_area_cd=" + wh_area_cd + ", wh_loc_in_area=" + wh_loc_in_area + ", wh_loc_in_area_cd="
				+ wh_loc_in_area_cd + "]";
	}
	
	
}
