package com.itwillbs.wms4.vo;

public class ProductTypeVO {
//	PRODUCT_TYPE_CD
//	PRODUCT_TYPE_NAME
	
	private int product_type_cd;
	private String product_type_name;
	
	public ProductTypeVO() {
		super();
	}

	public ProductTypeVO(int product_type_cd, String product_type_name) {
		super();
		this.product_type_cd = product_type_cd;
		this.product_type_name = product_type_name;
	}

	public int getProduct_type_cd() {
		return product_type_cd;
	}

	public void setProduct_type_cd(int product_type_cd) {
		this.product_type_cd = product_type_cd;
	}

	public String getProduct_type_name() {
		return product_type_name;
	}

	public void setProduct_type_name(String product_type_name) {
		this.product_type_name = product_type_name;
	}

	@Override
	public String toString() {
		return "ProductTypeVO [product_type_cd=" + product_type_cd + ", product_type_name=" + product_type_name + "]";
	}

	
}
