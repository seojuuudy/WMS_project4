package com.itwillbs.wms4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.WarehouseVO;

public interface WarehouseMapper {

	// 창고코드 DB 조회
	int checkCode(String code);

	// 창고 등록
	int regist_wh_code(WarehouseVO warehouse);

	// 창고 목록
	List<WarehouseVO> warehouseList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 창고 목록 페이징 처리
	int selectWhListCount(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword);


	// 창고 상세정보 조회
	WarehouseVO selectWarehouse(
			@Param("wh_cd") String wh_cd, 
			@Param("wh_name") String wh_name);


}
