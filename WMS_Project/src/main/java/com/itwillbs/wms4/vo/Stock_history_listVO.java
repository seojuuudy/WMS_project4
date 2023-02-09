package com.itwillbs.wms4.vo;

import java.sql.Date;

public class Stock_history_listVO {
	
	private int stock_cd;
	private String work_type_name;
	private String product_name;
	private String size_des;
	private String source_stock_cd;
	private String target_stock_cd;
	private int qty;
	private String emp_num;
	private String emp_name;
	private Date stock_date;
	private String remarks;
	public int getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String getWork_type_name() {
		return work_type_name;
	}
	public void setWork_type_name(String work_type_name) {
		this.work_type_name = work_type_name;
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
	public String getSource_stock_cd() {
		return source_stock_cd;
	}
	public void setSource_stock_cd(String source_stock_cd) {
		this.source_stock_cd = source_stock_cd;
	}
	public String getTarget_stock_cd() {
		return target_stock_cd;
	}
	public void setTarget_stock_cd(String target_stock_cd) {
		this.target_stock_cd = target_stock_cd;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public Date getStock_date() {
		return stock_date;
	}
	public void setStock_date(Date stock_date) {
		this.stock_date = stock_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "Stock_history_listVO [stock_cd=" + stock_cd + ", work_type_name=" + work_type_name + ", product_name="
				+ product_name + ", size_des=" + size_des + ", source_stock_cd=" + source_stock_cd
				+ ", target_stock_cd=" + target_stock_cd + ", qty=" + qty + ", emp_num=" + emp_num + ", emp_name="
				+ emp_name + ", stock_date=" + stock_date + ", remarks=" + remarks + "]";
	}
	
	
	
}
