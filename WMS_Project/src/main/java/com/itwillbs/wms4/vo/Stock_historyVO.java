package com.itwillbs.wms4.vo;

import java.sql.Date;

public class Stock_historyVO {
	
	private int stock_cd;
	private String control_type_cd;
	private int product_cd;
	private String source_stock_cd;
	private String target_stock_cd;
	private int qty;
	private String emp_num;
	private Date date;
	private String remarks;
	
	public Stock_historyVO() {
		super();
	}

	public Stock_historyVO(int stock_cd, String control_type_cd, int product_cd, String source_stock_cd,
			String target_stock_cd, int qty, String emp_num, Date date, String remarks) {
		super();
		this.stock_cd = stock_cd;
		this.control_type_cd = control_type_cd;
		this.product_cd = product_cd;
		this.source_stock_cd = source_stock_cd;
		this.target_stock_cd = target_stock_cd;
		this.qty = qty;
		this.emp_num = emp_num;
		this.date = date;
		this.remarks = remarks;
	}

	public int getStock_cd() {
		return stock_cd;
	}

	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
	}

	public String getControl_type_cd() {
		return control_type_cd;
	}

	public void setControl_type_cd(String control_type_cd) {
		this.control_type_cd = control_type_cd;
	}

	public int getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "Stock_historyVO [stock_cd=" + stock_cd + ", control_type_cd=" + control_type_cd + ", product_cd="
				+ product_cd + ", source_stock_cd=" + source_stock_cd + ", target_stock_cd=" + target_stock_cd
				+ ", qty=" + qty + ", emp_num=" + emp_num + ", date=" + date + ", remarks=" + remarks + "]";
	}
	
}
