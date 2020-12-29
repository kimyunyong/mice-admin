package com.mice.crm.service;

import java.util.List;

public class Customer {
	private int idx = -1;
	private String name_ko = "";
	private String name_en = "";
	private String tel_no = "";
	private String phone_no = "";
	private String email = "";
	private String fax_no = "";
	private String etc = "";
	private String reg_id = "";
	private String organizer_name = "";
	private String reg_date = "";
	private String expire_date = "";
	private String expire_id = "";
	private String staff = "";
	private String address = "";
	private String unit = "";
	private int[] idx_Arr;
	
	
	private String position = "";
	private String zip_code = "";
	private String address_ko = "";
	private String address_en = "";
	private String manager_id = "";
	private String manager_nm = "";
	private String newsletter = "";
	private String country = "";
	private String sosoc_excel = "";
	private String department = "";
	
	
	private int organizer_cnt_plus = 0;
	public List<String>  customer_idx_plus = null;
	public List<String>  organizer_idx_plus = null;
	public List<String>  unit_plus = null;
	public List<String>  staff_plus = null;
	public List<String>  add_tel_no_plus = null;
	public List<String>  operation_plus = null;

	//리멤버 등록 변수
	private String page_url = "";
	private int page = 0;
	private int per = 0;
	private int total_count = 0;
	private int total_page = 0;

	private String modify_id = "";
	private String modify_date = "";

	private String remember_id = "";
	private String remember_created_at = "";
	private String remember_main_card_id = "";
	private String remember_main_card_created_at = "";
	private String remember_main_card_user_id = "";
	private String remember_main_card_user_email = "";
	private String remember_modify_date = "";
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		
		this.idx = idx;
	}
	public String getName_ko() {
		return name_ko;
	}
	public void setName_ko(String name_ko) {
		try
		{
			this.name_ko = com.mice.common.encrypt.AESGenerator.encrypt(name_ko);
		}catch(Exception ex){
			this.name_ko = name_ko;
		}
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		try
		{
			this.name_en = com.mice.common.encrypt.AESGenerator.encrypt(name_en);
		}catch(Exception ex){
			this.name_en = name_en;
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
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		try
		{
			this.phone_no = com.mice.common.encrypt.AESGenerator.encrypt(phone_no);
		}catch(Exception ex){
			this.phone_no = phone_no;
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
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getOrganizer_name() {
		return organizer_name;
	}
	public void setOrganizer_name(String organizer_name) {
		this.organizer_name = organizer_name;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	public String getExpire_id() {
		return expire_id;
	}
	public void setExpire_id(String expire_id) {
		this.expire_id = expire_id;
	}
	
	public String getStaff() {
		return staff;
	}
	
	public void setStaff(String staff) {
		this.staff = staff;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getUnit() {
		return unit;
	}
	
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	public int[] getIdx_Arr() {
		return idx_Arr;
	}

	public void setIdx_Arr(int[] idx_Arr) {
		this.idx_Arr = idx_Arr;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}	
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
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
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	
	public String getManager_nm() {
		return manager_nm;
	}
	public void setManager_nm(String manager_nm) {
		this.manager_nm = manager_nm;
	}
		
	public String getNewsletter() {
		return newsletter;
	}
	public void setNewsletter(String newsletter) {
		this.newsletter = newsletter;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}	
	
	public String getSosoc_excel() {
		return sosoc_excel;
	}
	public void setSosoc_excel(String sosoc_excel) {
		this.sosoc_excel = sosoc_excel;
	}	
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}			
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int getOrganizer_cnt_plus() {
		return organizer_cnt_plus;
	}
	public void setOrganizer_cnt_plus(int organizer_cnt_plus) {
		this.organizer_cnt_plus = organizer_cnt_plus;
	}	
	public List<String> getCustomer_idx_plus() {
		return customer_idx_plus;
	}
	public void setCustomer_idx_plus(List<String> customer_idx_plus) {
		this.customer_idx_plus = customer_idx_plus;
	}
	public List<String> getOrganizer_idx_plus() {
		return organizer_idx_plus;
	}
	public void setOrganizer_idx_plus(List<String> organizer_idx_plus) {
		this.organizer_idx_plus = organizer_idx_plus;
	}
	public List<String> getUnit_plus(){
		return unit_plus;
	}
	public void setUnit_plus(List<String> unit_plus){
		this.unit_plus = unit_plus;
	}
	public List<String> getStaff_plus(){
		return staff_plus;
	}
	public void setStaff_plus(List<String> staff_plus){
		this.staff_plus = staff_plus;
	}
	public List<String> getAdd_tel_no_plus(){
		return add_tel_no_plus;
	}
	public void setAdd_tel_no_plus(List<String> add_tel_no_plus){
		this.add_tel_no_plus = add_tel_no_plus;
	}
	public List<String> getOperation_plus() {
		return operation_plus;
	}
	public void setOperation_plus(List<String> operation_plus){
		this.operation_plus = operation_plus;
	}
	
	
	
	
	
	
	
	public String getPage_url() {
		return page_url;
	}
	public void setPage_url(String page_url) {
		this.page_url = page_url;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPer() {
		return per;
	}
	public void setPer(int per) {
		this.per = per;
	}
	
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getTotal_page() {
		return total_page;
	}
	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}

	
	

	public String getModify_id() {
		return modify_id;
	}
	public void setRodify_id(String modify_id) {
		this.modify_id = modify_id;
	}		

	public String getModify_date() {
		return modify_date;
	}
	public void setRodify_date(String modify_date) {
		this.modify_date = modify_date;
	}		

	

	public String getRemember_id() {
		return remember_id;
	}
	public void setRemember_id(String remember_id) {
		this.remember_id = remember_id;
	}	

	public String getRemember_created_at() {
		return remember_created_at;
	}
	public void setRemember_created_at(String remember_created_at) {
		this.remember_created_at = remember_created_at;
	}	
	
	
	public String getRemember_main_card_id() {
		return remember_main_card_id;
	}
	public void setRemember_main_card_id(String remember_main_card_id) {
		this.remember_main_card_id = remember_main_card_id;
	}	
	
	public String getRemember_main_card_create_at() {
		return remember_main_card_created_at;
	}
	public void setRemember_main_card_created_at(String remember_main_card_created_at) {
		this.remember_main_card_created_at = remember_main_card_created_at;
	}	
	
	
	public String getRemember_main_card_user_id() {
		return remember_main_card_user_id;
	}
	public void setRemember_main_card_user_id(String remember_main_card_user_id) {
		this.remember_main_card_user_id = remember_main_card_user_id;
	}	
	
	public String getRemember_main_card_user_email() {
		return remember_main_card_user_email;
	}
	public void setRemember_main_card_user_email(String remember_main_card_user_email) {
		this.remember_main_card_user_email = remember_main_card_user_email;
	}	
		
	
	public String getRemember_modify_date() {
		return remember_modify_date;
	}
	public void setRemember_modify_date(String remember_modify_date) {
		this.remember_modify_date = remember_modify_date;
	}
	
	
}
