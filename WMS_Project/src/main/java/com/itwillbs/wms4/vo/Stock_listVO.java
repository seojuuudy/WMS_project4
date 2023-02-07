package com.itwillbs.wms4.vo;

public class Stock_listVO {
	
	private int stock_cd;
	private int product_cd;
	private int wh_loc_in_area_cd;
	private int stock_qty;
	private String product_name;
	private String size_des;
	private String wh_name;
	private String wh_area;
	private String wh_loc_in_area;
	
	public Stock_listVO() {
		super();
	}

	public Stock_listVO(int stock_cd, int product_cd, int wh_loc_in_area_cd, int stock_qty, String product_name,
			String size_des, String wh_name, String wh_area, String wh_loc_in_area) {
		super();
		this.stock_cd = stock_cd;
		this.product_cd = product_cd;
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
		this.stock_qty = stock_qty;
		this.product_name = product_name;
		this.size_des = size_des;
		this.wh_name = wh_name;
		this.wh_area = wh_area;
		this.wh_loc_in_area = wh_loc_in_area;
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

	public String getSize_des() {
		return size_des;
	}

	public void setSize_des(String size_des) {
		this.size_des = size_des;
	}

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

	@Override
	public String toString() {
		return "Stock_listVO [stock_cd=" + stock_cd + ", product_cd=" + product_cd + ", wh_loc_in_area_cd="
				+ wh_loc_in_area_cd + ", stock_qty=" + stock_qty + ", product_name=" + product_name + ", size_des="
				+ size_des + ", wh_name=" + wh_name + ", wh_area=" + wh_area + ", wh_loc_in_area=" + wh_loc_in_area
				+ "]";
	}

	
}
