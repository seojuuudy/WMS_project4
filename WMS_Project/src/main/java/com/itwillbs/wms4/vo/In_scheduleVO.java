package com.itwillbs.wms4.vo;

import java.sql.Date;

public class In_scheduleVO {

	private String in_schedule_cd;
	private String in_type_cd;
	private String business_no;
	private String emp_num;
	private Date in_date;
	private String remarks;
	private String in_complete;
	
	
	public In_scheduleVO() {
		super();
	}

	public In_scheduleVO(String in_schedule_cd, String in_type_cd, String business_no, String emp_num, Date in_date,
			String remarks, String in_complete) {
		super();
		this.in_schedule_cd = in_schedule_cd;
		this.in_type_cd = in_type_cd;
		this.business_no = business_no;
		this.emp_num = emp_num;
		this.in_date = in_date;
		this.remarks = remarks;
		this.in_complete = in_complete;
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

	@Override
	public String toString() {
		return "In_scheduleVO [in_schedule_cd=" + in_schedule_cd + ", in_type_cd=" + in_type_cd + ", business_no="
				+ business_no + ", emp_num=" + emp_num + ", in_date=" + in_date + ", remarks=" + remarks
				+ ", in_complete=" + in_complete + "]";
	}
	
	
	
}
