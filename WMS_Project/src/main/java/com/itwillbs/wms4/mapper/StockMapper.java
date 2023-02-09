package com.itwillbs.wms4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.Stock_historyVO;
import com.itwillbs.wms4.vo.Stock_history_listVO;
import com.itwillbs.wms4.vo.Stock_listVO;
import com.itwillbs.wms4.vo.Wh_detailVO;

public interface StockMapper {

	List<Stock_listVO> selectStockList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	int selectStockListCount(String keyword);

	int updateStock(@Param("stock_cd") int stock_cd, @Param("stock_qty") int stock_qty);

	int updateMovingStock(@Param("moving_stock_cd") int moving_stock_cd,
			@Param("moving_qty") int moving_qty);

	int selectProduct_cd(String product_name);

	String selectEmpNum(String sId);

	int insertStockHistory(@Param("stock_cd") int stock_cd, @Param("product_cd") int product_cd, 
			@Param("moving_stock_cd") int moving_stock_cd, @Param("moving_qty") int moving_qty, 
			@Param("emp_num") String emp_num, @Param("remarks") String remarks);

	int insertMovingStockHistory(@Param("stock_cd") int stock_cd, @Param("product_cd") int product_cd, 
			@Param("moving_stock_cd") int moving_stock_cd, @Param("moving_qty") int moving_qty, 
			@Param("emp_num") String emp_num, @Param("remarks") String remarks);

	List<Stock_history_listVO> selectStockHistory(int stock_cd);

	List<Wh_detailVO> selectAreaList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	int selectAreaListCount(String keyword);

	int selectAreaCd(String loc_in_area);

	int insertStock(@Param("product_cd") int product_cd, @Param("moving_qty") int moving_qty, 
			@Param("wh_loc_in_area_cd") int wh_loc_in_area_cd);


}
