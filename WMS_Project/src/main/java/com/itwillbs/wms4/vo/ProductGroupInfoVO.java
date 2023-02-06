package com.itwillbs.wms4.vo;

public class ProductGroupInfoVO {
	/*
	create or replace view product_group_info AS
	select t.product_group_top_cd, t.product_group_top_name, b.product_group_bottom_cd, b.product_group_bottom_name 
	from product_group_bottom b 
	JOIN product_group_top t 
	ON b.product_group_top_cd = t.product_group_top_cd 
	  */
	private int product_group_top_cd;
	private String product_group_top_name;
	private int product_group_bottom_cd;
	private String product_group_bottom_name;
	
	public ProductGroupInfoVO() {
		super();
	}

	public ProductGroupInfoVO(int product_group_top_cd, String product_group_top_name, int product_group_bottom_cd,
			String product_group_bottom_name) {
		super();
		this.product_group_top_cd = product_group_top_cd;
		this.product_group_top_name = product_group_top_name;
		this.product_group_bottom_cd = product_group_bottom_cd;
		this.product_group_bottom_name = product_group_bottom_name;
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
		return "ProductGroupInfoVO [product_group_top_cd=" + product_group_top_cd + ", product_group_top_name="
				+ product_group_top_name + ", product_group_bottom_cd=" + product_group_bottom_cd
				+ ", product_group_bottom_name=" + product_group_bottom_name + "]";
	}
}
