package com.itwillbs.wms4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.ClientMapper;
import com.itwillbs.wms4.vo.ClientVO;

@Service
public class ClientService {

	@Autowired
	private ClientMapper mapper;

	public int registClient(ClientVO client) {
		return mapper.insertClint(client);
	}

	public List<ClientVO> getClientList(String searchType, String keyword, int startRow, int listLimit) {
		return mapper.selectClientList(searchType, keyword, startRow, listLimit);
	}

	public int getBoardListCount(String searchType, String keyword) {
		return mapper.selectClientListCount(searchType, keyword);
	}

	public ClientVO getClient(String business_no, String cust_name) {
		return mapper.selectClient(business_no, cust_name);
	}

	public void removeClient(ClientVO client) {
		mapper.deleteClient(client);
	}

	public int clientModify(ClientVO client) {
		return mapper.updateClient(client);
	}
}
