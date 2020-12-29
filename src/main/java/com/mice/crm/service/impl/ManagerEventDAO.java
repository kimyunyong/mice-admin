package com.mice.crm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.crm.service.CustomerOrganizerRelationVO;
import com.mice.crm.service.EventThemeVO;
import com.mice.crm.service.ManagerEvent;
import com.mice.crm.service.ManagerEventVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


@Repository("ManagerEventDAO")
public class ManagerEventDAO extends EgovComAbstractDAO{

	
	public List<ManagerEventVO> listManagerCategoryListAll(ManagerEventVO vo) {
		return (List<ManagerEventVO>)list("ManagerEventDAO.listManagerCategoryListAll", vo);
	}
	
	public List<ManagerEventVO> listManagerCategoryListSub(ManagerEventVO vo) {
		return (List<ManagerEventVO>)list("ManagerEventDAO.listManagerCategoryListSub", vo);
	}

	public ManagerEventVO selectManagerCategory(ManagerEventVO vo){
		return (ManagerEventVO)select("ManagerEventDAO.selectManagerCategory", vo);
	}
	
	public ManagerEventVO selectManagerCategorySortNum(ManagerEventVO vo){
		return (ManagerEventVO)select("ManagerEventDAO.selectManagerCategorySortNum", vo);
	}
		
	
	
	public int insertManagerCategory(ManagerEventVO vo){
		return (int)insert("ManagerEventDAO.insertManagerCategory", vo);
	}	

	public void updateManagerCategory(ManagerEventVO vo){
		update("ManagerEventDAO.updateManagerCategory", vo);
	}	
	
	public void deleteManagerCategory(ManagerEventVO vo){
		update("ManagerEventDAO.deleteManagerCategory", vo);
	}	

	
	
	public ManagerEventVO selectManagerCategorySortUpIdx(ManagerEventVO vo){
		return (ManagerEventVO)select("ManagerEventDAO.selectManagerCategorySortUpIdx", vo);
	}	
	public void updateManagerCategorySortChange(ManagerEventVO vo){
		update("ManagerEventDAO.updateManagerCategorySortChange", vo);
	}		
	
	public ManagerEventVO selectManagerCategorySortDownIdx(ManagerEventVO vo){
		return (ManagerEventVO)select("ManagerEventDAO.selectManagerCategorySortDownIdx", vo);
	}	
	

	public List<ManagerEventVO> listManagerEvent(ManagerEventVO vo) {
		return (List<ManagerEventVO>)list("ManagerEventDAO.listManagerEvent", vo);
	}
	
	
}
