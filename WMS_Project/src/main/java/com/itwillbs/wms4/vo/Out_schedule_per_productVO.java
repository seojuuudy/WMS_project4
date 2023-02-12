package com.itwillbs.wms4.vo;

import java.sql.Date;
import java.util.List;


public class Out_schedule_per_productVO {

	private String out_schedule_cd;
	private int product_cd;
	private int out_schedule_qty;
	private int out_qty;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date out_date;
	private String remarks;
	private String stock_cd;
	private String out_complete;
	// -----------------------------------
	private List<Out_schedule_per_productVO> outProductList;
	//------------------------------
	private String business_no;
	private String cust_name;
	private String product_name;
	private int out_not_qty;
	
	public Out_schedule_per_productVO() {
		super();
	}
	public Out_schedule_per_productVO(String out_schedule_cd, int product_cd, int out_schedule_qty, int out_qty,
			Date out_date, String remarks, String stock_cd, String out_complete,
			List<Out_schedule_per_productVO> outProductList, String business_no, String cust_name, String product_name,
			int out_not_qty) {
		super();
		this.out_schedule_cd = out_schedule_cd;
		this.product_cd = product_cd;
		this.out_schedule_qty = out_schedule_qty;
		this.out_qty = out_qty;
		this.out_date = out_date;
		this.remarks = remarks;
		this.stock_cd = stock_cd;
		this.out_complete = out_complete;
		this.outProductList = outProductList;
		this.business_no = business_no;
		this.cust_name = cust_name;
		this.product_name = product_name;
		this.out_not_qty = out_not_qty;
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
	public List<Out_schedule_per_productVO> getOutProductList() {
		return outProductList;
	}
	public void setOutProductList(List<Out_schedule_per_productVO> outProductList) {
		this.outProductList = outProductList;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getOut_not_qty() {
		return out_not_qty;
	}
	public void setOut_not_qty(int out_not_qty) {
		this.out_not_qty = out_not_qty;
	}
	
	@Override
	public String toString() {
		return "Out_schedule_per_productVO [out_schedule_cd=" + out_schedule_cd + ", product_cd=" + product_cd
				+ ", out_schedule_qty=" + out_schedule_qty + ", out_qty=" + out_qty + ", out_date=" + out_date
				+ ", remarks=" + remarks + ", stock_cd=" + stock_cd + ", out_complete=" + out_complete
				+ ", outProductList=" + outProductList + ", business_no=" + business_no + ", cust_name=" + cust_name
				+ ", product_name=" + product_name + ", out_not_qty=" + out_not_qty + "]";
	}
	
}
