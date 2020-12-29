package com.mice.crm.service;

import java.lang.reflect.Field;
import java.util.List;

public class Organizer {
	private int idx = -1;
	private String name_ko = "";
	private String name_en = "";
	private String name_etc = "";
	private int type_idx = -1;
	private String national = "";
	private String city = "";
	private String zip_code = "";
	private String address_ko = "";
	private String address_en = "";
	private String tel_no = "";
	private String fax = "";
	private String email = "";
	private String homepage = "";
	private String comment = "";
	private String reg_date = "";
	private String reg_id = "";
	private String manager_id = "";
	private String expire_id = "";
	private String expire_date = "";
	
	private String org_kind = "";
	private String manager_event = "";
	private String crm_event_idx = "";
	private String event_cate_biz1 = "";
	private String event_cate_biz2 = "";
	private String event_cate_biz3 = "";
	
	private String ceo_name = "";
	private String ceo_phone = "";
	private String biz_man = "";
	private String biz_man_phone = "";
	private String biz_man_email = "";
	
	private String org_import = "";
	private String org_grade = "";
	private String org_step = "";
	private String org_exhi_history = "";
	private String org_exhi_path = "";
	
	
	  
	
	private List<String> event_cate_serviceList = null;
	private List<String> event_cate_itemList = null;
	
	private String event_cate_serviceList_idx;
	private String event_cate_itemList_idx;
	
	private String event_cate_serviceList_str;
	private String event_cate_itemList_str;


	private List<String> idxList = null;
	private List<String> org_importList = null;
	private List<String> org_gradeList = null;
	private List<String> org_stepList = null;
	private List<String> org_exhi_pathList = null;
	
	
/*	
	private String org_researchList_idx;
	private String org_gradeList_idx;
	private String org_stepList_idx;
	private String org_exhi_pathList_idx;
	
	private String org_researchList_str;
	private String org_gradeList_str;
	private String org_stepList_str;
	private String org_exhi_pathList_str;
*/
	
	
	private String crm_event_idx_str;
	private String org_kind_str;
	private String manager_event_str;
	private String event_cate_biz1_str;
	private String event_cate_biz2_str;
	private String event_cate_biz3_str;
	private String event_cate_service_str;
	private String event_cate_item_str;
	
	// 기관단체,테마
	private int org_idx;
	private String kind;
	private String value;
	
	
	
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
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
		this.name_ko = name_ko;
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	public String getName_etc() {
		return name_etc;
	}
	public void setName_etc(String name_etc) {
		this.name_etc = name_etc;
	}
	
	public int getType_idx() {
		return type_idx;
	}
	public void setType_idx(int type_idx) {
		this.type_idx = type_idx;
	}
	public String getNational() {
		return national;
	}
	public void setNational(String national) {
		this.national = national;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		try
		{
			this.fax = com.mice.common.encrypt.AESGenerator.encrypt(fax);
		}catch(Exception ex){
			this.fax = fax;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
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
	
	
	
	
	
	
	
	
	public String getOrg_kind() {
		return org_kind;
	}
	public void setOrg_kind(String org_kind) {
		this.org_kind = org_kind;
	}
	public String getManager_event() {
		return manager_event;
	}
	public void setManager_event(String manager_event) {
		this.manager_event = manager_event;
	}
	public String getCrm_event_idx_str() {
		return crm_event_idx_str;
	}
	public void setCrm_event_idx_str(String crm_event_idx_str) {
		this.crm_event_idx_str = crm_event_idx_str;
	}	
	public String getEvent_cate_biz1() {
		return event_cate_biz1;
	}
	public void setEvent_cate_biz1(String event_cate_biz1) {
		this.event_cate_biz1 = event_cate_biz1;
	}
	public String getEvent_cate_biz2() {
		return event_cate_biz2;
	}
	public void setEvent_cate_biz2(String event_cate_biz2) {
		this.event_cate_biz2 = event_cate_biz2;
	}
	public String getEvent_cate_biz3() {
		return event_cate_biz3;
	}
	public void setEvent_cate_biz3(String event_cate_biz3) {
		this.event_cate_biz3 = event_cate_biz3;
	}
	

	
	
	
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getCeo_phone() {
		return ceo_phone;
	}
	public void setCeo_phone(String ceo_phone) {
		this.ceo_phone = ceo_phone;
	}
	public String getBiz_man() {
		return biz_man;
	}
	public void setBiz_man(String biz_man) {
		this.biz_man = biz_man;
	}	
	public String getBiz_man_phone() {
		return biz_man_phone;
	}
	public void setBiz_man_phone(String biz_man_phone) {
		this.biz_man_phone = biz_man_phone;
	}	
	public String getBiz_man_email() {
		return biz_man_email;
	}
	public void setBiz_man_email(String biz_man_email) {
		this.biz_man_email = biz_man_email;
	}	

	public String getOrg_import() {
		return org_import;
	}
	public void setOrg_import(String org_import) {
		this.org_import = org_import;
	}
	public String getOrg_grade() {
		return org_grade;
	}
	public void setOrg_grade(String org_grade) {
		this.org_grade = org_grade;
	}
	public String getOrg_step() {
		return org_step;
	}
	public void setOrg_step(String org_step) {
		this.org_step = org_step;
	}
	public String getOrg_exhi_history() {
		return org_exhi_history;
	}
	public void setOrg_exhi_history(String org_exhi_history) {
		this.org_exhi_history = org_exhi_history;
	}		
	public String getOrg_exhi_path() {
		return org_exhi_path;
	}
	public void setOrg_exhi_path(String org_exhi_path) {
		this.org_exhi_path = org_exhi_path;
	}
	
	

	
	
	
	
	
	
	
	
	
	
	public List<String> getEvent_cate_serviceList() {
		return event_cate_serviceList;
	}
	public void setEvent_cate_serviceList(List<String> event_cate_serviceList) {
		this.event_cate_serviceList = event_cate_serviceList;
	}	

	public List<String> getEvent_cate_itemList() {
		return event_cate_itemList;
	}
	public void setEvent_cate_itemList(List<String> event_cate_itemList) {
		this.event_cate_itemList = event_cate_itemList;
	}	

	public String getEvent_cate_serviceList_idx() {
		return event_cate_serviceList_idx;
	}
	public void setEvent_cate_serviceList_idx(String event_cate_serviceList_idx) {
		this.event_cate_serviceList_idx = event_cate_serviceList_idx;
	}
	public String getEvent_cate_itemList_idx() {
		return event_cate_itemList_idx;
	}
	public void setEvent_cate_itemList_idx(String event_cate_itemList_idx) {
		this.event_cate_itemList_idx = event_cate_itemList_idx;
	}
	
	public String getEvent_cate_serviceList_str() {
		return event_cate_serviceList_str;
	}
	public void setEvent_cate_serviceList_str(String event_cate_serviceList_str) {
		this.event_cate_serviceList_str = event_cate_serviceList_str;
	}
	public String getEvent_cate_itemList_str() {
		return event_cate_itemList_str;
	}
	public void setEvent_cate_itemList_str(String event_cate_itemList_str) {
		this.event_cate_itemList_str = event_cate_itemList_str;
	}
	

	
	
	public List<String> getIdxList() {
		return idxList;
	}
	public void setIdxList(List<String> idxList) {
		this.idxList = idxList;
	}		
	public List<String> getOrg_importList() {
		return org_importList;
	}
	public void setOrg_importList(List<String> org_importList) {
		this.org_importList = org_importList;
	}	
	public List<String> getOrg_gradeList() {
		return org_gradeList;
	}
	public void setOrg_gradeList(List<String> org_gradeList) {
		this.org_gradeList = org_gradeList;
	}
	public List<String> getOrg_stepList() {
		return org_stepList;
	}
	public void setOrg_stepList(List<String> org_stepList) {
		this.org_stepList = org_stepList;
	}		
	public List<String> getOrg_exhi_pathList() {
		return org_exhi_pathList;
	}
	public void setOrg_exhi_pathList(List<String> org_exhi_pathList) {
		this.org_exhi_pathList = org_exhi_pathList;
	}
	
	
/*	
	public String getOrg_researchList_idx() {
		return org_researchList_idx;
	}
	public void setOrg_researchList_idx(String org_researchList_idx) {
		this.org_researchList_idx = org_researchList_idx;
	}
	public String getOrg_gradeList_idx() {
		return org_gradeList_idx;
	}
	public void setOrg_gradeList_idx(String org_gradeList_idx) {
		this.org_gradeList_idx = org_gradeList_idx;
	}
	public String getOrg_stepList_idx() {
		return org_stepList_idx;
	}
	public void setOrg_stepList_idx(String org_stepList_idx) {
		this.org_stepList_idx = org_stepList_idx;
	}
	public String getOrg_exhi_pathList_idx() {
		return org_exhi_pathList_idx;
	}
	public void setOrg_exhi_pathList_idx(String org_exhi_pathList_idx) {
		this.org_exhi_pathList_idx = org_exhi_pathList_idx;
	}
	

	
	
	public String getOrg_researchList_str() {
		return org_researchList_str;
	}
	public void setOrg_researchList_str(String org_researchList_str) {
		this.org_researchList_str = org_researchList_str;
	}
	public String getOrg_gradeList_str() {
		return org_gradeList_str;
	}
	public void setOrg_gradeList_str(String org_gradeList_str) {
		this.org_gradeList_str = org_gradeList_str;
	}
	public String getOrg_stepList_str() {
		return org_stepList_str;
	}
	public void setOrg_stepList_str(String org_stepList_str) {
		this.org_stepList_str = org_stepList_str;
	}
	public String getOrg_exhi_pathList_str() {
		return org_exhi_pathList_str;
	}
	public void setOrg_exhi_pathList_str(String org_exhi_pathList_str) {
		this.org_exhi_pathList_str = org_exhi_pathList_str;
	}
*/	
	
	
	
	public String getCrm_event_idx() {
		return crm_event_idx;
	}
	public void setCrm_event_idx(String crm_event_idx) {
		this.crm_event_idx = crm_event_idx;
	}
	public String getOrg_kind_str() {
		return org_kind_str;
	}
	public void Org_kind_str(String org_kind_str) {
		this.org_kind_str = org_kind_str;
	}	
	public String getManager_event_str() {
		return manager_event_str;
	}
	public void setManager_event_str(String manager_event_str) {
		this.manager_event_str = manager_event_str;
	}
	public String getEvent_cate_biz1_str() {
		return event_cate_biz1_str;
	}
	public void setEvent_cate_biz1_str(String event_cate_biz1_str) {
		this.event_cate_biz1_str = event_cate_biz1_str;
	}
	public String getEvent_cate_biz2_str() {
		return event_cate_biz2_str;
	}
	public void setEvent_cate_biz2_str(String event_cate_biz2_str) {
		this.event_cate_biz2_str = event_cate_biz2_str;
	}
	public String getEvent_cate_biz3_str() {
		return event_cate_biz3_str;
	}
	public void setEvent_cate_biz3_str(String event_cate_biz3_str) {
		this.event_cate_biz3_str = event_cate_biz3_str;
	}
	public String getEvent_cate_service_str() {
		return event_cate_service_str;
	}
	public void setEvent_cate_service_str(String event_cate_service_str) {
		this.event_cate_service_str = event_cate_service_str;
	}
	public String getEvent_cate_item_str() {
		return event_cate_item_str;
	}
	public void setEvent_cate_item_str(String event_cate_item_str) {
		this.event_cate_item_str = event_cate_item_str;
	}
	
	
	
	public int getOrg_idx() {
		return org_idx;
	}
	public void setOrg_idx(int org_idx) {
		this.org_idx = org_idx;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

	
}
