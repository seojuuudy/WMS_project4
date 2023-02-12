package com.itwillbs.wms4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.ReleaseMapper;
import com.itwillbs.wms4.vo.ClientVO;
import com.itwillbs.wms4.vo.OutProcess_cd_stockVO;
import com.itwillbs.wms4.vo.OutScheduleListVO;
import com.itwillbs.wms4.vo.Out_scheduleVO;
import com.itwillbs.wms4.vo.Out_schedule_per_productVO;

@Service
public class ReleaseService {

	@Autowired
	private ReleaseMapper mapper;

	public int registRelease(Out_scheduleVO release) {
		return mapper.insertRelease(release);
	}

	public int registRelease(Out_scheduleVO release, List<Out_schedule_per_productVO> releaseProduct) {
			   mapper.insertRelease(release);
		return mapper.insertProductRelease(releaseProduct, release);
	}

	public List<OutScheduleListVO> getReleaseList(int startRow, int listLimit) {
		return mapper.selectReleaseList(startRow, listLimit);
	}

	public int modifyComplete(Out_scheduleVO out_schedule) {
		
		return mapper.updateComplete(out_schedule);
	}

	public int modifyComplete(String osc) {
		return mapper.updateComplete(osc);
	}

	public int modifyComplete(String out_schedule_cd, String out_complete) {
		return mapper.updateComplete(out_schedule_cd, out_complete);
	}

	public List<OutScheduleListVO> getReleaseIngList(String out_complete, int startRow, int listLimit) {
		return mapper.selectReleaseIngList(out_complete, startRow, listLimit);
	}

	public List<OutScheduleListVO> selectOutProcess(OutScheduleListVO outScheduleList) {
		return mapper.selectOutProcess(outScheduleList);
	}

	public OutProcess_cd_stockVO getOutScheduleProcess(String out_schedule_cd, String product_cd, String outqty) {
		return mapper.selectOutProcessing(out_schedule_cd, product_cd, outqty);
	}


}
