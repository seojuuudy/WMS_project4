package com.itwillbs.wms4.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.InScheduleInfoVO;
import com.itwillbs.wms4.vo.In_scheduleVO;
import com.itwillbs.wms4.vo.In_schedule_per_productVO;
import com.itwillbs.wms4.vo.V_Inbound_ProcessingVO;
import com.itwillbs.wms4.vo.V_Inbound_ProductVO;
import com.itwillbs.wms4.vo.V_StockinfoVO;

public interface IncomeMapper {

	// 입고예정 등록(상단)
	public int insertInSche(In_scheduleVO inSchedule);

	// 입고예정 등록(하단)
	public int insertInSchePer(List<In_schedule_per_productVO> inSchedulePer);
	
	// 등록된 입고예정 목록조회
	public List<InScheduleInfoVO> selectInboundScheList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit,
			@Param("in_complete") String in_complete);
	
	// 한 발주서에 대한 품목 갯수 확인 작업
	public List<InScheduleInfoVO> selectInboundScheListCnt();
	
	// 입고예정수량 합계 계산
	public List<InScheduleInfoVO> selectInboundScheListSum();
	
	// 등록된 입고 예정 진행 상황 조회
	public List<InScheduleInfoVO> selectInboundScheList2(String in_schedule_cd);
	
	// 등록된 입고예정 목록 갯수
	public int selectInboundScheListCount(String keyword);

	// 종결여부 업데이트
	public int updateComplete(@Param("inSchedule") InScheduleInfoVO inSchedule, 
			@Param("in_schedule_cd") String in_schedule_cd, 
			@Param("in_complete") String in_complete);
	
	// ---------------- 입고 예정 항목 ----------------
	// 입고 예정 항목 목록 조회
	List<V_Inbound_ProductVO> selectinProductList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit,
			@Param("order") String order,
			@Param("complete") String complete
			);

	// 입고 예정 항목 목록 갯수
	int selectinProductListCount(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword,
			@Param("complete") String complete
			);

	// 입고 예정 항목의 정보 가져오기 (수정폼)
	V_Inbound_ProductVO selectinProductInfo(
			@Param("in_schedule_cd") String in_schedule_cd, 
			@Param("product_name") String product_name,
			@Param("in_date") String in_date);
	
	// 입고 예정 항목 수정
	int updateProductInfo(
			@Param("inProduct") V_Inbound_ProductVO inProduct, 
			@Param("product_name") String product_name,
			@Param("product_cd") int product_cd,
			@Param("in_schedule_qty") int in_schedule_qty,
			@Param("in_date") Date in_date,
			@Param("remarks") String remarks,
			@Param("in_schedule_cd") String in_schedule_cd,
			@Param("ex_in_date") Date ex_in_date );
		
	// ------------------------ 입고 처리 ----------------
	// 입고 처리 목록 조회
	V_Inbound_ProcessingVO selectinInboundList(
			@Param("in_schedule_cd") String in_schedule_cd,
			@Param("product_cd") String product_cd,
			@Param("in_date") String in_date);

	// 입고 수행
	int updateinInbound(V_Inbound_ProcessingVO inProduct);

	// 기존 재고번호 선택시 기존 재고에 입고수량 추가
	int updateInqty(V_Inbound_ProcessingVO inProduct);
	
	// 진행상태 완료로 변경
	int updateComplete1(V_Inbound_ProcessingVO inProduct);
	
	// 새재고번호 조회
	int selectnewStockcd();
	
	// 조회한 재고번호 실제로 생성
	int insertStock_cd(
			@Param("stock_cd") int stockcd,
			@Param("product_cd") int product_cd, 
			@Param("wh_loc_in_area_cd") int wh_loc_in_area_cd);
	
	// 창고 위치 중복 검사
	public int selectCheckLocatecd(
			@Param("location_cd") int location_cd, 
			@Param("product_cd") int product_cd);

	// 제일 큰 재고번호 검색
	public int selectgetMaxstockcd();
	
	// --------------- 팝업창(검색) -----------------
	// 재고 목록 조회
	List<V_StockinfoVO> selectStockList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit,
			@Param("product_cd") int product_cd
			);

	// 재고 목록 갯수 조회
	int selectStockListCount(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword,
			@Param("product_cd") int product_cd
			);

	// 품목 목록 조회
	List<V_Inbound_ProductVO> selectProductList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 품목 목록 갯수 조회
	int selectProductListCount(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword);

	// 구역명_위치 조회
	List<V_StockinfoVO> selectAreaList(
			@Param("searchType") String searchType,
			@Param("keyword") String keyword,
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 구역명_위치 목록 갯수 조회
	int selectAreaListCount(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword);

	// 입고 이력 등록
	public int insertStockHistory(
			@Param("stock_cd") int stock_cd, 
			@Param("product_cd") int product_cd, 
			@Param("in_qty") int in_qty, 
			@Param("emp_num") String emp_num, 
			@Param("remarks") String remarks);



}
