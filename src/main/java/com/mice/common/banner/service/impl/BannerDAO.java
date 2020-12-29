package com.mice.common.banner.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.common.banner.service.BannerVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("BannerDAO")
public class BannerDAO extends EgovComAbstractDAO {
	
	public List<BannerVO> list(BannerVO vo){
		return (List<BannerVO>)list("BannerDAO.list", vo);
	}

	public int listCount(BannerVO vo){
		return (int)select("BannerDAO.listCount", vo);
	}
	
	public BannerVO select(BannerVO vo){
		return (BannerVO)select("BannerDAO.info", vo);
	}
	
	public void insert(BannerVO vo){
		insert("BannerDAO.insert", vo);
	}
	
	public void update(BannerVO vo){
		update("BannerDAO.update", vo);
	}
	
	public void delete(BannerVO vo){
		update("BannerDAO.delete", vo);
	}
	
	public int getSortNo(BannerVO vo){
		return (int)select("BannerDAO.getSortNo", vo);
	}
	
	public void updateSortNo(BannerVO vo){
		update("BannerDAO.updateSortNo", vo);
	}
}
