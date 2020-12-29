package com.mice.common.migration.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.common.migration.service.MigVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("MigrationDAO")
public class MigrationDAO extends EgovComAbstractDAO {

	public List<MigVO> listMig(MigVO vo) {
		return (List<MigVO>)list("MigrationDAO.listMig", vo);
	}

	public void setMig(MigVO vo) {
		update("MigrationDAO.setMig", vo);
	}
}
