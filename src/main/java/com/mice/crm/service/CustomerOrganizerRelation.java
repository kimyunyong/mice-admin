package com.mice.crm.service;

public class CustomerOrganizerRelation {
	public int customer_idx = -1;
	public int organizer_idx = -1;
	public String unit = "";
	public String staff = "";
	public String add_tel_no = "";
	public String operation = "";
	public String reg_id = "";
	public String reg_date = "";

	public String address_ko = "";
	public String address_en = "";
	
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getAdd_tel_no() {
		return add_tel_no;
	}
	public void setAdd_tel_no(String add_tel_no) {
		this.add_tel_no = add_tel_no;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	public String getAddress_ko() {
		return address_ko;
	}
	public void setAddress_ko(String address_ko) {
		this.address_ko = address_ko;
	}
	
	public String getAddress_en() {
		return address_en;
	}
	public void setAddress_en(String address_en) {
		this.address_en = address_en;
	}
	
}
