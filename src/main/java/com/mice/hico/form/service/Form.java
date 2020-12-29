package com.mice.hico.form.service;

public class Form {
	public int idx = -1;
	public String title = "";
	public String form_file_id = "";
	public String reg_date = "";
	
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getForm_file_id() {
		return form_file_id;
	}
	public void setForm_file_id(String form_file_id) {
		this.form_file_id = form_file_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
