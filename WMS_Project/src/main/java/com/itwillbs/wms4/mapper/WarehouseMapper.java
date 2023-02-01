package com.itwillbs.wms4.mapper;

import com.itwillbs.wms4.vo.WarehouseVO;

public interface WarehouseMapper {

	// 창고코드 DB 조회
	int checkCode(String code);

	// 창고 등록
	int regist_wh_code(WarehouseVO warehouse);


}
