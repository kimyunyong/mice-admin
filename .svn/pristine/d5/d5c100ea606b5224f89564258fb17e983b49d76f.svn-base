package com.mice.common.log.service.impl;

import org.springframework.stereotype.Repository;

import com.mice.common.log.service.LogVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("LogWDAO")
public class LogWDAO extends EgovComAbstractDAO {

	public LogVO selectLog(LogVO vo) {
		return (LogVO)select("LogWDAO.select", vo);
	}
}
