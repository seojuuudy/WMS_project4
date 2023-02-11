package com.itwillbs.wms4.vo;

import java.sql.Date;

public class V_Inbound_ProcessingVO {

	private String in_schedule_cd;
	private String product_name;
	private int product_cd;
	private String size_des;
	private Date in_date;
	private int in_schedule_qty;
	private int in_qty;
	private int stock_cd;
	private int wh_loc_in_area_cd;
	private int stock_qty;
	private String wh_loc_in_area;
	private String wh_area;
	private int wh_area_cd;
	
	// 입고지시수량
	private int order_qty;
	
	public V_Inbound_ProcessingVO() {
		super();
	}

	public V_Inbound_ProcessingVO(String in_schedule_cd, String product_name, int product_cd, String size_des, Date in_date,
			int in_schedule_qty, int in_qty, int stock_cd, int wh_loc_in_area_cd, int stock_qty, String wh_loc_in_area,
			String wh_area, int wh_area_cd, int order_qty) {
		super();
		this.in_schedule_cd = in_schedule_cd;
		this.product_name = product_name;
		this.product_cd = product_cd;
		this.size_des = size_des;
		this.in_date = in_date;
		this.in_schedule_qty = in_schedule_qty;
		this.in_qty = in_qty;
		this.stock_cd = stock_cd;
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
		this.stock_qty = stock_qty;
		this.wh_loc_in_area = wh_loc_in_area;
		this.wh_area = wh_area;
		this.wh_area_cd = wh_area_cd;
		this.order_qty = order_qty;
	}

	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}

	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}

	public String getSize_des() {
		return size_des;
	}

	public void setSize_des(String size_des) {
		this.size_des = size_des;
	}

	public Date getIn_date() {
		return in_date;
	}

	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}

	public int getIn_schedule_qty() {
		return in_schedule_qty;
	}

	public void setIn_schedule_qty(int in_schedule_qty) {
		this.in_schedule_qty = in_schedule_qty;
	}

	public int getIn_qty() {
		return in_qty;
	}

	public void setIn_qty(int in_qty) {
		this.in_qty = in_qty;
	}

	public int getStock_cd() {
		return stock_cd;
	}

	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
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

	public String getWh_loc_in_area() {
		return wh_loc_in_area;
	}

	public void setWh_loc_in_area(String wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
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

	public int getOrder_qty() {
		return order_qty;
	}
	
	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}

	@Override
	public String toString() {
		return "V_inbound_ListVO [in_schedule_cd=" + in_schedule_cd + ", product_name=" + product_name + ", product_cd="
				+ product_cd + ", size_des=" + size_des + ", in_date=" + in_date + ", in_schedule_qty="
				+ in_schedule_qty + ", in_qty=" + in_qty + ", stock_cd=" + stock_cd + ", wh_loc_in_area_cd="
				+ wh_loc_in_area_cd + ", stock_qty=" + stock_qty + ", wh_loc_in_area=" + wh_loc_in_area + ", wh_area="
				+ wh_area + ", wh_area_cd=" + wh_area_cd + ", order_qty=" + order_qty + "]";
	}
	
}
