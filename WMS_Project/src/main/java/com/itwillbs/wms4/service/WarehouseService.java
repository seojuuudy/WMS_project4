package com.itwillbs.wms4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.WarehouseMapper;
import com.itwillbs.wms4.vo.WarehouseVO;

@Service
public class WarehouseService {
	
	@Autowired
	private WarehouseMapper mapper;

	// 창고코드 DB 조회
	public int CheckCode(String code) {
		return mapper.checkCode(code);
	}
	
	// 창고 등록
	public int regist_wh(WarehouseVO warehouse) {
		return mapper.regist_wh_code(warehouse);
	}

	// 창고 목록
	public List<WarehouseVO> getWhList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.warehouseList(searchType, keyword, startRow, listLimit);
	}

	// 창고 목록 페이징
	public int getBoardListCount(String searchType, String keyword) {
		return mapper.selectWhListCount(searchType, keyword);
	}

	// 창고 상세 정보 조회
	public WarehouseVO getWarehouse(String wh_cd, String wh_name) {
		return mapper.selectWarehouse(wh_cd, wh_name);
	}

	// 창고 삭제
	public void removeWarehouse(WarehouseVO warehouse) {
		mapper.deleteWarehouse(warehouse);
	}

	// 창고 수정폼 요청
	public WarehouseVO getWarehouse(String wh_cd) {
		return mapper.getWarehouse(wh_cd);
	}

	// 창고 수정 작업 요청
	public int warehouseUpdate(WarehouseVO warehouse) {
		return mapper.UpdateWarehouse(warehouse);
	}

	// 사용버튼 클릭 시 사용여부 : 사용 만 출력 작업 
	public List<WarehouseVO> getUseWhList(String searchType, String keyword, int startRow, int listLimit, String wh_use) {
		return mapper.selectUseWhList(searchType, keyword, startRow, listLimit, wh_use);
	}

	// 사용버튼 클릭 시 사용여부 : 미사용 만 출력 작업 
	public List<WarehouseVO> getNotUseWhList(String searchType, String keyword, int startRow, int listLimit,
			String wh_use) {
		return mapper.selectNotUseWhList(searchType, keyword, startRow, listLimit, wh_use);
	}





	
	
	
	
	
}
