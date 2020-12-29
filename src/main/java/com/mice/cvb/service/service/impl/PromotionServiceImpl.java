package com.mice.cvb.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.cvb.service.service.PromotionService;
import com.mice.cvb.service.service.PromotionVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("PromotionService")
public class PromotionServiceImpl extends EgovAbstractServiceImpl implements PromotionService {

	@Resource(name = "PromotionDAO")
	private PromotionDAO dao;


	@Override
	public void deletePromotion(PromotionVO vo) {
		// TODO Auto-generated method stub
		dao.deletePromotion(vo);
	}

	@Override
	public void updatePromotion(PromotionVO vo) {
		// TODO Auto-generated method stub
		dao.updatePromotion(vo);
	}

	@Override
	public PromotionVO selectPromotion(int idx) {
		// TODO Auto-generated method stub
		return dao.selectPromotion(idx);
	}

	@Override
	public Map<String, Object> selectPromotionList(PromotionVO vo)
			throws Exception {
		List<PromotionVO> lst = dao.selectPromotionList(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", lst);
		map.put("resultListCount", selectPromotionListCount(vo));
		return map;
	}

	@Override
	public int selectPromotionListCount(PromotionVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int)dao.selectPromotionListCount(vo);
	}
	
}
