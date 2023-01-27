package com.itwillbs.wms4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.wms4.mapper.HrMapper;

@Service
public class HrService {
	
	@Autowired
	private HrMapper mapper;
}
