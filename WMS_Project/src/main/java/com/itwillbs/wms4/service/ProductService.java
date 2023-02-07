package com.itwillbs.wms4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.ProductMapper;
import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.ProductGroupBottomVO;
import com.itwillbs.wms4.vo.ProductGroupInfoVO;
import com.itwillbs.wms4.vo.ProductGroupTopVO;
import com.itwillbs.wms4.vo.ProductVO;


@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;
	
	//====================== 품목 그룹 등록 관련 ======================
		public List<ProductGroupTopVO> getPrGrTopNameList() {
			return mapper.selectPrGrTopNameList();
		}
		
		public int getCount(String product_group_top_name) {
			return mapper.selectTopCount(product_group_top_name);
		}

		public int registTopGroup(String product_group_top_name) {
			return mapper.insertTopGroup(product_group_top_name);
		}

		public int getCode(String product_group_top_name) {
			return mapper.selectTopCode(product_group_top_name);
		}

		public int registBottomGroup(int product_group_top_cd, String product_group_bottom_name) {
			return mapper.insertBottomGroup(product_group_top_cd, product_group_bottom_name);
		}
		//====================== 품목 그룹 목록 조회 관련 ======================
		public List<ProductGroupInfoVO> getPrGrList(String searchType, String keyword, int startRow, int listLimit) {
			return mapper.selectProductGroupList(searchType, keyword, startRow, listLimit);
		}

		public int getPrGrListCount(String searchType, String keyword) {
			return mapper.selectPrGrListCount(searchType, keyword);
		}
		public int removeProductGroup(String product_group_bottom_cd) {
			return mapper.deleteProductGroup(product_group_bottom_cd);
		}
		//====================== 품목 등록 관련 ======================
		public List<ProductGroupBottomVO> getPrGrBottomNameList() {
			return mapper.selectPrGrBottomNameList();
		}

		public List<ClientVO> getClientNameList() {
			return mapper.selectClientNameList();
		}

		public int registProduct(ProductVO product) {
			return mapper.insertProduct(product);
		}

		//====================== 품목 목록 조회 관련 ======================
		public List<ProductVO> getProductList(String searchType, String keyword, int startRow, int listLimit) {
			return mapper.selectProductList(searchType, keyword, startRow, listLimit);
		}

		public int getProductListCount(String searchType, String keyword) {
			return mapper.selectProductListCount(searchType, keyword);
		}

		//====================== 품목 상세정보 조회, 수정 및 삭제 관련 ======================
		public ProductVO getProductDetail(int product_cd) {
			return mapper.selectProductDetail(product_cd);
		}

		public int removeProduct(String product_cd) {
			return mapper.deleteProduct(product_cd);
		}

		public String getRealFile(String product_cd) {
			return mapper.selectRealFile(product_cd);
		}

		



		



		
	
	

}
