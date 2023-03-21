package com.itwillbs.wms4.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.Out_schedule_per_productVO;

public interface OutcomeMapper {

	// 출고예정리스트 페이징 처리
		int selectOutListCount(
				@Param("searchType") String searchType, 
				@Param("keyword") String keyword);

	// 출고예정리스트 출력
	List<Out_schedule_per_productVO> outList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 출고 수정폼 요청
	List<Out_schedule_per_productVO> getOutModify(
			@Param("out_schedule_cd") String out_schedule_cd, 
			@Param("product_cd") int product_cd);

	// 출고 항목 비즈니스 로직 처리
	int updateOutList(
			@Param("outProductVO") Out_schedule_per_productVO outProductVO,
//			@Param("product_cd") int product_cd, 
			@Param("out_date") Date out_date, 
			@Param("out_schedule_qty") int out_schedule_qty, 
//			@Param("out_qty") int out_qty, 
			@Param("out_schedule_cd") String out_schedule_cd, 
			@Param("remarks") String remarks);
	

}
