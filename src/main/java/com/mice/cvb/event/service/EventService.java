package com.mice.cvb.event.service;

import java.util.List;
import java.util.Map;

public interface EventService {
	public void deleteEvent(EventVO vo) throws Exception;
	
	public void updateEvent(EventVO vo) throws Exception;
	
	public EventVO selectEvent(EventVO vo) throws Exception;
	
	public Map<String, Object> selectEventList(EventVO vo) throws Exception;
	
	public int selectEventListCnt(EventVO vo) throws Exception;
}
