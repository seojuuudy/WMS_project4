package com.itwillbs.wms4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.wms4.vo.ClientVO;

public interface ClientMapper {

	public int insertClint(ClientVO client);

	public List<ClientVO> selectClientList(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	public int selectClientListCount(
			@Param("searchType") String searchType, 
			@Param("keyword") String keyword);

	public ClientVO selectClient(
			@Param("business_no") String business_no, 
			@Param("cust_name") String cust_name);

	public String selectBusinessNo(
			@Param("business_no")String business_no, 
			@Param("cust_name")String cust_name);
	
}
