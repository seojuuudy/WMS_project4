package com.itwillbs.wms4.vo;

public class StockVO {
	
	private int stock_cd;
	private int product_cd;
	private int wh_loc_in_area_cd;
	private int stock_qty;
	
	public StockVO() {
		super();
	}

	public StockVO(int stock_cd, int product_cd, int wh_loc_in_area_cd, int stock_qty) {
		super();
		this.stock_cd = stock_cd;
		this.product_cd = product_cd;
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
		this.stock_qty = stock_qty;
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

	@Override
	public String toString() {
		return "StockVO [stock_cd=" + stock_cd + ", product_cd=" + product_cd + ", wh_loc_in_area_cd="
				+ wh_loc_in_area_cd + ", stock_qty=" + stock_qty + "]";
	}
	
}
