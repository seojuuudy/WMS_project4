package com.itwillbs.wms4.vo;

public class ProductGroupTopVO {
	/*
	 CREATE TABLE product (
	   
	);
	*/
	
	private int product_group_top_cd;
	private String product_group_top_name;

	public ProductGroupTopVO() {
		super();
	}

	public ProductGroupTopVO(int product_group_top_cd, String product_group_top_name) {
		super();
		this.product_group_top_cd = product_group_top_cd;
		this.product_group_top_name = product_group_top_name;
	}

	public int getProduct_group_top_cd() {
		return product_group_top_cd;
	}

	public void setProduct_group_top_cd(int product_group_top_cd) {
		this.product_group_top_cd = product_group_top_cd;
	}

	public String getProduct_group_top_name() {
		return product_group_top_name;
	}

	public void setProduct_group_top_name(String product_group_top_name) {
		this.product_group_top_name = product_group_top_name;
	}

	@Override
	public String toString() {
		return "ProductGroupTopVO [product_group_top_cd=" + product_group_top_cd + ", product_group_top_name="
				+ product_group_top_name + "]";
	}
}
