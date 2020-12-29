package com.mice.cvb.archive.service;

public class ArchiveCode {
	private int idx = -1;
	private int sort_no = 0;
	private String code_name = "";
	private String code_name_en= "";
	private String reg_date = "";
	private String expire_id = "";
	
	
	
	public String getCode_name_en() {
		return code_name_en;
	}
	public void setCode_name_en(String code_name_en) {
		this.code_name_en = code_name_en;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSort_no() {
		return sort_no;
	}
	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getExpire_id() {
		return expire_id;
	}
	public void setExpire_id(String expire_id) {
		this.expire_id = expire_id;
	}

}
