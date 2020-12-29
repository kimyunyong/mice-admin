package com.mice.crm.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class EventStatusVO {



	
	
	java.util.Date today = new java.util.Date();
	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	SimpleDateFormat month = new SimpleDateFormat("MM");
	SimpleDateFormat day = new SimpleDateFormat("dd");	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	Calendar cal = Calendar.getInstance();
	//date_pre = today.parse( cal.add(Calendar.DAY_OF_MONTH, -7) );
	//date_next = today.parse( cal.add(Calendar.DAY_OF_MONTH, -7) );
	//cal.setTime().get(date_pre);	
	//private int pre_date = cal.add(Calendar.DAY_OF_MONTH,-7);
	//private String dayofmonth = cal.get(Calendar.DAY_OF_MONTH,-7);
	//private String pre_date = sdf.format(dayofmonth.get);
	
	
	//private int day_num = cal.get(Calendar.DAY_OF_WEEK);
	//private int month_num = cal.get(Calendar.WEEK_OF_MONTH);
	
	
	private String yyyymmdd = "";
	private String days = "";
	private int dayweek = 0;
	private int monthweek = 0;
	private String holiday = "";
	private String idx = "";
	private String name_ko = "";
	private String implementsStatusName = "";
	
	private String searchYear = year.format(today);
	private String searchMonth = month.format(today);
	private String searchDay = day.format(today);
	private String searchYearMonth = year.format(today) + month.format(today);
	
	
	private String searchToday = "";
	private String searchPreDay = "";
	private String searchNextDay = "";
	private String searchViewChk = "W"; //W : 주별, D : 오늘, M: 월별
	private String searchDayName = ""; //월,화,수,목,금

	private String searchOrderby = "0";
	private String searchPlaceIdx = "";
	private List searchImplementsStatusList = null;
	private List searchEventDivisionList = null;

	private String dayweek_han;


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
	public int getDayweek() {
		return dayweek;
	}
	public void setDayweek(int dayweek) {
		this.dayweek = dayweek;
	}
	
	public int getMonthweek() {
		return monthweek;
	}
	public void setMonthweek(int monthweek) {
		this.monthweek = monthweek;
	}
	

	
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getImplementsStatusName() {
		return implementsStatusName;
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
	
	public void setImplementsStatusName(String implementsStatusName) {
		this.implementsStatusName = implementsStatusName;
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
	public String getSearchDay() {
		return searchDay;
	}
	public void setSearchDay(String searchDay) {
		this.searchDay = searchDay;
		//setSearchToday(this.searchYear+this.searchMonth+this.searchDay);
	}
	public String getSearchYearMonth() {
		return searchYearMonth;
	}
	public void setSearchYearMonth(String searchYearMonth) {
		this.searchYearMonth = searchYearMonth;
	}
	
	
	
	
	
	public String getSearchToday() {
		return searchToday;
	}
	public void setSearchToday(String searchToday) {
		this.searchToday = searchToday;
	}
	public String getSearchPreDay() {
		return searchPreDay;
	}
	public void setSearchPreDay(String searchPreDay) {
		this.searchPreDay = searchPreDay;
	}	
	public String getSearchNextDay() {
		return searchNextDay;
	}
	public void setSearchNextDay(String searchNextDay) {
		this.searchNextDay = searchNextDay;
	}	
	
	public String getSearchViewChk() {
		return searchViewChk;
	}
	public void setSearchViewChk(String searchViewChk) {
		this.searchViewChk = searchViewChk;
	}
	
	public String getSearchDayName() {
		return searchDayName;
	}
	public void setSearchDayName(String searchDayName) {
		this.searchDayName = searchDayName;
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
	
	
	/*
	public int getWeek_num() {
		return week_num;
	}
	public void setWeek_num(int Week_num) {
		this.week_num = week_num;
	}
	public int getDay_num() {
		return week_num;
	}
	public void setDay_num(int Day_num) {
		this.day_num = day_num;
	}

	
	public String getDayweek_han() {
		return dayweek_han;
	}
	public void setDayweek_han(String dayweek_han) {
		this.dayweek_han = dayweek_han;
	}
	
	*/	
	
}
