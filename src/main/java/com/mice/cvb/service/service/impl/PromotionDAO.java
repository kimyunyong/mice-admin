package com.mice.cvb.service.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mice.cvb.service.service.PromotionVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("PromotionDAO")
public class PromotionDAO  extends EgovComAbstractDAO  {

	public void deletePromotion(PromotionVO vo){
		update("PromotionDAO.delete", vo);
	}
	
	public void updatePromotion(PromotionVO vo){
		update("PromotionDAO.update", vo);
	}
	
	public PromotionVO selectPromotion(int idx){
		return (PromotionVO)select("PromotionDAO.select", idx);
	}
	
	public List<PromotionVO> selectPromotionList(PromotionVO vo) throws Exception{
		return (List<PromotionVO>)list("PromotionDAO.list", vo);
	}
	
	public int selectPromotionListCount(PromotionVO vo) throws Exception{
		return (int)select("PromotionDAO.listCount", vo);
	}
}
