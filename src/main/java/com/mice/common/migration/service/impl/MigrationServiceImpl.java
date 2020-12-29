package com.mice.common.migration.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.common.migration.service.MigVO;
import com.mice.common.migration.service.MigrationService;

@Service("MigrationService")
public class MigrationServiceImpl implements MigrationService {

	@Resource(name = "MigrationDAO")
	MigrationDAO dao;
	
	@Override
	public List<MigVO> listMig(MigVO vo) {
		 
		return dao.listMig(vo);
	}

	@Override
	public void setMig(MigVO vo) {
		dao.setMig(vo);
	}

}
