package com.itwillbs.wms4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.StockMapper;
import com.itwillbs.wms4.vo.Stock_historyVO;
import com.itwillbs.wms4.vo.Stock_history_listVO;
import com.itwillbs.wms4.vo.Stock_listVO;
import com.itwillbs.wms4.vo.Wh_detailVO;

@Service
public class StockService {

	@Autowired
	private StockMapper mapper;

	public List<Stock_listVO> getStockList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectStockList(searchType, keyword, startRow, listLimit);
	}
	
	public List<Stock_listVO> getProcdStockList(int product_cd, String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectProcdStockList(product_cd, searchType, keyword, startRow, listLimit);
	}
	
	public int getStockListCount(String keyword) {
		return mapper.selectStockListCount(keyword);
	}

	public int modifyStock(int stock_cd, int stock_qty) {
		return mapper.updateStock(stock_cd, stock_qty);
	}

	public int modifyMovingStock(int moving_stock_cd, int moving_qty) {
		return mapper.updateMovingStock(moving_stock_cd, moving_qty);
	}

	public int getProduct_cd(String product_name) {
		return mapper.selectProduct_cd(product_name);
	}

	public String getEmpNum(String sId) {
		return mapper.selectEmpNum(sId);
	}

	public int registStockHistory(int stock_cd, int product_cd, int moving_stock_cd, int moving_qty, String emp_num,
			String remarks) {
		System.out.println("가져온 새 재고번호: " + stock_cd);
		System.out.println("가져온 재고번호: " + moving_stock_cd);
		return mapper.insertStockHistory(stock_cd, product_cd, moving_stock_cd, moving_qty, emp_num, remarks);
	}

	public int registMovingStockHistory(int stock_cd, int product_cd, int moving_stock_cd, int moving_qty,
			String emp_num, String remarks) {
		return mapper.insertMovingStockHistory(stock_cd, product_cd, moving_stock_cd, moving_qty, emp_num, remarks);
	}

	public List<Stock_history_listVO> getStockHistory(int stock_cd, int startRow, int listLimit) {
		return mapper.selectStockHistory(stock_cd,  startRow, listLimit);
	}

	public List<Wh_detailVO> getAreaList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectAreaList(searchType, keyword, startRow, listLimit);
	}

	public int getAreaListCount(String keyword) {
		return mapper.selectAreaListCount(keyword);
	}

	public int registStock(int product_cd, int moving_qty, int wh_loc_in_area_cd) {
		return mapper.insertStock(product_cd, moving_qty, wh_loc_in_area_cd);
	}

	public int getStockHistoryListCount( int stock_cd) {
		return mapper.selectStockHistoryListCount(stock_cd);
	}

	public int getStock_cd(int product_cd, int moving_qty, int wh_loc_in_area_cd) {
		return mapper.selectStockCd(product_cd, moving_qty, wh_loc_in_area_cd);
	}

	public int removeStock(int stock_cd) {
		return mapper.deleteStock(stock_cd);
	}

	public int getAreacd(String wh_area) {
		return mapper.selectAreaCd(wh_area);
	}

	public int getLocInAreaCd(String loc_in_area, int area_cd) {
		return mapper.selectLocInAreaCd(loc_in_area, area_cd);
	}


}
