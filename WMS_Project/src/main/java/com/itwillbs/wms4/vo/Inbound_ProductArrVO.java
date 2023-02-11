package com.itwillbs.wms4.vo;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

// 입고처리 view
public class Inbound_ProductArrVO {

	private String[] in_schedule_cd;
	private int[] in_schedule_qty;
	private int[] in_qty;
	private Date[] in_date;
	private String[] remarks;
	private int[] stock_cd;
	private String[] in_complete;
	private String[] business_no;
	private String[] product_name;
	private String[] cust_name;
	private int[] product_cd;
	private String[] size_des;
	private String[] locationcd;
	private String[] wh_loc_in_area;
	private int[] wh_loc_in_area_cd;
	private String[] wh_area;
	private int[] wh_area_cd;
	private String[] emp_num;
	
	public Inbound_ProductArrVO() {
		super();
	}

	public Inbound_ProductArrVO(String[] in_schedule_cd, int[] in_schedule_qty, int[] in_qty, Date[] in_date,
			String[] remarks, int[] stock_cd, String[] in_complete, String[] business_no, String[] product_name,
			String[] cust_name, int[] product_cd, String[] size_des, String[] locationcd, String[] wh_loc_in_area,
			int[] wh_loc_in_area_cd, String[] wh_area, int[] wh_area_cd, String[] emp_num) {
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
		this.cust_name = cust_name;
		this.product_cd = product_cd;
		this.size_des = size_des;
		this.locationcd = locationcd;
		this.wh_loc_in_area = wh_loc_in_area;
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
		this.wh_area = wh_area;
		this.wh_area_cd = wh_area_cd;
		this.emp_num = emp_num;
	}

	public String[] getIn_schedule_cd() {
		return in_schedule_cd;
	}

	public void setIn_schedule_cd(String[] in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
	}

	public int[] getIn_schedule_qty() {
		return in_schedule_qty;
	}

	public void setIn_schedule_qty(int[] in_schedule_qty) {
		this.in_schedule_qty = in_schedule_qty;
	}

	public int[] getIn_qty() {
		return in_qty;
	}

	public void setIn_qty(int[] in_qty) {
		this.in_qty = in_qty;
	}

	public Date[] getIn_date() {
		return in_date;
	}

	public void setIn_date(Date[] in_date) {
		this.in_date = in_date;
	}

	public String[] getRemarks() {
		return remarks;
	}

	public void setRemarks(String[] remarks) {
		this.remarks = remarks;
	}

	public int[] getStock_cd() {
		return stock_cd;
	}

	public void setStock_cd(int[] stock_cd) {
		this.stock_cd = stock_cd;
	}

	public String[] getIn_complete() {
		return in_complete;
	}

	public void setIn_complete(String[] in_complete) {
		this.in_complete = in_complete;
	}

	public String[] getBusiness_no() {
		return business_no;
	}

	public void setBusiness_no(String[] business_no) {
		this.business_no = business_no;
	}

	public String[] getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String[] product_name) {
		this.product_name = product_name;
	}

	public String[] getCust_name() {
		return cust_name;
	}

	public void setCust_name(String[] cust_name) {
		this.cust_name = cust_name;
	}

	public int[] getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(int[] product_cd) {
		this.product_cd = product_cd;
	}

	public String[] getSize_des() {
		return size_des;
	}

	public void setSize_des(String[] size_des) {
		this.size_des = size_des;
	}

	public String[] getLocationcd() {
		return locationcd;
	}

	public void setLocationcd(String[] locationcd) {
		this.locationcd = locationcd;
	}

	public String[] getWh_loc_in_area() {
		return wh_loc_in_area;
	}

	public void setWh_loc_in_area(String[] wh_loc_in_area) {
		this.wh_loc_in_area = wh_loc_in_area;
	}

	public int[] getWh_loc_in_area_cd() {
		return wh_loc_in_area_cd;
	}

	public void setWh_loc_in_area_cd(int[] wh_loc_in_area_cd) {
		this.wh_loc_in_area_cd = wh_loc_in_area_cd;
	}

	public String[] getWh_area() {
		return wh_area;
	}

	public void setWh_area(String[] wh_area) {
		this.wh_area = wh_area;
	}

	public int[] getWh_area_cd() {
		return wh_area_cd;
	}

	public void setWh_area_cd(int[] wh_area_cd) {
		this.wh_area_cd = wh_area_cd;
	}

	public String[] getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(String[] emp_num) {
		this.emp_num = emp_num;
	}

	@Override
	public String toString() {
		return "Inbound_ProductArrVO [in_schedule_cd=" + Arrays.toString(in_schedule_cd) + ", in_schedule_qty="
				+ Arrays.toString(in_schedule_qty) + ", in_qty=" + Arrays.toString(in_qty) + ", in_date="
				+ Arrays.toString(in_date) + ", remarks=" + Arrays.toString(remarks) + ", stock_cd="
				+ Arrays.toString(stock_cd) + ", in_complete=" + Arrays.toString(in_complete) + ", business_no="
				+ Arrays.toString(business_no) + ", product_name=" + Arrays.toString(product_name) + ", cust_name="
				+ Arrays.toString(cust_name) + ", product_cd=" + Arrays.toString(product_cd) + ", size_des="
				+ Arrays.toString(size_des) + ", locationcd=" + Arrays.toString(locationcd) + ", wh_loc_in_area="
				+ Arrays.toString(wh_loc_in_area) + ", wh_loc_in_area_cd=" + Arrays.toString(wh_loc_in_area_cd)
				+ ", wh_area=" + Arrays.toString(wh_area) + ", wh_area_cd=" + Arrays.toString(wh_area_cd) + ", emp_num="
				+ Arrays.toString(emp_num) + "]";
	}
	
}
