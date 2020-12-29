package com.mice.crm.service;

import java.util.List;

public class EventThemeVO {

	private int crm_event_idx = 0;
	private String event_theme = "";
	private String event_theme_name = "";
	private String reg_id = "";

	
	public int getCrm_event_idx() {
		return crm_event_idx;
	}
	public void setCrm_event_idx(int crm_event_idx) {
		this.crm_event_idx = crm_event_idx;
	}
	
	
	public String getEvent_theme() {
		return event_theme;
	}
	public void setEvent_theme(String event_theme) {
		this.event_theme = event_theme;
	}

	
	public String getEvent_theme_name() {
		return event_theme_name;
	}
	public void setEvent_theme_name(String event_theme_name) {
		this.event_theme_name = event_theme_name;
	}


	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	
}
