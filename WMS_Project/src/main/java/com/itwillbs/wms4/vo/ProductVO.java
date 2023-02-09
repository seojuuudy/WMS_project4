package com.itwillbs.wms4.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	/*
	 CREATE TABLE product (
	   PRODUCT_CD INT AUTO_INCREMENT PRIMARY KEY, 
	   PRODUCT_NAME VARCHAR(100) NOT NULL, 
	   PRODUCT_GROUP_BOTTOM_CD INT NOT NULL, 
	   SIZE_DES VARCHAR(30), 
	   UNIT VARCHAR(30) NOT NULL, 
	   BARCODE VARCHAR(30) NOT NULL, 
	   IN_UNIT_PRICE DECIMAL(10, 2) NOT NULL, 
	   OUT_UNIT_PRICE DECIMAL(10, 2) NOT NULL, 
	   PRODUCT_TYPE_CD VARCHAR(10) NOT NULL, 
	   BUSINESS_NO VARCHAR(30) NOT NULL, 
	   PRODUCT_IMAGE VARCHAR(100), 
	   REMARKS VARCHAR(2000), 
	   SELL_PRICEELL_PRICE INT,
	   PURCHASE_PRICE INT
	);
	*/
	
	private int product_cd;
	private String product_name;
	private int product_group_bottom_cd;
	private String size_des;
	private String unit;
	private String barcode;
	private double in_unit_price;
	private double out_unit_price;
	private String product_type_cd;
	private String business_no;
	private String product_image;
	private String remarks;
	//----------추가한 컬럼----------
	private int sell_price;
	private int purchase_price;
	//------------------------------
	
	private MultipartFile file;

	public ProductVO() {
		super();
	}

	public ProductVO(int product_cd, String product_name, int product_group_bottom_cd, String size_des, String unit,
			String barcode, double in_unit_price, double out_unit_price, String product_type_cd, String business_no,
			String product_image, String remarks, int sell_price, int purchase_price, MultipartFile file) {
		super();
		this.product_cd = product_cd;
		this.product_name = product_name;
		this.product_group_bottom_cd = product_group_bottom_cd;
		this.size_des = size_des;
		this.unit = unit;
		this.barcode = barcode;
		this.in_unit_price = in_unit_price;
		this.out_unit_price = out_unit_price;
		this.product_type_cd = product_type_cd;
		this.business_no = business_no;
		this.product_image = product_image;
		this.remarks = remarks;
		this.sell_price = sell_price;
		this.purchase_price = purchase_price;
		this.file = file;
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

	public String getBusiness_no() {
		return business_no;
	}

	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public int getSell_price() {
		return sell_price;
	}

	public void setSell_price(int sell_price) {
		this.sell_price = sell_price;
	}

	public int getPurchase_price() {
		return purchase_price;
	}

	public void setPurchase_price(int purchase_price) {
		this.purchase_price = purchase_price;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "ProductVO [product_cd=" + product_cd + ", product_name=" + product_name + ", product_group_bottom_cd="
				+ product_group_bottom_cd + ", size_des=" + size_des + ", unit=" + unit + ", barcode=" + barcode
				+ ", in_unit_price=" + in_unit_price + ", out_unit_price=" + out_unit_price + ", product_type_cd="
				+ product_type_cd + ", business_no=" + business_no + ", product_image=" + product_image + ", remarks="
				+ remarks + ", sell_price=" + sell_price + ", purchase_price=" + purchase_price + ", file=" + file
				+ "]";
	}


}
