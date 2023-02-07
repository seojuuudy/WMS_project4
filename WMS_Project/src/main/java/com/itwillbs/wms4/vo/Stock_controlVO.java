package com.itwillbs.wms4.vo;

import java.util.Arrays;

public class Stock_controlVO {
	private int stock_cd;
	private String product_name;
	private String size_des;
	private String wh_area;
	private String wh_loc_in_area;
	private int stock_qty;
	private int control_qty;
	private int moving_stock_cd;
	private int stock_qty_sum;
	private int moving_qty;
	private String remarks;
	
	private String[] product_name_arr;
	private String[] size_des_arr;
	private String[] wh_area_arr;
	private String[] wh_loc_in_area_arr;
	private int[] stock_qty_arr;
	private int[] control_qty_arr;
	private int[] moving_stock_cd_arr;
	private int[] stock_qty_sum_arr;
	private int[] moving_qty_arr;
	private String[] remarks_arr;
	private int[] stock_cd_arr;
	
	public int getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
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
	public int getStock_qty() {
		return stock_qty;
	}
	public void setStock_qty(int stock_qty) {
		this.stock_qty = stock_qty;
	}
	public int getControl_qty() {
		return control_qty;
	}
	public void setControl_qty(int control_qty) {
		this.control_qty = control_qty;
	}
	public int getMoving_stock_cd() {
		return moving_stock_cd;
	}
	public void setMoving_stock_cd(int moving_stock_cd) {
		this.moving_stock_cd = moving_stock_cd;
	}
	public int getStock_qty_sum() {
		return stock_qty_sum;
	}
	public void setStock_qty_sum(int stock_qty_sum) {
		this.stock_qty_sum = stock_qty_sum;
	}
	public int getMoving_qty() {
		return moving_qty;
	}
	public void setMoving_qty(int moving_qty) {
		this.moving_qty = moving_qty;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String[] getProduct_name_arr() {
		return product_name_arr;
	}
	public void setProduct_name_arr(String[] product_name_arr) {
		this.product_name_arr = product_name_arr;
	}
	public String[] getSize_des_arr() {
		return size_des_arr;
	}
	public void setSize_des_arr(String[] size_des_arr) {
		this.size_des_arr = size_des_arr;
	}
	public String[] getWh_area_arr() {
		return wh_area_arr;
	}
	public void setWh_area_arr(String[] wh_area_arr) {
		this.wh_area_arr = wh_area_arr;
	}
	public String[] getWh_loc_in_area_arr() {
		return wh_loc_in_area_arr;
	}
	public void setWh_loc_in_area_arr(String[] wh_loc_in_area_arr) {
		this.wh_loc_in_area_arr = wh_loc_in_area_arr;
	}
	public int[] getStock_qty_arr() {
		return stock_qty_arr;
	}
	public void setStock_qty_arr(int[] stock_qty_arr) {
		this.stock_qty_arr = stock_qty_arr;
	}
	public int[] getControl_qty_arr() {
		return control_qty_arr;
	}
	public void setControl_qty_arr(int[] control_qty_arr) {
		this.control_qty_arr = control_qty_arr;
	}
	public int[] getMoving_stock_cd_arr() {
		return moving_stock_cd_arr;
	}
	public void setMoving_stock_cd_arr(int[] moving_stock_cd_arr) {
		this.moving_stock_cd_arr = moving_stock_cd_arr;
	}
	public int[] getStock_qty_sum_arr() {
		return stock_qty_sum_arr;
	}
	public void setStock_qty_sum_arr(int[] stock_qty_sum_arr) {
		this.stock_qty_sum_arr = stock_qty_sum_arr;
	}
	public int[] getMoving_qty_arr() {
		return moving_qty_arr;
	}
	public void setMoving_qty_arr(int[] moving_qty_arr) {
		this.moving_qty_arr = moving_qty_arr;
	}
	public String[] getRemarks_arr() {
		return remarks_arr;
	}
	public void setRemarks_arr(String[] remarks_arr) {
		this.remarks_arr = remarks_arr;
	}
	public int[] getStock_cd_arr() {
		return stock_cd_arr;
	}
	public void setStock_cd_arr(int[] stock_cd_arr) {
		this.stock_cd_arr = stock_cd_arr;
	}
	@Override
	public String toString() {
		return "Stock_controlVO [stock_cd=" + stock_cd + ", product_name=" + product_name + ", size_des=" + size_des
				+ ", wh_area=" + wh_area + ", wh_loc_in_area=" + wh_loc_in_area + ", stock_qty=" + stock_qty
				+ ", control_qty=" + control_qty + ", moving_stock_cd=" + moving_stock_cd + ", stock_qty_sum="
				+ stock_qty_sum + ", moving_qty=" + moving_qty + ", remarks=" + remarks + ", product_name_arr="
				+ Arrays.toString(product_name_arr) + ", size_des_arr=" + Arrays.toString(size_des_arr)
				+ ", wh_area_arr=" + Arrays.toString(wh_area_arr) + ", wh_loc_in_area_arr="
				+ Arrays.toString(wh_loc_in_area_arr) + ", stock_qty_arr=" + Arrays.toString(stock_qty_arr)
				+ ", control_qty_arr=" + Arrays.toString(control_qty_arr) + ", moving_stock_cd_arr="
				+ Arrays.toString(moving_stock_cd_arr) + ", stock_qty_sum_arr=" + Arrays.toString(stock_qty_sum_arr)
				+ ", moving_qty_arr=" + Arrays.toString(moving_qty_arr) + ", remarks_arr="
				+ Arrays.toString(remarks_arr) + ", stock_cd_arr=" + Arrays.toString(stock_cd_arr) + "]";
	}
	
	
	
	
}
