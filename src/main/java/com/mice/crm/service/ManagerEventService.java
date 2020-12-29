package com.mice.crm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ManagerEventService {

	
	public List<ManagerEventVO> listManagerCategoryListAll(ManagerEventVO vo);
	public List<ManagerEventVO> listManagerCategoryListSub(ManagerEventVO vo);
	public ManagerEventVO selectManagerCategory(ManagerEventVO vo);
	public ManagerEventVO selectManagerCategorySortNum(ManagerEventVO vo);
	
	public int insertManagerCategory(ManagerEventVO vo);
	public void updateManagerCategory(ManagerEventVO vo);
	public void deleteManagerCategory(ManagerEventVO vo);
	
	
	public ManagerEventVO selectManagerCategorySortUpIdx(ManagerEventVO vo);
	public void updateManagerCategorySortChange(ManagerEventVO vo);
	public ManagerEventVO selectManagerCategorySortDownIdx(ManagerEventVO vo);

	public List<ManagerEventVO> listManagerEvent(ManagerEventVO vo);

	
}
