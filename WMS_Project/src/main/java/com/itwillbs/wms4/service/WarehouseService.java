package com.itwillbs.wms4.service;

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



	
	
	
	
	
}
