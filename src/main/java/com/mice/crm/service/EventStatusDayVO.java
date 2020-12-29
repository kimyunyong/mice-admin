package com.mice.crm.service;

public class EventStatusDayVO {

	int rent_time_am;
	int rent_time_pm;
	int rent_time_night;

	String yyyymmdd = "";
	int fac_idx ;
	String fac_name = "";
	
	public int getRent_time_am() {
		return rent_time_am;
	}
	public void setRent_time_am(int rent_time_am) {
		this.rent_time_am = rent_time_am;
	}
	public int getRent_time_pm() {
		return rent_time_pm;
	}
	public void setRent_time_pm(int rent_time_pm) {
		this.rent_time_pm = rent_time_pm;
	}
	public int getRent_time_night() {
		return rent_time_night;
	}
	public void setRent_time_night(int rent_time_night) {
		this.rent_time_night = rent_time_night;
	}
	
	
	
	public String getYyyymmdd() {
		return yyyymmdd;
	}
	public void setYyyymmdd(String yyyymmdd) {
		this.yyyymmdd = yyyymmdd;
	}
	
	public int getFac_idx() {
		return fac_idx;
	}
	public void setFac_idx(int fac_idx) {
		this.fac_idx = fac_idx;
	}	

	public String getFac_name() {
		return fac_name;
	}
	public void setFac_name(String fac_name) {
		this.fac_name = fac_name;
	}
	
	
	
}
