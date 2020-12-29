package com.mice.cvb.organizer.service;

public class Organizer {

	private int idx = -1;
	private int rowNum = -1;
	private String type = "유관기관";
	private String sub_type = "";
	private String organizer_name_ko = "";
	private String organizer_name_en = "";
	private String address_ko = "";
	private String address_en = "";
	private String tel_no = "";
	private String fax_no = "";
	private String email = "";
	private String homepage = "";
	private String logo_file_id = "";
	private String comment = "";
	
	private String reg_id = "";
	private String reg_date = "";
	private String expire_id = "";
	private String expire_date = "";
	
	
	
	
	public String getSub_type() {
		return sub_type;
	}
	public void setSub_type(String sub_type) {
		this.sub_type = sub_type;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOrganizer_name_ko() {
		return organizer_name_ko;
	}
	public void setOrganizer_name_ko(String organizer_name_ko) {
		this.organizer_name_ko = organizer_name_ko;
	}
	public String getOrganizer_name_en() {
		return organizer_name_en;
	}
	public void setOrganizer_name_en(String organizer_name_en) {
		this.organizer_name_en = organizer_name_en;
	}
	public String getAddress_ko() {		
		return address_ko;
	}
	public void setAddress_ko(String address_ko) {
		try
		{
			this.address_ko = com.mice.common.encrypt.AESGenerator.encrypt(address_ko);
		}catch(Exception ex){
			this.address_ko = address_ko;
		}
	}
	public String getAddress_en() {
		return address_en;
	}
	public void setAddress_en(String address_en) {
		try
		{
			this.address_en = com.mice.common.encrypt.AESGenerator.encrypt(address_en);
		}catch(Exception ex){
			this.address_en = address_en;
		}
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		try
		{
			this.tel_no = com.mice.common.encrypt.AESGenerator.encrypt(tel_no);
		}catch(Exception ex){
			this.tel_no = tel_no;
		}
	}
	public String getFax_no() {
		return fax_no;
	}
	public void setFax_no(String fax_no) {
		try
		{
			this.fax_no = com.mice.common.encrypt.AESGenerator.encrypt(fax_no);
		}catch(Exception ex){
			this.fax_no = fax_no;
		}
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		try
		{
			this.email = com.mice.common.encrypt.AESGenerator.encrypt(email);
		}catch(Exception ex){
			this.email = email;
		}
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getLogo_file_id() {
		return logo_file_id;
	}
	public void setLogo_file_id(String logo_file_id) {
		this.logo_file_id = logo_file_id;
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
	public String getExpire_id() {
		return expire_id;
	}
	public void setExpire_id(String expire_id) {
		this.expire_id = expire_id;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	
	
}
