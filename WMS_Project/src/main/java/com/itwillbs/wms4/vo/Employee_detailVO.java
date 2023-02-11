package com.itwillbs.wms4.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Employee_detailVO {
	private int idx;
	private String emp_num;
	private String emp_name;
	private String dept_cd;
	private String dept_name;
	private String grade_cd;
	private String grade_name;
	private String emp_tel;
	private String emp_dtel;
	private String emp_email;
	private String emp_email1;
	private String emp_email2;
	private String emp_passwd;
	private String emp_post_no;
	private String emp_addr;
	private String emp_addr1;
	private String emp_addr2;
	private Date hire_date;
	private String work_cd;
	private String priv_cd;
	private String photo;
	// 사원 사진등록을 위한 MultipartFile 객체
	private MultipartFile file;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getDept_cd() {
		return dept_cd;
	}
	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getGrade_cd() {
		return grade_cd;
	}
	public void setGrade_cd(String grade_cd) {
		this.grade_cd = grade_cd;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}
	public String getEmp_dtel() {
		return emp_dtel;
	}
	public void setEmp_dtel(String emp_dtel) {
		this.emp_dtel = emp_dtel;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_email1() {
		return emp_email1;
	}
	public void setEmp_email1(String emp_email1) {
		this.emp_email1 = emp_email1;
		
		emp_email1 = emp_email.split("@")[0];
		emp_email2 = emp_email.split("@")[1];
	}
	public String getEmp_email2() {
		return emp_email2;
	}
	public void setEmp_email2(String emp_email2) {
		this.emp_email2 = emp_email2;
	}
	public String getEmp_passwd() {
		return emp_passwd;
	}
	public void setEmp_passwd(String emp_passwd) {
		this.emp_passwd = emp_passwd;
	}
	public String getEmp_post_no() {
		return emp_post_no;
	}
	public void setEmp_post_no(String emp_post_no) {
		this.emp_post_no = emp_post_no;
	}
	public String getEmp_addr() {
		return emp_addr;
	}
	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
		
		emp_addr1 = emp_addr.split(",")[0];
		emp_addr2 = emp_addr.split(",")[1];
	}
	public String getEmp_addr1() {
		return emp_addr1;
	}
	public void setEmp_addr1(String emp_addr1) {
		this.emp_addr1 = emp_addr1;
	}
	public String getEmp_addr2() {
		return emp_addr2;
	}
	public void setEmp_addr2(String emp_addr2) {
		this.emp_addr2 = emp_addr2;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public String getWork_cd() {
		return work_cd;
	}
	public void setWork_cd(String work_cd) {
		this.work_cd = work_cd;
	}
	public String getPriv_cd() {
		return priv_cd;
	}
	public void setPriv_cd(String priv_cd) {
		this.priv_cd = priv_cd;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "Employee_detailVO [idx=" + idx + ", emp_num=" + emp_num + ", emp_name=" + emp_name + ", dept_cd="
				+ dept_cd + ", dept_name=" + dept_name + ", grade_cd=" + grade_cd + ", grade_name=" + grade_name
				+ ", emp_tel=" + emp_tel + ", emp_dtel=" + emp_dtel + ", emp_email=" + emp_email + ", emp_email1="
				+ emp_email1 + ", emp_email2=" + emp_email2 + ", emp_passwd=" + emp_passwd + ", emp_post_no="
				+ emp_post_no + ", emp_addr=" + emp_addr + ", emp_addr1=" + emp_addr1 + ", emp_addr2=" + emp_addr2
				+ ", hire_date=" + hire_date + ", work_cd=" + work_cd + ", priv_cd=" + priv_cd + ", photo=" + photo
				+ ", file=" + file + "]";
	}
	
	
	
}
