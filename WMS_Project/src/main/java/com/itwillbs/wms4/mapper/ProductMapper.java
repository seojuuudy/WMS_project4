package com.itwillbs.wms4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.ProductGroupBottomVO;
import com.itwillbs.wms4.vo.ProductGroupInfoVO;
import com.itwillbs.wms4.vo.ProductGroupTopVO;
import com.itwillbs.wms4.vo.ProductVO;

public interface ProductMapper {



	//====================== 품목 그룹 등록 관련 ======================
	List<ProductGroupTopVO> selectPrGrTopNameList();
	
	int selectTopCount(String product_group_top_name);

	int insertTopGroup(String product_group_top_name);

	int selectTopCode(String product_group_top_name);

	int insertBottomGroup(@Param("product_group_top_cd") int product_group_top_cd, @Param("product_group_bottom_name") String product_group_bottom_name);

	//====================== 품목 그룹 목록 조회 관련 ======================
	List<ProductGroupInfoVO> selectProductGroupList(@Param("searchType") String searchType, 
													@Param("keyword") String keyword, 
													@Param("startRow") int startRow, 
													@Param("listLimit") int listLimit);

	int selectPrGrListCount(@Param("searchType") String searchType, 
							@Param("keyword") String keyword);

	//====================== 품목 등록 관련 ======================
	List<ProductGroupBottomVO> selectPrGrBottomNameList();

	List<ClientVO> selectClientNameList();

	int insertProduct(ProductVO product);

	List<ProductVO> selectProductList(String searchType, String keyword, int startRow, int listLimit);

	
	
}
