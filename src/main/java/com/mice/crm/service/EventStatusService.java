package com.mice.crm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface EventStatusService {
	
	public List<EventStatusVO> listStatusCalendar(EventStatusVO vo);
	public List<EventStatusVO> listStatusCalendarWeek(EventStatusVO vo);
	public List<EventStatusFacilityVO> listStatusFacility(EventStatusFacilityVO facVo);
	public List<EventStatusDayVO> listStatusDay(EventStatusDayVO dayVo);
	
	/* 통합 검색 */
	public Map<String, Object> listEventTotalSearchSMS(EventTotalSearchVO vo);
	public Map<String, Object> listEventTotalSearchExcel(EventTotalSearchVO vo);
	public Map<String, Object> listEventTotalSearch(EventTotalSearchVO vo);
	public int listEventTotalSearchCount(EventTotalSearchVO vo);
	public List<EventTotalSearchVO> listEventTotalSearchSub(EventTotalSearchVO vo);
	

	public Map<String, Object> listEventTopTotalSearchSMS(EventTotalSearchVO vo);
	public Map<String, Object> listEventTopTotalSearchExcel(EventTotalSearchVO vo);
	public Map<String, Object> listEventTopTotalSearch(EventTotalSearchVO vo);
	public int listEventTopTotalSearchCount(EventTotalSearchVO vo);
	public List<EventTotalSearchVO> listEventTopTotalSearchSub(EventTotalSearchVO vo);
	

	//엑셀 목록
	public void insertExcelSearch(EventTotalSearchVO vo);
	public List<EventTotalSearchVO> selectExcelSearch(EventTotalSearchVO vo);
	public Map<String, Object> listExcelSearch(EventTotalSearchVO vo);
	public int listExcelSearchCount(EventTotalSearchVO vo);
	public void deleteExcelSearch(EventTotalSearchVO vo);
	
	
	
}
