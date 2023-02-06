package com.itwillbs.wms4.vo;

public class ProductGroupBottomVO {

	/*
	 CREATE TABLE product (
	 
	   
	);
	*/
	
	private int product_group_top_cd;
	private int product_group_bottom_cd;
	private String product_group_bottom_name;

	public ProductGroupBottomVO() {
		super();
	}

	public ProductGroupBottomVO(int product_group_top_cd, int product_group_bottom_cd,
			String product_group_bottom_name) {
		super();
		this.product_group_top_cd = product_group_top_cd;
		this.product_group_bottom_cd = product_group_bottom_cd;
		this.product_group_bottom_name = product_group_bottom_name;
	}

	public int getProduct_group_top_cd() {
		return product_group_top_cd;
	}

	public void setProduct_group_top_cd(int product_group_top_cd) {
		this.product_group_top_cd = product_group_top_cd;
	}

	public int getProduct_group_bottom_cd() {
		return product_group_bottom_cd;
	}

	public void setProduct_group_bottom_cd(int product_group_bottom_cd) {
		this.product_group_bottom_cd = product_group_bottom_cd;
	}

	public String getProduct_group_bottom_name() {
		return product_group_bottom_name;
	}

	public void setProduct_group_bottom_name(String product_group_bottom_name) {
		this.product_group_bottom_name = product_group_bottom_name;
	}

	@Override
	public String toString() {
		return "ProductGroupBottomVO [product_group_top_cd=" + product_group_top_cd + ", product_group_bottom_cd="
				+ product_group_bottom_cd + ", product_group_bottom_name=" + product_group_bottom_name + "]";
	}
	
}
