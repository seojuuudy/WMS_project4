package com.itwillbs.wms4.vo;

public class ProductListVO {
	/*
	 CREATE or REPLACE VIEW product_list AS
		SELECT p.PRODUCT_IMAGE,p.PRODUCT_CD, p.PRODUCT_NAME, g.product_group_top_name, g.product_group_bottom_name, p.SIZE_DES, p.BARCODE, p.IN_UNIT_PRICE, p.OUT_UNIT_PRICE, t.PRODUCT_TYPE_NAME 
		FROM product p 
		JOIN product_group_info g ON p.PRODUCT_GROUP_BOTTOM_CD = g.product_group_bottom_cd 
		JOIN product_type t ON p.PRODUCT_TYPE_CD = t.PRODUCT_TYPE_CD; 
	 */
	 
	private String product_image;
	private int product_cd;
	private String product_name;
	private String product_group_top_name;
	private String product_group_bottom_name;
	private String size_des;
	private String barcode;
	private double in_unit_price;
	private double out_unit_price;
	private String product_type_name;
	
	public ProductListVO() {
		super();
	}

	public ProductListVO(String product_image, int product_cd, String product_name, String product_group_top_name,
			String product_group_bottom_name, String size_des, String barcode, double in_unit_price,
			double out_unit_price, String product_type_name) {
		super();
		this.product_image = product_image;
		this.product_cd = product_cd;
		this.product_name = product_name;
		this.product_group_top_name = product_group_top_name;
		this.product_group_bottom_name = product_group_bottom_name;
		this.size_des = size_des;
		this.barcode = barcode;
		this.in_unit_price = in_unit_price;
		this.out_unit_price = out_unit_price;
		this.product_type_name = product_type_name;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
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

	public String getProduct_group_top_name() {
		return product_group_top_name;
	}

	public void setProduct_group_top_name(String product_group_top_name) {
		this.product_group_top_name = product_group_top_name;
	}

	public String getProduct_group_bottom_name() {
		return product_group_bottom_name;
	}

	public void setProduct_group_bottom_name(String product_group_bottom_name) {
		this.product_group_bottom_name = product_group_bottom_name;
	}

	public String getSize_des() {
		return size_des;
	}

	public void setSize_des(String size_des) {
		this.size_des = size_des;
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

	public String getProduct_type_name() {
		return product_type_name;
	}

	public void setProduct_type_name(String product_type_name) {
		this.product_type_name = product_type_name;
	}

	@Override
	public String toString() {
		return "ProductListVO [product_image=" + product_image + ", product_cd=" + product_cd + ", product_name="
				+ product_name + ", product_group_top_name=" + product_group_top_name + ", product_group_bottom_name="
				+ product_group_bottom_name + ", size_des=" + size_des + ", barcode=" + barcode + ", in_unit_price="
				+ in_unit_price + ", out_unit_price=" + out_unit_price + ", product_type_name=" + product_type_name
				+ "]";
	}
	
}
