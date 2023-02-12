package com.itwillbs.wms4.vo;

import java.sql.Date;

//import org.springframework.format.annotation.DateTimeFormat;

public class OutScheduleListVO {

	private String out_schedule_cd;
	private int product_cd;
	private String product_name;
	private String business_no;
	private String cust_name;
	private int stock_cd;
	private String emp_num;
	private String emp_name;
	private String in_type_cd;
	private int out_schedule_qty;
	private Date out_date;
	private String size_des;
	private int out_qty;
	private String out_complete;
	private int OutSchePerCnt;
	
	public OutScheduleListVO() {
		super();
	}

	public OutScheduleListVO(String out_schedule_cd, int product_cd, String product_name, String business_no,
			String cust_name, int stock_cd, String emp_num, String emp_name, String in_type_cd, int out_schedule_qty,
			Date out_date, String size_des, int out_qty, String out_complete, int outSchePerCnt) {
		super();
		this.out_schedule_cd = out_schedule_cd;
		this.product_cd = product_cd;
		this.product_name = product_name;
		this.business_no = business_no;
		this.cust_name = cust_name;
		this.stock_cd = stock_cd;
		this.emp_num = emp_num;
		this.emp_name = emp_name;
		this.in_type_cd = in_type_cd;
		this.out_schedule_qty = out_schedule_qty;
		this.out_date = out_date;
		this.size_des = size_des;
		this.out_qty = out_qty;
		this.out_complete = out_complete;
		OutSchePerCnt = outSchePerCnt;
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

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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

	public int getStock_cd() {
		return stock_cd;
	}

	public void setStock_cd(int stock_cd) {
		this.stock_cd = stock_cd;
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

	public String getIn_type_cd() {
		return in_type_cd;
	}

	public void setIn_type_cd(String in_type_cd) {
		this.in_type_cd = in_type_cd;
	}

	public int getOut_schedule_qty() {
		return out_schedule_qty;
	}

	public void setOut_schedule_qty(int out_schedule_qty) {
		this.out_schedule_qty = out_schedule_qty;
	}

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}

	public String getSize_des() {
		return size_des;
	}

	public void setSize_des(String size_des) {
		this.size_des = size_des;
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

	public int getOutSchePerCnt() {
		return OutSchePerCnt;
	}

	public void setOutSchePerCnt(int outSchePerCnt) {
		OutSchePerCnt = outSchePerCnt;
	}

	@Override
	public String toString() {
		return "OutScheduleListVO [out_schedule_cd=" + out_schedule_cd + ", product_cd=" + product_cd
				+ ", product_name=" + product_name + ", business_no=" + business_no + ", cust_name=" + cust_name
				+ ", stock_cd=" + stock_cd + ", emp_num=" + emp_num + ", emp_name=" + emp_name + ", in_type_cd="
				+ in_type_cd + ", out_schedule_qty=" + out_schedule_qty + ", out_date=" + out_date + ", size_des="
				+ size_des + ", out_qty=" + out_qty + ", out_complete=" + out_complete + ", OutSchePerCnt="
				+ OutSchePerCnt + "]";
	}

	
	
	
}
