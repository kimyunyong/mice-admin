package com.mice.crm.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class EventCalendarVO  {

	private String idx = "";
	private String name_ko = "";
	private String yyyymmdd = "";
	private String days = "";
	private String dayweek = "";
	private String holiday = "";
	private String implementsStatusName = "";
	private String event_division_idx = "";
	
	java.util.Date today = new java.util.Date();
	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	SimpleDateFormat month = new SimpleDateFormat("MM");
	private String searchYear = year.format(today);
	private String searchMonth = month.format(today);
	private String searchYearMonth = year.format(today) + month.format(today);
	private String searchOrderby = "0";
	private String searchPlaceIdx = "";
	private List searchImplementsStatusList = null;
	private List searchEventDivisionList = null;

	private String pop = "";

	
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getImplementsStatusName() {
		return implementsStatusName;
	}
	public void setImplementsStatusName(String implementsStatusName) {
		this.implementsStatusName = implementsStatusName;
	}
	
	public String getEvent_division_idx() {
		return event_division_idx;
	}
	public void setEvent_division_idx(String event_division_idx) {
		this.event_division_idx = event_division_idx;
	}
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	
	
	
	public String getName_ko() {
		return name_ko;
	}
	public void setName_ko(String name_ko) {
		this.name_ko = name_ko;
	}
	public String getYyyymmdd() {
		return yyyymmdd;
	}
	public void setYyyymmdd(String yyyymmdd) {
		this.yyyymmdd = yyyymmdd;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getDayweek() {
		return dayweek;
	}
	public void setDayweek(String dayweek) {
		this.dayweek = dayweek;
	}
	public String getSearchYear() {
		return searchYear;
	}
	public void setSearchYear(String searchYear) {
		this.searchYear = searchYear;
		setSearchYearMonth(this.searchYear+this.searchMonth);
	}
	public String getSearchMonth() {
		return searchMonth;
	}
	public void setSearchMonth(String searchMonth) {
		this.searchMonth = searchMonth;
		setSearchYearMonth(this.searchYear+this.searchMonth);
	}
	
	public String getSearchYearMonth() {
		return searchYearMonth;
	}
	public void setSearchYearMonth(String searchYearMonth) {
		this.searchYearMonth = searchYearMonth;
	}
	public String getSearchOrderby() {
		return searchOrderby;
	}
	public void setSearchOrderby(String searchOrderby) {
		this.searchOrderby = searchOrderby;
	}

	
	public String getSearchPlaceIdx() {
		return searchPlaceIdx;
	}
	public void setSearchPlaceIdx(String searchPlaceIdx) {
		this.searchPlaceIdx = searchPlaceIdx;
	}
	public List getSearchImplementsStatusList() {
		return searchImplementsStatusList;
	}
	public void setSearchImplementsStatusList(List searchImplementsStatusList) {
		this.searchImplementsStatusList = searchImplementsStatusList;
	}
	public List getSearchEventDivisionList() {
		return searchEventDivisionList;
	}
	public void setSearchEventDivisionList(List searchEventDivisionList) {
		this.searchEventDivisionList = searchEventDivisionList;
	}
	
	

	public String getPop() {
		return pop;
	}
	public void setPop(String pop) {
		this.pop = pop;
	}	
	
	
	
}
