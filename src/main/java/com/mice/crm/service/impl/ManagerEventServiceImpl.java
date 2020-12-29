package com.mice.crm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.ManagerEventService;
import com.mice.crm.service.ManagerEvent;
import com.mice.crm.service.ManagerEventVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ManagerEventService")
public class ManagerEventServiceImpl implements ManagerEventService{


	@Resource(name = "ManagerEventDAO")
	ManagerEventDAO dao;
	

	@Override
	public List<ManagerEventVO> listManagerCategoryListAll(ManagerEventVO vo) {
		return dao.listManagerCategoryListAll(vo);
	}
	
	@Override
	public List<ManagerEventVO> listManagerCategoryListSub(ManagerEventVO vo) {
		return dao.listManagerCategoryListSub(vo);
	}

	@Override
	public ManagerEventVO selectManagerCategory(ManagerEventVO vo){
		return dao.selectManagerCategory(vo);
	}
	

	@Override
	public ManagerEventVO selectManagerCategorySortNum(ManagerEventVO vo){
		return dao.selectManagerCategorySortNum(vo);
	}	
	
	@Override
	public int insertManagerCategory(ManagerEventVO vo){
		return dao.insertManagerCategory(vo);
	}	

	@Override
	public void updateManagerCategory(ManagerEventVO vo){
		dao.updateManagerCategory(vo);
	}	
	
	@Override
	public void deleteManagerCategory(ManagerEventVO vo){
		dao.deleteManagerCategory(vo);
	}	
	
	
	
	@Override
	public ManagerEventVO selectManagerCategorySortUpIdx(ManagerEventVO vo){
		return dao.selectManagerCategorySortUpIdx(vo);
	}	
	@Override
	public void updateManagerCategorySortChange(ManagerEventVO vo){
		dao.updateManagerCategorySortChange(vo);
	}		
	
	@Override
	public ManagerEventVO selectManagerCategorySortDownIdx(ManagerEventVO vo){
		return dao.selectManagerCategorySortDownIdx(vo);
	}	
	
	

	@Override
	public List<ManagerEventVO> listManagerEvent(ManagerEventVO vo) {
		return dao.listManagerEvent(vo);
	}	
	

	
}
