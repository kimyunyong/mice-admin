package com.mice.cvb.service.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.cvb.event.service.EventService;
import com.mice.cvb.event.service.EventVO;
import com.mice.cvb.service.service.RFPService;
import com.mice.cvb.service.service.RFPVO;

@Service("RFPService")
public class RFPServiceImpl implements RFPService  {

	@Resource(name = "RFPDAO")
	private RFPDAO dao;

	@Override
	public void updateRFP(RFPVO vo) {
		// TODO Auto-generated method stub
		dao.updateRFP(vo);
	}

	@Override
	public RFPVO selectRFP(int idx) {
		
		return dao.selectRFP(idx);
	}

	@Override
	public Map<String, Object> selectRFPList(RFPVO vo) throws Exception {
		List<RFPVO> lst = dao.selectRFPList(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", lst);
		map.put("resultListCount", selectRFPListCount(vo));
		return map;
	}

	@Override
	public int selectRFPListCount(RFPVO vo) throws Exception {
		return dao.selectRFPListCount(vo);
	}

	@Override
	public void deleteRFP(RFPVO vo) throws Exception {
		dao.deleteRFP(vo);
	}
}
