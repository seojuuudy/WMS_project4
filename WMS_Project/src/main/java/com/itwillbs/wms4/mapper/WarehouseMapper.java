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

	// 창고 삭제
	public void deleteWarehouse(WarehouseVO warehouse);
	
	// 창고 수정 폼 요청
	WarehouseVO getWarehouse(String wh_cd);

	// 창고 수정 작업 요청
	int UpdateWarehouse(WarehouseVO warehouse);

	// 사용버튼 전용 리스트 출력 작업 요청
	List<WarehouseVO> selectUseWhList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit,
			@Param("wh_use") String wh_use);

	// 미사용버튼 전용 리스트 출력 작업 요청
	List<WarehouseVO> selectNotUseWhList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit,
			@Param("wh_use") String wh_use);


}
