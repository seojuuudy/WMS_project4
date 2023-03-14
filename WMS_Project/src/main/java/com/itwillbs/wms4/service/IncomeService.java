package com.itwillbs.wms4.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.IncomeMapper;
import com.itwillbs.wms4.vo.InScheduleInfoVO;
import com.itwillbs.wms4.vo.In_scheduleVO;
import com.itwillbs.wms4.vo.In_schedule_per_productVO;
import com.itwillbs.wms4.vo.V_Inbound_ProcessingVO;
import com.itwillbs.wms4.vo.V_Inbound_ProductVO;
import com.itwillbs.wms4.vo.V_StockinfoVO;

@Service
public class IncomeService {
	
	@Autowired
	private IncomeMapper mapper;

	// 입고예정 등록(상단)
	public int registInSche(In_scheduleVO inSchedule) {
		return mapper.insertInSche(inSchedule);
	}

	// 입고예정 등록(하단)
	public int registInSchePer(List<In_schedule_per_productVO> inSchedulePer) {
		return mapper.insertInSchePer(inSchedulePer);
	}
	
	// 등록된 입고예정 목록조회
	public List<InScheduleInfoVO> getInboundScheList(String searchType, String keyword, int startRow, int listLimit, String in_complete) {
		return mapper.selectInboundScheList(searchType, keyword, startRow, listLimit, in_complete);
	}
	
	// 한 발주서에 대한 품목 갯수 확인 작업
	public List<InScheduleInfoVO> getInboundScheListCnt() {
		return mapper.selectInboundScheListCnt();
	}
	
	// 입고예정수량 합계 계산	
	public List<InScheduleInfoVO> getInboundScheListSum() {
		return mapper.selectInboundScheListSum();
	}
	
	// 등록된 입고 예정 진행 상황 조회
	public List<InScheduleInfoVO> getInboundScheList(String in_schedule_cd) {
		return mapper.selectInboundScheList2(in_schedule_cd);
	}

	// 등록된 입고예정 목록 갯수
	public int getInboundScheListCount(String keyword) {
		return mapper.selectInboundScheListCount(keyword);
	}

	// 종결여부 업데이트
	public int modifyComplete(InScheduleInfoVO inSchedule, String in_schedule_cd, String in_complete) {
		System.out.println("과연 ? - " + in_schedule_cd + in_complete);
		return mapper.updateComplete(inSchedule, in_schedule_cd, in_complete);
	}

	// --------------------- 입고예정항목 --------------------
	// 입고 예정 항목 목록 조회
	public List<V_Inbound_ProductVO> getinProductList(String searchType, String keyword, int startRow,
			int listLimit) {
		return mapper.selectinProductList(searchType, keyword, startRow, listLimit);
	}

	// 입고 예정 항목 목록 갯수
	public int getinProductListCount(String searchType, String keyword) {
		return mapper.selectinProductListCount(searchType, keyword);
	}

	// 입고 예정 항목의 정보 가져오기
	public V_Inbound_ProductVO getinProductInfo(String in_schedule_cd, String product_name, String in_date) {
		return mapper.selectinProductInfo(in_schedule_cd, product_name, in_date);
	}
	
	// 입고 예정 항목 수정
	public int modifyProductInfo(V_Inbound_ProductVO inProduct, String product_name, int product_cd, int in_schedule_qty, Date in_date, String remarks, String in_schedule_cd, Date ex_in_date) {
		return mapper.updateProductInfo(inProduct, product_name, product_cd, in_schedule_qty, in_date, remarks, in_schedule_cd, ex_in_date);
	}
	
	// ------------------ 입고처리 --------------------
	// 입고 처리 목록 조회
	public V_Inbound_ProcessingVO getinInboundList(String in_schedule_cd, String product_cd, String in_date) {
		return mapper.selectinInboundList(in_schedule_cd, product_cd, in_date);
	}
	
	// 입고 처리 수행
	public int changeinInbound(V_Inbound_ProcessingVO inProduct) {
		return mapper.updateinInbound(inProduct);
	}
	
	// 기존 재고번호 선택시 기존 재고에 입고수량 추가
	public int changeInqty(V_Inbound_ProcessingVO inProduct) {
		return mapper.updateInqty(inProduct);
	}
	
	// 진행상태 완료로 변경 
	public int changeInComplete(V_Inbound_ProcessingVO inProduct) {
		return mapper.updateComplete1(inProduct);
	} 
	
	// 새재고번호 조회
	public int getnewStockcd() {
		return mapper.selectnewStockcd();
	}
	
	// 조회한 재고번호 실제 생성
	public int createStock_cd(int stockcd, int product_cd, int wh_loc_in_area_cd) {
		return mapper.insertStock_cd(stockcd, product_cd, wh_loc_in_area_cd);
	}
	
	// -------------------- 팝업창 검색 ---------------
	// 재고 목록 조회
	public List<V_StockinfoVO> getStockList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectStockList(searchType, keyword, startRow, listLimit);
	}

	// 재고 목록 갯수 조회
	public int getStockListCount(String searchType, String keyword) {
		return mapper.selectStockListCount(searchType, keyword);
	}

	// 품목 목록 조회
	public List<V_Inbound_ProductVO> getProductList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectProductList(searchType, keyword, startRow, listLimit);
	}

	// 품목 목록 갯수 조회
	public int getProductListCount(String searchType, String keyword) {
		return mapper.selectProductListCount(searchType, keyword);
	}

	// 구역명_위치 조회
	public List<V_StockinfoVO> getAreaList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectAreaList(searchType, keyword, startRow, listLimit);
	}

	// 구역명_위치 목록 갯수 조회
	public int getAreaListCount(String searchType, String keyword) {
		return mapper.selectAreaListCount(searchType, keyword);
	}
	
	// 입고이력 등록
	public int registStockHistory(int stock_cd, int product_cd, int in_qty, String emp_num, String remarks) {
		return mapper.insertStockHistory(stock_cd, product_cd, in_qty, emp_num, remarks);
	}

	// 창고 위치 중복 검사
	public int checkLocatecd(int location_cd, int product_cd) {
		return  mapper.selectCheckLocatecd(location_cd, product_cd);
	}

}
