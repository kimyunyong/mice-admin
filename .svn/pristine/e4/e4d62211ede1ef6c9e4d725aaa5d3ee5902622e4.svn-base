package com.mice.cvb.brochure.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;







import com.mice.cvb.brochure.service.BrochureService;
import com.mice.cvb.brochure.service.BrochureVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("BrochureService")
public class BrochureServiceImpl extends EgovAbstractServiceImpl implements BrochureService {

	@Resource(name = "BrochureDAO")
	private BrochureDAO dao;
	
	@Override
	public Map<String, Object> list(BrochureVO vo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.list(vo));
		map.put("resultListCount", dao.listCount(vo));
		return map;
	}

	@Override
	public BrochureVO info(int idx) {
		// TODO Auto-generated method stub
		return dao.info(idx);
	}

	@Override
	public void update(BrochureVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(BrochureVO vo) {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public void insert(BrochureVO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

}
