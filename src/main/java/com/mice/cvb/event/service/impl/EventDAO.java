package com.mice.cvb.event.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mice.cvb.event.service.EventService;
import com.mice.cvb.event.service.EventVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("EventDAO")
public class EventDAO extends EgovComAbstractDAO {

	
	public void deleteEvent(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("EventDAO.deleteEvent", vo);
	}

	
	public void updateEvent(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("EventDAO.updateEvent", vo);
	}

	
	public EventVO selectEvent(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EventVO)select("EventDAO.selectEvent", vo);
	}

	
	@SuppressWarnings("unchecked")
	public List<EventVO> selectEventList(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<EventVO>)list("EventDAO.selectEventList", vo);
	}

	
	public int selectEventListCnt(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int)select("EventDAO.selectEventListCnt", vo);
	}

	
  
}
