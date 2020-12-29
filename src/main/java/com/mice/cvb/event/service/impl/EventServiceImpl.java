package com.mice.cvb.event.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.cvb.event.service.EventService;
import com.mice.cvb.event.service.EventVO;

@Service("EventService")
public class EventServiceImpl implements EventService  {

	@Resource(name = "EventDAO")
	private EventDAO dao;

	@Override
	public void deleteEvent(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteEvent(vo);
	}

	@Override
	public void updateEvent(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateEvent(vo);
	}

	@Override
	public EventVO selectEvent(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectEvent(vo);
	}

	@Override
	public Map<String, Object> selectEventList(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		List<EventVO> lst = dao.selectEventList(vo);
		int cnt = dao.selectEventListCnt(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", lst);
		map.put("resultListCnt", cnt);
		return map;
	}

	@Override
	public int selectEventListCnt(EventVO vo) throws Exception {
		
		return dao.selectEventListCnt(vo);
	}

	


}
