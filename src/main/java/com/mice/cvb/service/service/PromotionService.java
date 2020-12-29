package com.mice.cvb.service.service;

import java.util.Map;

public interface PromotionService {
	/*public void insertPromotion(PromotionVO vo);*/
	public void deletePromotion(PromotionVO vo);
	
	public void updatePromotion(PromotionVO vo);
	
	public PromotionVO selectPromotion(int idx);
	
	public Map<String, Object> selectPromotionList(PromotionVO vo) throws Exception;
	
	public int selectPromotionListCount(PromotionVO vo) throws Exception;
}
