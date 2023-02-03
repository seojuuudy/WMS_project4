package com.itwillbs.wms4.vo;

import java.sql.Date;

public class In_schedule_per_productVO {

	private String in_schedule_cd;
	private int product_cd;
	private int in_schedule_qty;
	private int in_qty;
	private Date in_date;
	private String remarks;
	private String stock_cd;
	private String in_complete;
	
	public In_schedule_per_productVO() {
		super();
	}

	public In_schedule_per_productVO(String in_schedule_cd, int product_cd, int in_schedule_qty, int in_qty, Date in_date,
			String remarks, String stock_cd, String in_complete) {
		super();
		this.in_schedule_cd = in_schedule_cd;
		this.product_cd = product_cd;
		this.in_schedule_qty = in_schedule_qty;
		this.in_qty = in_qty;
		this.in_date = in_date;
		this.remarks = remarks;
		this.stock_cd = stock_cd;
		this.in_complete = in_complete;
	}

	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}

	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
	}

	public int getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
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

	public String getStock_cd() {
		return stock_cd;
	}

	public void setStock_cd(String stock_cd) {
		this.stock_cd = stock_cd;
	}

	public String getIn_complete() {
		return in_complete;
	}

	public void setIn_complete(String in_complete) {
		this.in_complete = in_complete;
	}

	@Override
	public String toString() {
		return "In_schedule_per_product [in_schedule_cd=" + in_schedule_cd + ", product_cd=" + product_cd
				+ ", in_schedule_qty=" + in_schedule_qty + ", in_qty=" + in_qty + ", in_date=" + in_date + ", remarks="
				+ remarks + ", stock_cd=" + stock_cd + ", in_complete=" + in_complete + "]";
	}
	
	
	
	
}
