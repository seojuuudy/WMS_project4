package com.itwillbs.wms4.vo;

import java.sql.Date;

public class Out_schedule_per_productVO {

	private String out_schedule_cd;
	private int product_cd;
	private int out_schedule_qty;
	private int out_qty;
	private Date out_date;
	private String remarks;
	private String stock_cd;
	private String out_complete;
	
	public Out_schedule_per_productVO() {
		super();
	}

	public Out_schedule_per_productVO(String out_schedule_cd, int product_cd, int out_schedule_qty, int out_qty,
			Date out_date, String remarks, String stock_cd, String out_complete) {
		super();
		this.out_schedule_cd = out_schedule_cd;
		this.product_cd = product_cd;
		this.out_schedule_qty = out_schedule_qty;
		this.out_qty = out_qty;
		this.out_date = out_date;
		this.remarks = remarks;
		this.stock_cd = stock_cd;
		this.out_complete = out_complete;
	}

	public String getOut_schedule_cd() {
		return out_schedule_cd;
	}

	public void setOut_schedule_cd(String out_schedule_cd) {
		this.out_schedule_cd = out_schedule_cd;
	}

	public int getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}

	public int getOut_schedule_qty() {
		return out_schedule_qty;
	}

	public void setOut_schedule_qty(int out_schedule_qty) {
		this.out_schedule_qty = out_schedule_qty;
	}

	public int getOut_qty() {
		return out_qty;
	}

	public void setOut_qty(int out_qty) {
		this.out_qty = out_qty;
	}

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
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

	public String getOut_complete() {
		return out_complete;
	}

	public void setOut_complete(String out_complete) {
		this.out_complete = out_complete;
	}

	@Override
	public String toString() {
		return "Out_schedule_per_productVO [out_schedule_cd=" + out_schedule_cd + ", product_cd=" + product_cd
				+ ", out_schedule_qty=" + out_schedule_qty + ", out_qty=" + out_qty + ", out_date=" + out_date
				+ ", remarks=" + remarks + ", stock_cd=" + stock_cd + ", out_complete=" + out_complete + "]";
	}
	
	
}
