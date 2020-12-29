package com.mice.common.log.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.common.log.service.LogVO;
import com.mice.common.log.service.LogWService;

@Service("LogWService")
public class LogWServiceImpl implements LogWService {

	@Resource(name = "LogWDAO")
	private LogWDAO dao;
	@Override
	public LogVO selectLog(LogVO vo) {
		// TODO Auto-generated method stub
		return dao.selectLog(vo);
	}

}
