package com.itwillbs.wms4.vo;

// 재고검색 view
public class V_StockinfoVO {
	private int stock_cd;
	private int product_cd;
	private int wh_loc_in_area_cd;
	private int stock_qty;
	private String product_name;
	private String wh_loc_in_area;
	private String in_schedule_cd;
	private String wh_area;
	private int wh_area_cd;
	
	public V_StockinfoVO() {
		super();
	}

	public V_StockinfoVO(int stock_cd, int product_cd, int wh_loc_in_area_cd, int stock_qty, String product_name,
			String wh_loc_in_area, String in_schedule_cd, String wh_area, int wh_area_cd) {
		super();
		this.stock_cd = stock_cd;
		this.product_cd = product_cd;
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
		this.stock_qty = stock_qty;
		this.product_name = product_name;
		this.wh_loc_in_area = wh_loc_in_area;
		this.in_schedule_cd = in_schedule_cd;
		this.wh_area = wh_area;
		this.wh_area_cd = wh_area_cd;
	}

	public int getStock_cd() {
		return stock_cd;
	}

	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}

	public int getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}

	public int getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}

	public void setWh_loc_in_area_cd(int wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}

	public int getStock_qty() {
		return stock_qty;
	}

	public void setStock_qty(int stock_qty) {
		this.stock_qty = stock_qty;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}

	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}

	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}

	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
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
		return "StockinfoVO [stock_cd=" + stock_cd + ", product_cd=" + product_cd + ", wh_loc_in_area_cd="
				+ wh_loc_in_area_cd + ", stock_qty=" + stock_qty + ", product_name=" + product_name
				+ ", wh_loc_in_area=" + wh_loc_in_area + ", in_schedule_cd=" + in_schedule_cd + ", wh_area=" + wh_area
				+ ", wh_area_cd=" + wh_area_cd + "]";
	}

}
