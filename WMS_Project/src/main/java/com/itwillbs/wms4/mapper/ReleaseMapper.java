package com.itwillbs.wms4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.OutProcess_cd_stockVO;
import com.itwillbs.wms4.vo.OutScheduleListVO;
import com.itwillbs.wms4.vo.Out_scheduleVO;
import com.itwillbs.wms4.vo.Out_schedule_per_productVO;

public interface ReleaseMapper {

	public int insertRelease(@Param("release") Out_scheduleVO release);

	public int insertProductRelease(@Param("releaseProduct") List<Out_schedule_per_productVO> releaseProduct);

	public int insertProductRelease(@Param("releaseProduct") List<Out_schedule_per_productVO> releaseProduct,
			@Param("release") Out_scheduleVO release);

	public List<OutScheduleListVO> selectReleaseList(
			@Param("startRow")int startRow, 
			@Param("listLimit")int listLimit);

	public int updateComplete(Out_scheduleVO out_schedule);

	public int updateComplete(String osc);

	public int updateComplete(@Param("out_schedule_cd") String out_schedule_cd, @Param("out_complete") String out_complete);

	public List<OutScheduleListVO> selectReleaseIngList(@Param("out_complete") String out_complete, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

	public List<OutScheduleListVO> selectOutProcess(OutScheduleListVO outScheduleList);

	public OutProcess_cd_stockVO selectOutProcessing(
			@Param("out_schedule_cd") String out_schedule_cd, 
			@Param("product_cd") String product_cd,
			@Param("outqty") String outqty);

	public List<OutScheduleListVO> selectOutScheduleSum();

	public List<OutScheduleListVO> selectOutScheduleCount();

	public int updateStockQty(@Param("ospp") Out_schedule_per_productVO ospp);

	public int updateOutQty(@Param("ospp") Out_schedule_per_productVO ospp);


}
