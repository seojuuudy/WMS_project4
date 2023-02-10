package com.itwillbs.wms4.vo;

import java.sql.Date;
import java.util.List;

// 입고처리 view
public class V_Inbound_ProductVO {

	private String in_schedule_cd;
	private int in_schedule_qty;
	private int in_qty;
	private Date in_date;
	private String remarks;
	private int stock_cd;
	private String in_complete;
	private String business_no;
	private String product_name;
	private String size_des;
	private String cust_name;
	private int product_cd;
	private String locationcd;
	private int wh_loc_in_area_cd;
	private int wh_area_cd;
	private String wh_loc_in_area;
	private String wh_area;
	private int c_stock_cd;
	private int order_qty;
	public V_Inbound_ProductVO() {
		super();
	}
	public V_Inbound_ProductVO(String in_schedule_cd, int in_schedule_qty, int in_qty, Date in_date, String remarks,
			int stock_cd, String in_complete, String business_no, String product_name, String size_des,
			String cust_name, int product_cd, String locationcd, int wh_loc_in_area_cd, int wh_area_cd,
			String wh_loc_in_area, String wh_area, int c_stock_cd, int order_qty) {
		super();
		this.in_schedule_cd = in_schedule_cd;
		this.in_schedule_qty = in_schedule_qty;
		this.in_qty = in_qty;
		this.in_date = in_date;
		this.remarks = remarks;
		this.stock_cd = stock_cd;
		this.in_complete = in_complete;
		this.business_no = business_no;
		this.product_name = product_name;
		this.size_des = size_des;
		this.cust_name = cust_name;
		this.product_cd = product_cd;
		this.locationcd = locationcd;
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
		this.wh_area_cd = wh_area_cd;
		this.wh_loc_in_area = wh_loc_in_area;
		this.wh_area = wh_area;
		this.c_stock_cd = c_stock_cd;
		this.order_qty = order_qty;
	}
	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}
	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
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
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String getIn_complete() {
		return in_complete;
	}
	public void setIn_complete(String in_complete) {
		this.in_complete = in_complete;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
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
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public int getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}
	public String getLocationcd() {
		return locationcd;
	}
	public void setLocationcd(String locationcd) {
		this.locationcd = locationcd;
	}
	public int getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}
	public void setWh_loc_in_area_cd(int wh_loc_in_area_cd) {
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
	public String getWh_area() {
		return wh_area;
	}
	public void setWh_area(String wh_area) {
		this.wh_area = wh_area;
	}
	public int getC_stock_cd() {
		return c_stock_cd;
	}
	public void setC_stock_cd(int c_stock_cd) {
		this.c_stock_cd = c_stock_cd;
	}
	public int getOrder_qty() {
		return order_qty;
	}
	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}
	@Override
	public String toString() {
		return "V_Inbound_ProductVO [in_schedule_cd=" + in_schedule_cd + ", in_schedule_qty=" + in_schedule_qty
				+ ", in_qty=" + in_qty + ", in_date=" + in_date + ", remarks=" + remarks + ", stock_cd=" + stock_cd
				+ ", in_complete=" + in_complete + ", business_no=" + business_no + ", product_name=" + product_name
				+ ", size_des=" + size_des + ", cust_name=" + cust_name + ", product_cd=" + product_cd + ", locationcd="
				+ locationcd + ", wh_loc_in_area_cd=" + wh_loc_in_area_cd + ", wh_area_cd=" + wh_area_cd
				+ ", wh_loc_in_area=" + wh_loc_in_area + ", wh_area=" + wh_area + ", c_stock_cd=" + c_stock_cd
				+ ", order_qty=" + order_qty + "]";
	}
	
}
