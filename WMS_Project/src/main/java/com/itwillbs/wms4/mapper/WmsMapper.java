package com.itwillbs.wms4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.StockVO;
import com.itwillbs.wms4.vo.WarehouseVO;
import com.itwillbs.wms4.vo.WhAreaVO;
import com.itwillbs.wms4.vo.WhLocationVO;

public interface WmsMapper {

	List<WarehouseVO> selectWhList();

	List<WhAreaVO> selectAreaList(String searchArea);

	List<WhLocationVO> selectLocationList(
			@Param("searchArea") String searchArea,
			@Param("searchLocation") String searchLocation);

	List<StockVO> selectStockList(
			@Param("searchArea") String searchArea, 
			@Param("searchLocation") String searchLocation, 
			@Param("searchGo") String searchGo, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	int selectStockListCount();

	int insertArea(WhAreaVO area);

	int insertLocation(WhLocationVO loc);

	int deleteArea(int area_code);
	
	int deleteLocation(int location_code);

	int updateArea(WhAreaVO area);

	int updateLocation(WhLocationVO location);


	
}
