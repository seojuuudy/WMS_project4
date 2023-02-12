package com.itwillbs.wms4.vo;

import java.sql.Date;

public class OutProcess_cd_stockVO {
	
	private String out_schedule_cd;
	private int out_schedule_qty;
	private int out_qty;
	private String out_complete;
	private int stock_cd;
	private String product_name;
	private int product_cd;
	private String size_des;
	private Date out_date;
	
	public OutProcess_cd_stockVO() {
		super();
	}
	
	
	
	public OutProcess_cd_stockVO(String out_schedule_cd, int out_schedule_qty, int out_qty, String out_complete,
			int stock_cd, String product_name, int product_cd, String size_des, Date out_date) {
		super();
		this.out_schedule_cd = out_schedule_cd;
		this.out_schedule_qty = out_schedule_qty;
		this.out_qty = out_qty;
		this.out_complete = out_complete;
		this.stock_cd = stock_cd;
		this.product_name = product_name;
		this.product_cd = product_cd;
		this.size_des = size_des;
		this.out_date = out_date;
	}



	public String getOut_schedule_cd() {
		return out_schedule_cd;
	}

	public void setOut_schedule_cd(String out_schedule_cd) {
		this.out_schedule_cd = out_schedule_cd;
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

	public String getOut_complete() {
		return out_complete;
	}

	public void setOut_complete(String out_complete) {
		this.out_complete = out_complete;
	}

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

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}

	@Override
	public String toString() {
		return "OutProcess_cd_stockVO [out_schedule_cd=" + out_schedule_cd + ", out_schedule_qty=" + out_schedule_qty
				+ ", out_qty=" + out_qty + ", out_complete=" + out_complete + ", stock_cd=" + stock_cd
				+ ", product_name=" + product_name + ", product_cd=" + product_cd + ", size_des=" + size_des
				+ ", out_date=" + out_date + "]";
	}


}
