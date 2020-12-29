package com.mice.crm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.crm.service.EventStatusVO;
import com.mice.crm.service.EventThemeVO;
import com.mice.crm.service.EventStatusFacilityVO;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.EventAttachFile;
import com.mice.crm.service.EventStatusDayVO;

import com.mice.crm.service.EventTotalSearchVO;
import com.mice.crm.service.TotalSearchExcelVO;


import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("EventStatusDAO")
public class EventStatusDAO extends EgovComAbstractDAO {

	public List<EventStatusVO> listStatusCalendar(EventStatusVO vo) {
		return (List<EventStatusVO>)list("EventStatusDAO.listStatusCalendar", vo);
	}

	public List<EventStatusVO> listStatusCalendarWeek(EventStatusVO vo) {
		return (List<EventStatusVO>)list("EventStatusDAO.listStatusCalendarWeek", vo);
	}
	
	public List<EventStatusFacilityVO> listStatusFacility(EventStatusFacilityVO facVo) {
		return (List<EventStatusFacilityVO>)list("EventStatusDAO.listStatusFacility", facVo);
	}
	
	public List<EventStatusDayVO> listStatusDay(EventStatusDayVO dayVo) {
		return (List<EventStatusDayVO>)list("EventStatusDAO.listStatusDay", dayVo);
	}

		
	
	
	
	
	
	public List<EventTotalSearchVO> listEventTotalSearchSMS(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTotalSearchSMS", vo);
	}	
	
	public List<EventTotalSearchVO> listEventTotalSearchExcel(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTotalSearchExcel", vo);
	}
	
	public List<EventTotalSearchVO> listEventTotalSearch(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTotalSearch", vo);
	}
	
	public int listEventTotalSearchCount(EventTotalSearchVO vo){
		return (int)select("EventStatusDAO.listEventTotalSearchCount", vo);
	}

	public List<EventTotalSearchVO> listEventTotalSearchSub(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTotalSearchSub", vo);
	}
	

	
	
	


		
	
	public List<EventTotalSearchVO> listEventTopTotalSearchSMS(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTopTotalSearchSMS", vo);
	}	
	
	public List<EventTotalSearchVO> listEventTopTotalSearchExcel(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTopTotalSearchExcel", vo);
	}
		
	public List<EventTotalSearchVO> listEventTopTotalSearch(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTopTotalSearch", vo);
	}
	
	public int listEventTopTotalSearchCount(EventTotalSearchVO vo){
		return (int)select("EventStatusDAO.listEventTopTotalSearchCount", vo);
	}
	
	public List<EventTotalSearchVO> listEventTopTotalSearchSub(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listEventTopTotalSearchSub", vo);
	}
	
	
	
	
	
	
	
	//엑셀파일 목록
	public void insertExcelSearch(EventTotalSearchVO vo){
		insert("EventStatusDAO.insertExcelSearch", vo);
	}
	public List<EventTotalSearchVO> selectExcelSearch(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.selectExcelSearch", vo);
	}	
	public List<EventTotalSearchVO> listExcelSearch(EventTotalSearchVO vo) {
		return (List<EventTotalSearchVO>)list("EventStatusDAO.listExcelSearch", vo);
	}
	public int listExcelSearchCount(EventTotalSearchVO vo){
		return (int)select("EventStatusDAO.listExcelSearchCount", vo);
	}	
	public void deleteExcelSearch(EventTotalSearchVO vo){
		update("EventStatusDAO.deleteExcelSearch", vo);
	}		
	
	
	
	
	
}
