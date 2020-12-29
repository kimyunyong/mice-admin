package com.mice.cvb.service.service;

public class Promotion {
	private int idx = -1;
	private String site = "";
	private String organization_name_ko = "";
	private String organization_name_en = "";
	private String manager_name = "";
	private String manager_class = "";
	private String manager_tel_no = "";
	private String organization_fax_no = "";
	private String manager_phone_no = "";
	private String manager_email = "";
	private String organization_address = "";
	private String organization_zip_code = "";
	private String organization_homepage = "";
	private String promotion_type = "";
	private String confirm_id = "";
	private String confirm_status = "";
	private String confirm_date = "";
	private String confirm_update_date = "";
	private String reg_date = "";
	private int form_type = 0;
	private String require_member_cnt = "";
	private String expire_id = "";
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOrganization_name_ko() {
		return organization_name_ko;
	}
	public void setOrganization_name_ko(String organization_name_ko) {
		try
		{
			this.organization_name_ko = com.mice.common.encrypt.AESGenerator.encrypt(organization_name_ko);
		}catch(Exception ex){
			this.organization_name_ko = organization_name_ko;
		}
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getOrganization_name_en() {
		return organization_name_en;
	}
	public void setOrganization_name_en(String organization_name_en) {
		try
		{
			this.organization_name_en = com.mice.common.encrypt.AESGenerator.encrypt(organization_name_en);
		}catch(Exception ex){
			this.organization_name_en = organization_name_en;
		}
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		try
		{
			this.manager_name = com.mice.common.encrypt.AESGenerator.encrypt(manager_name);
		}catch(Exception ex){
			this.manager_name = manager_name;
		}
	}
	public String getManager_class() {
		return manager_class;
	}
	public void setManager_class(String manager_class) {
		try
		{
			this.manager_class = com.mice.common.encrypt.AESGenerator.encrypt(manager_class);
		}catch(Exception ex){
			this.manager_class = manager_class;
		}
	}
	public String getManager_tel_no() {
		return manager_tel_no;
	}
	public void setManager_tel_no(String manager_tel_no) {
		try
		{
			this.manager_tel_no = com.mice.common.encrypt.AESGenerator.encrypt(manager_tel_no);
		}catch(Exception ex){
			this.manager_tel_no = manager_tel_no;
		}
	}
	public String getOrganization_fax_no() {
		return organization_fax_no;
	}
	public void setOrganization_fax_no(String organization_fax_no) {
		try
		{
			this.organization_fax_no = com.mice.common.encrypt.AESGenerator.encrypt(organization_fax_no);
		}catch(Exception ex){
			this.organization_fax_no = organization_fax_no;
		}
	}
	public String getManager_phone_no() {
		return manager_phone_no;
	}
	public void setManager_phone_no(String manager_phone_no) {
		try
		{
			this.manager_phone_no = com.mice.common.encrypt.AESGenerator.encrypt(manager_phone_no);
		}catch(Exception ex){
			this.manager_phone_no = manager_phone_no;
		}
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		try
		{
			this.manager_email = com.mice.common.encrypt.AESGenerator.encrypt(manager_email);
		}catch(Exception ex){
			this.manager_email = manager_email;
		}
	}
	public String getOrganization_address() {
		return organization_address;
	}
	public void setOrganization_address(String organization_address) {
		try
		{
			this.organization_address = com.mice.common.encrypt.AESGenerator.encrypt(organization_address);
		}catch(Exception ex){		
			this.organization_address = organization_address;
		}
	}
	public String getOrganization_zip_code() {
		return organization_zip_code;
	}
	public void setOrganization_zip_code(String organization_zip_code) {
		try
		{
			this.organization_zip_code = com.mice.common.encrypt.AESGenerator.encrypt(organization_zip_code);
		}catch(Exception ex){
			this.organization_zip_code = organization_zip_code;
		}
	}
	public String getOrganization_homepage() {
		return organization_homepage;
	}
	public void setOrganization_homepage(String organization_homepage) {
		try
		{
			this.organization_homepage = com.mice.common.encrypt.AESGenerator.encrypt(organization_homepage);
		}catch(Exception ex){
			this.organization_homepage = organization_homepage;
		}
	}
	public String getPromotion_type() {
		return promotion_type;
	}
	public void setPromotion_type(String promotion_type) {
		this.promotion_type = promotion_type;
	}
	public String getConfirm_id() {
		return confirm_id;
	}
	public void setConfirm_id(String confirm_id) {
		this.confirm_id = confirm_id;
	}
	public String getConfirm_status() {
		return confirm_status;
	}
	public void setConfirm_status(String confirm_status) {
		this.confirm_status = confirm_status;
	}
	public String getConfirm_date() {
		return confirm_date;
	}
	public void setConfirm_date(String confirm_date) {
		this.confirm_date = confirm_date;
	}
	public String getConfirm_update_date() {
		return confirm_update_date;
	}
	public void setConfirm_update_date(String confirm_update_date) {
		this.confirm_update_date = confirm_update_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getForm_type() {
		return form_type;
	}
	public void setForm_type(int form_type) {
		this.form_type = form_type;
	}
	public String getRequire_member_cnt() {
		return require_member_cnt;
	}
	public void setRequire_member_cnt(String require_member_cnt) {
		this.require_member_cnt = require_member_cnt;
	}
	public String getExpire_id() {
		return expire_id;
	}
	public void setExpire_id(String expire_id) {
		this.expire_id = expire_id;
	}
	
}
