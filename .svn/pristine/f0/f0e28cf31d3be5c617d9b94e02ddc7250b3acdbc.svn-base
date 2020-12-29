package com.mice.crm.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.crm.service.EventStatusService;
import com.mice.crm.service.EventStatusVO;
import com.mice.crm.service.EventThemeVO;
import com.mice.crm.service.EventStatusFacilityVO;
import com.mice.crm.service.CRMService;
import com.mice.crm.service.CodeVO;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.EventPlusVO;
import com.mice.crm.service.EventStatusDayVO;
import com.mice.crm.service.EventTotalSearchVO;
import com.mice.crm.service.PromotionVO;
import com.mice.crm.service.TotalSearchExcelVO;

import java.util.Map;
import com.sun.star.ucb.ListEvent;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("EventStatusService")
public class EventStatusServiceImpl implements EventStatusService {

	@Resource(name = "EventStatusDAO")
	EventStatusDAO dao;
	
	@Override
	public List<EventStatusVO> listStatusCalendar(EventStatusVO vo) {
		return dao.listStatusCalendar(vo);
	}

	@Override
	public List<EventStatusVO> listStatusCalendarWeek(EventStatusVO vo) {
		return dao.listStatusCalendarWeek(vo);
	}
	
	@Override
	public List<EventStatusFacilityVO> listStatusFacility(EventStatusFacilityVO facVo) {
		return dao.listStatusFacility(facVo);
	}

	@Override
	public List<EventStatusDayVO> listStatusDay(EventStatusDayVO dayVo) {
		return dao.listStatusDay(dayVo);
	}
	
	

	
	
	
	
	@Override
	public Map<String, Object> listEventTotalSearchExcel(EventTotalSearchVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listEventTotalSearchExcel(vo));
		//map.put("resultListCount", dao.eventTotalSearchExcel(vo));
		return map;
	}	
	
	@Override
	public Map<String, Object> listEventTotalSearchSMS(EventTotalSearchVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listEventTotalSearchSMS(vo));
		return map;
	
	}	
	
	@Override
	public Map<String, Object> listEventTotalSearch(EventTotalSearchVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listEventTotalSearch(vo));
		map.put("resultListCount", dao.listEventTotalSearchCount(vo));
		return map;
	
	}
	
	@Override
	public int listEventTotalSearchCount(EventTotalSearchVO vo) {
		return dao.listEventTotalSearchCount(vo);
	}	
	
	@Override
	public List<EventTotalSearchVO> listEventTotalSearchSub(EventTotalSearchVO vo) {
		return dao.listEventTotalSearchSub(vo);
	}	


	
	
	
	
	
	@Override
	public Map<String, Object> listEventTopTotalSearchExcel(EventTotalSearchVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listEventTopTotalSearchExcel(vo));
		//map.put("resultListCount", dao.eventTotalSearchExcel(vo));
		return map;
	}	
	
	@Override
	public Map<String, Object> listEventTopTotalSearchSMS(EventTotalSearchVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listEventTopTotalSearchSMS(vo));
		return map;
	
	}	
	
	@Override
	public Map<String, Object> listEventTopTotalSearch(EventTotalSearchVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listEventTopTotalSearch(vo));
		map.put("resultListCount", dao.listEventTopTotalSearchCount(vo));
		return map;
	
	}
	
	@Override
	public int listEventTopTotalSearchCount(EventTotalSearchVO vo) {
		return dao.listEventTopTotalSearchCount(vo);
	}
	
	@Override
	public List<EventTotalSearchVO> listEventTopTotalSearchSub(EventTotalSearchVO vo) {
		return dao.listEventTopTotalSearchSub(vo);
	}	
	

	
	
	
	//엑셀파일 목록
	
	@Override
	public void insertExcelSearch(EventTotalSearchVO vo) {
		dao.insertExcelSearch(vo);
	}
	
	@Override
	public List<EventTotalSearchVO> selectExcelSearch(EventTotalSearchVO vo) {
		return dao.selectExcelSearch(vo);
	}	
	
	@Override
	public Map<String, Object> listExcelSearch(EventTotalSearchVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listExcelSearch(vo));
		map.put("resultListCount", dao.listExcelSearchCount(vo));
		return map;
	}	

	
	
	@Override
	public int listExcelSearchCount(EventTotalSearchVO vo) {
		return dao.listExcelSearchCount(vo);
	}
	
	
	@Override
	public void deleteExcelSearch(EventTotalSearchVO vo) {
		dao.deleteExcelSearch(vo);
	}
	


	
	
}
