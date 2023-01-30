package com.itwillbs.wms4.vo;

public class ClientVO {

//	CREATE TABLE client(
//			BUSINESS_NO VARCHAR(30) NOT NULL, 
//			CUST_NAME VARCHAR(100) NOT NULL, 
//			BOSS_NAME VARCHAR(50), 
//			UPTAE VARCHAR(50), 
//			JONGMOK VARCHAR(50),
//			TEL VARCHAR(50),
//			EMAIL VARCHAR(100),
//			POST_NO VARCHAR(8),
//			ADDR VARCHAR(500),
//			G_GUBUN VARCHAR(2),
//			FAX VARCHAR(50),
//			MOBILE_NO VARCHAR(50),
//			URL_PATH VARCHAR(100),
//			MAN_NAME VARCHAR(50),
//			MAN_TEL VARCHAR(50),
//			MAN_EMAIL VARCHAR(100),
//			REMARKS VARCHAR(2000)
//		    );
	
	private String business_no; 
	private String cust_name; 
	private String boss_name; 
	private String uptae; 
	private String jongmok; 
	private String tel; 
	private String email; 
	private String post_no; 
	private String addr; 
	private String g_gubun; 
	private String fax; 
	private String mobile_no; 
	private String url_path; 
	private String man_name; 
	private String man_tel; 
	private String man_email; 
	private String remarks;
	
	public ClientVO() {
		super();
	}

	public ClientVO(String business_no, String cust_name, String boss_name, String uptae, String jongmok, String tel,
			String email, String post_no, String addr, String g_gubun, String fax, String mobile_no, String url_path,
			String man_name, String man_tel, String man_email, String remarks) {
		super();
		this.business_no = business_no;
		this.cust_name = cust_name;
		this.boss_name = boss_name;
		this.uptae = uptae;
		this.jongmok = jongmok;
		this.tel = tel;
		this.email = email;
		this.post_no = post_no;
		this.addr = addr;
		this.g_gubun = g_gubun;
		this.fax = fax;
		this.mobile_no = mobile_no;
		this.url_path = url_path;
		this.man_name = man_name;
		this.man_tel = man_tel;
		this.man_email = man_email;
		this.remarks = remarks;
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

	public String getBoss_name() {
		return boss_name;
	}

	public void setBoss_name(String boss_name) {
		this.boss_name = boss_name;
	}

	public String getUptae() {
		return uptae;
	}

	public void setUptae(String uptae) {
		this.uptae = uptae;
	}

	public String getJongmok() {
		return jongmok;
	}

	public void setJongmok(String jongmok) {
		this.jongmok = jongmok;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getG_gubun() {
		return g_gubun;
	}

	public void setG_gubun(String g_gubun) {
		this.g_gubun = g_gubun;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getUrl_path() {
		return url_path;
	}

	public void setUrl_path(String url_path) {
		this.url_path = url_path;
	}

	public String getMan_name() {
		return man_name;
	}

	public void setMan_name(String man_name) {
		this.man_name = man_name;
	}

	public String getMan_tel() {
		return man_tel;
	}

	public void setMan_tel(String man_tel) {
		this.man_tel = man_tel;
	}

	public String getMan_email() {
		return man_email;
	}

	public void setMan_email(String man_email) {
		this.man_email = man_email;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "ClientVO [business_no=" + business_no + ", cust_name=" + cust_name + ", boss_name=" + boss_name
				+ ", uptae=" + uptae + ", jongmok=" + jongmok + ", tel=" + tel + ", email=" + email + ", post_no="
				+ post_no + ", addr=" + addr + ", g_gubun=" + g_gubun + ", fax=" + fax + ", mobile_no=" + mobile_no
				+ ", url_path=" + url_path + ", man_name=" + man_name + ", man_tel=" + man_tel + ", man_email="
				+ man_email + ", remarks=" + remarks + "]";
	} 
	
	
	
}
