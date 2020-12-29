package com.mice.common.migration.service;

import java.util.List;

public interface MigrationService {

	public List<MigVO> listMig(MigVO vo);
	
	public void setMig(MigVO vo);
}
