package com.mice.cvb.lodgment.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.cvb.lodgment.service.LodgmentService;
import com.mice.cvb.lodgment.service.LodgmentVO;

@Service("LodgmentService")
public class LodgmentServiceImpl implements LodgmentService {

	@Resource(name = "LodgmentDAO")
	private LodgmentDAO dao;
	
	@Override
	public void delete(LodgmentVO vo) {
		// TODO Auto-generated method stub
		dao.delete(vo);;
	}

	@Override
	public void update(LodgmentVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public LodgmentVO select(LodgmentVO vo) {
		// TODO Auto-generated method stub
		return dao.select(vo);
	}

	@Override
	public Map<String, Object> list(LodgmentVO vo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.list(vo));
		map.put("resultListCount", listCount(vo));
		return map;
	}

	@Override
	public int listCount(LodgmentVO vo) {
		// TODO Auto-generated method stub
		return dao.listCount(vo);
	}

	@Override
	public void insert(LodgmentVO vo) {
		dao.insert(vo);
		
	}

}
