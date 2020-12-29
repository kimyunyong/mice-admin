package com.mice.crm.service;

import java.util.List;

public class EventPlusVO {
	
	private int crm_event_idx = 0;
	private int customer_idx = 0;
	private int organizer_idx = 0;
	
	private String organizer_name = "";
	private String customer_name = "";
	private String customer_position = "";
	private String customer_tel_no = "";
	private String customer_phone_no = "";
	private String customer_email = "";
	
	private String reg_id = "";

	
	public int getCrm_event_idx() {
		return crm_event_idx;
	}
	public void setCrm_event_idx(int crm_event_idx) {
		this.crm_event_idx = crm_event_idx;
	}
	
	public int getCustomer_idx() {
		return customer_idx;
	}
	public void setCustomer_idx(int customer_idx) {
		this.customer_idx = customer_idx;
	}
		
	public int getOrganizer_idx() {
		return organizer_idx;
	}
	public void setOrganizer_idx(int organizer_idx) {
		this.organizer_idx = organizer_idx;
	}	
	
	
	
	public String getOrganizer_name() {
		return organizer_name;
	}
	public void setOrganizer_name(String organizer_name) {
		this.organizer_name = organizer_name;
	}
		
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_position() {
		return customer_position;
	}
	public void setCustomer_position(String customer_position) {
		this.customer_position = customer_position;
	}
	public String getCustomer_tel_no() {
		return customer_tel_no;
	}
	public void setCustomer_tel_no(String customer_tel_no) {
		this.customer_tel_no = customer_tel_no;
	}
	public String getCustomer_phone_no() {
		return customer_phone_no;
	}
	public void setCustomer_phone_no(String customer_phone_no) {
		this.customer_phone_no = customer_phone_no;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	
	
	
	
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	
	
}
