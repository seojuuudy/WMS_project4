package com.itwillbs.wms4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.StockMapper;
import com.itwillbs.wms4.mapper.WmsMapper;
import com.itwillbs.wms4.vo.StockVO;
import com.itwillbs.wms4.vo.WarehouseVO;
import com.itwillbs.wms4.vo.WhAreaVO;
import com.itwillbs.wms4.vo.WhLocationVO;

@Service
public class WmsService {

	@Autowired
	private WmsMapper mapper;
	
	// 전체 창고목록 조회
	public List<WarehouseVO> getWhList() {
		return mapper.selectWhList();	
	}
	// 전체 구역목록 조회
	public List<WhAreaVO> getAreaList(String searchArea) {
		return mapper.selectAreaList(searchArea);	
	}
	//전체 위치목록 조회
	public List<WhLocationVO> getLocationList(String searchArea, String searchLocation) {
		return mapper.selectLocationList(searchArea, searchLocation);	
	}
	//전체 재고 조회
	public List<StockVO> getStockList(String searchArea, String searchLocation, String searchGo, int startRow, int listLimit) {
		return mapper.selectStockList(searchArea, searchLocation, searchGo, startRow, listLimit);	
	}
	//재고 개수 조회
	public int getStockListCount(String searchArea, String searchLocation, String searchGo) {
		return mapper.selectStockListCount(searchArea, searchLocation, searchGo);
	}
	//구역명 등록작업
	public int registArea(WhAreaVO area) {
		return mapper.insertArea(area);
	}
	//위치명 등록작업
	public int registLocation(WhLocationVO loc) {
		return mapper.insertLocation(loc);
	}
	//구역명 삭제작업
	public int removeArea(int area_code) {
		return mapper.deleteArea(area_code);
	}
	//위치명 삭제작업
	public int removeLocation(int location_code) {
		return mapper.deleteLocation(location_code);
	}
	//구역명 수정작업
	public int modifyArea(WhAreaVO area) {
		return mapper.updateArea(area);
	}
	//위치명 수정작업
	public int modifyLocation(WhLocationVO location) {
		return mapper.updateLocation(location);
	}
}
