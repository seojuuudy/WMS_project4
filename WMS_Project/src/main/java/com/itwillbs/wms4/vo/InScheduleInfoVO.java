package com.itwillbs.wms4.vo;

import java.sql.Date;
import java.util.Arrays;

public class InScheduleInfoVO {

	private String in_schedule_cd;
	private String in_type_cd;
	private String business_no;
	private String cust_name;
	private String emp_num;
	private Date in_date;
	private String remarks;
	private String in_complete;
	private String in_complete_pr;
	private int product_cd;
	private int in_schedule_qty;
	private int in_qty;
	private String stock_cd;
	private String in_type_name;
	private String product_name;
	private int product_group_bottom_cd;
	private String size_des;
	private String unit;
	private String barcode;
	private double in_unit_price;
	private double out_unit_price;
	private String product_type_cd;
	private String product_image;
	private String emp_name;
	private int[] InScheCount;
	
	public InScheduleInfoVO() {
		super();
	}

	public InScheduleInfoVO(String in_schedule_cd, String in_type_cd, String business_no, String cust_name,
			String emp_num, Date in_date, String remarks, String in_complete, String in_complete_pr, int product_cd,
			int in_schedule_qty, int in_qty, String stock_cd, String in_type_name, String product_name,
			int product_group_bottom_cd, String size_des, String unit, String barcode, double in_unit_price,
			double out_unit_price, String product_type_cd, String product_image, String emp_name, int[] inScheCount) {
		super();
		this.in_schedule_cd = in_schedule_cd;
		this.in_type_cd = in_type_cd;
		this.business_no = business_no;
		this.cust_name = cust_name;
		this.emp_num = emp_num;
		this.in_date = in_date;
		this.remarks = remarks;
		this.in_complete = in_complete;
		this.in_complete_pr = in_complete_pr;
		this.product_cd = product_cd;
		this.in_schedule_qty = in_schedule_qty;
		this.in_qty = in_qty;
		this.stock_cd = stock_cd;
		this.in_type_name = in_type_name;
		this.product_name = product_name;
		this.product_group_bottom_cd = product_group_bottom_cd;
		this.size_des = size_des;
		this.unit = unit;
		this.barcode = barcode;
		this.in_unit_price = in_unit_price;
		this.out_unit_price = out_unit_price;
		this.product_type_cd = product_type_cd;
		this.product_image = product_image;
		this.emp_name = emp_name;
		InScheCount = inScheCount;
	}

	public String getIn_schedule_cd() {
		return in_schedule_cd;
	}

	public void setIn_schedule_cd(String in_schedule_cd) {
		this.in_schedule_cd = in_schedule_cd;
	}

	public String getIn_type_cd() {
		return in_type_cd;
	}

	public void setIn_type_cd(String in_type_cd) {
		this.in_type_cd = in_type_cd;
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

	public String getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
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

	public String getIn_complete() {
		return in_complete;
	}

	public void setIn_complete(String in_complete) {
		this.in_complete = in_complete;
	}

	public String getIn_complete_pr() {
		return in_complete_pr;
	}

	public void setIn_complete_pr(String in_complete_pr) {
		this.in_complete_pr = in_complete_pr;
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

	public String getStock_cd() {
		return stock_cd;
	}

	public void setStock_cd(String stock_cd) {
		this.stock_cd = stock_cd;
	}

	public String getIn_type_name() {
		return in_type_name;
	}

	public void setIn_type_name(String in_type_name) {
		this.in_type_name = in_type_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_group_bottom_cd() {
		return product_group_bottom_cd;
	}

	public void setProduct_group_bottom_cd(int product_group_bottom_cd) {
		this.product_group_bottom_cd = product_group_bottom_cd;
	}

	public String getSize_des() {
		return size_des;
	}

	public void setSize_des(String size_des) {
		this.size_des = size_des;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public double getIn_unit_price() {
		return in_unit_price;
	}

	public void setIn_unit_price(double in_unit_price) {
		this.in_unit_price = in_unit_price;
	}

	public double getOut_unit_price() {
		return out_unit_price;
	}

	public void setOut_unit_price(double out_unit_price) {
		this.out_unit_price = out_unit_price;
	}

	public String getProduct_type_cd() {
		return product_type_cd;
	}

	public void setProduct_type_cd(String product_type_cd) {
		this.product_type_cd = product_type_cd;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public int[] getInScheCount() {
		return InScheCount;
	}

	public void setInScheCount(int[] inScheCount) {
		InScheCount = inScheCount;
	}

	@Override
	public String toString() {
		return "InScheduleInfoVO [in_schedule_cd=" + in_schedule_cd + ", in_type_cd=" + in_type_cd + ", business_no="
				+ business_no + ", cust_name=" + cust_name + ", emp_num=" + emp_num + ", in_date=" + in_date
				+ ", remarks=" + remarks + ", in_complete=" + in_complete + ", in_complete_pr=" + in_complete_pr
				+ ", product_cd=" + product_cd + ", in_schedule_qty=" + in_schedule_qty + ", in_qty=" + in_qty
				+ ", stock_cd=" + stock_cd + ", in_type_name=" + in_type_name + ", product_name=" + product_name
				+ ", product_group_bottom_cd=" + product_group_bottom_cd + ", size_des=" + size_des + ", unit=" + unit
				+ ", barcode=" + barcode + ", in_unit_price=" + in_unit_price + ", out_unit_price=" + out_unit_price
				+ ", product_type_cd=" + product_type_cd + ", product_image=" + product_image + ", emp_name=" + emp_name
				+ ", InScheCount=" + Arrays.toString(InScheCount) + "]";
	}
	

}
