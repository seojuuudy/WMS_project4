package com.itwillbs.wms4.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.OutcomeMapper;
import com.itwillbs.wms4.vo.Out_schedule_per_productVO;

@Service
public class OutcomeService {

	@Autowired
	private OutcomeMapper mapper;
	
	// 출고예정리스트 페이징
	public int getBoardListCount(String searchType, String keyword) {
		return mapper.selectOutListCount(searchType, keyword);
	}

	// 출고예정리스트 출력
	public List<Out_schedule_per_productVO> getOutList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.outList(searchType, keyword, startRow, listLimit);
	}
	
	// 출고 항목 수정폼
	public List<Out_schedule_per_productVO> getOutModify(String out_schedule_cd, int product_cd) {
		return mapper.getOutModify(out_schedule_cd, product_cd);
	}

	public int OutUpdate(
			Out_schedule_per_productVO outProductVO,
			Date out_date, 
			int out_schedule_qty, 
			String out_schedule_cd, 
			String remarks) {
		
		System.out.println("아웃서비스");
		System.out.println("out_date: " + out_date);
		System.out.println("out_schedule_qty: " + out_schedule_qty);
		System.out.println("remarks: " + remarks);
		System.out.println("out_schedule_cd: " + out_schedule_cd);
		return mapper.updateOutList(
				outProductVO, 
				out_date, 
				out_schedule_qty, 
				out_schedule_cd, 
				remarks);
	}

	
	
	
	
}
