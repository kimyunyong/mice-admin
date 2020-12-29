package com.mice.cvb.organizer.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.cvb.organizer.service.OrganizerService;
import com.mice.cvb.organizer.service.OrganizerVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("OrganizerService")
public class OrganizerServiceImpl extends EgovAbstractServiceImpl implements OrganizerService {

	@Resource(name = "OrganizerDAO")
	private OrganizerDAO dao;
	@Override
	public Map<String, Object> list(OrganizerVO vo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.list(vo));
		map.put("resultListCount", dao.listCount(vo));
		return map;
	}

	@Override
	public OrganizerVO info(int idx) {
		// TODO Auto-generated method stub
		return dao.info(idx);
	}

	@Override
	public void insert(OrganizerVO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void edit(OrganizerVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(OrganizerVO vo) {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

}
