package com.mice.crm.service;

import java.util.List;

public class Event {
	private int idx = -1;
	private String implementation_status = "";
	private String confirm_date = "";
	private String name_ko = "";
	private String name_en = "";
	private String name_etc = "";
	private String place_idx = "";
	private String rent_facility_text = "";
	private String rent_st_date = "";
	private String rent_ed_date = "";
	private String event_st_date = "";
	private String event_ed_date = "";
	private long event_division_idx = -1;
	private long event_type_idx = -1;
	private long event_scale_idx = -1;
	private long join_personal_cnt = 0;
	private long join_foreigner_cnt = 0;
	private long join_nationals_cnt = 0;
	private long booth_cnt = 0;
	private long exhibition_scale = 0;
	private long participating_states_cnt = 0;
	private String organizers_1 = "";
	private String organizers_2 = "";
	private String organizers_3 = "";
	private String manager_1 = "";
	private String manager_2 = "";
	private String homepage = "";
	private String view_yn = "";
	private String estimate_date = "";
	private long estimate_cost = 0;
	private long sales_cost = 0;
	private long total_cost = 0;
	private long rent_cost = 0;
	private long food_cost = 0;
	private long av_rental_cost = 0;
	private long manager_cost = 0;
	private long total_grant_cost = 0;
	private long attract_grant_cost = 0;
	private long sales_grant_cost = 0;
	private long held_grant_cost = 0;
	private String attract_staff_id = "";
	private String event_staff_id = "";
	private String etc_comment = "";
	private String partners_comment = "";
	private String reg_id = "";
	private String reg_date = "";
	private String expire_id = "";
	private String expire_date = "";
	private String day = "";
	private List<String> event_theme = null; /* 행사주제*/
	private String event_theme_name = ""; /* 행사주제 내용 */
	private String event_theme_idx = ""; /* 행사주제 내용 */
	
	private List<String> plus_org = null; /*  추가기관 */
	private List<String> plus_org_member = null; /* 추가기관 담당자*/
	
	private int crm_event_idx = 0;
	private int customer_idx = 0;
	private int organizer_idx = 0;
	
	

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

	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getImplementation_status() {
		return implementation_status;
	}
	public void setImplementation_status(String implementation_status) {
		this.implementation_status = implementation_status;
	}
	public String getConfirm_date() {
		return confirm_date;
	}
	public void setConfirm_date(String confirm_date) {
		this.confirm_date = confirm_date;
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
	public String getPlace_idx() {
		return place_idx;
	}
	public void setPlace_idx(String place_idx) {
		this.place_idx = place_idx;
	}
	public String getRent_facility_text() {
		return rent_facility_text;
	}
	public void setRent_facility_text(String rent_facility_text) {
		this.rent_facility_text = rent_facility_text;
	}
	public String getRent_st_date() {
		return rent_st_date;
	}
	public void setRent_st_date(String rent_st_date) {
		this.rent_st_date = rent_st_date;
	}
	public String getRent_ed_date() {
		return rent_ed_date;
	}
	public void setRent_ed_date(String rent_ed_date) {
		this.rent_ed_date = rent_ed_date;
	}
	public String getEvent_st_date() {
		return event_st_date;
	}
	public void setEvent_st_date(String event_st_date) {
		this.event_st_date = event_st_date;
	}
	public String getEvent_ed_date() {
		return event_ed_date;
	}
	public void setEvent_ed_date(String event_ed_date) {
		this.event_ed_date = event_ed_date;
	}
	public long getEvent_division_idx() {
		return event_division_idx;
	}
	public void setEvent_division_idx(long event_division_idx) {
		this.event_division_idx = event_division_idx;
	}
	public long getEvent_type_idx() {
		return event_type_idx;
	}
	public void setEvent_type_idx(long event_type_idx) {
		this.event_type_idx = event_type_idx;
	}
	public long getEvent_scale_idx() {
		return event_scale_idx;
	}
	public void setEvent_scale_idx(long event_scale_idx) {
		this.event_scale_idx = event_scale_idx;
	}
	public long getJoin_personal_cnt() {
		return join_personal_cnt;
	}
	public void setJoin_personal_cnt(long join_personal_cnt) {
		this.join_personal_cnt = join_personal_cnt;
	}
	public long getJoin_foreigner_cnt() {
		return join_foreigner_cnt;
	}
	public void setJoin_foreigner_cnt(long join_foreigner_cnt) {
		this.join_foreigner_cnt = join_foreigner_cnt;
	}
	public long getJoin_nationals_cnt() {
		return join_nationals_cnt;
	}
	public void setJoin_nationals_cnt(long join_nationals_cnt) {
		this.join_nationals_cnt = join_nationals_cnt;
	}
	public long getBooth_cnt() {
		return booth_cnt;
	}
	public void setBooth_cnt(long booth_cnt) {
		this.booth_cnt = booth_cnt;
	}
	public long getExhibition_scale() {
		return exhibition_scale;
	}
	public void setExhibition_scale(long exhibition_scale) {
		this.exhibition_scale = exhibition_scale;
	}
	public long getParticipating_states_cnt() {
		return participating_states_cnt;
	}
	public void setParticipating_states_cnt(long participating_states_cnt) {
		this.participating_states_cnt = participating_states_cnt;
	}
	public String getOrganizers_1() {
		return organizers_1;
	}
	public void setOrganizers_1(String organizers_1) {
		this.organizers_1 = organizers_1;
	}
	public String getOrganizers_2() {
		return organizers_2;
	}
	public void setOrganizers_2(String organizers_2) {
		this.organizers_2 = organizers_2;
	}
	public String getOrganizers_3() {
		return organizers_3;
	}
	public void setOrganizers_3(String organizers_3) {
		this.organizers_3 = organizers_3;
	}
	public String getManager_1() {
		return manager_1;
	}
	public void setManager_1(String manager_1) {
		this.manager_1 = manager_1;
	}
	public String getManager_2() {
		return manager_2;
	}
	public void setManager_2(String manager_2) {
		this.manager_2 = manager_2;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getView_yn() {
		return view_yn;
	}
	public void setView_yn(String view_yn) {
		this.view_yn = view_yn;
	}
	public String getEstimate_date() {
		return estimate_date;
	}
	public void setEstimate_date(String estimate_date) {
		this.estimate_date = estimate_date;
	}
	
	
	
	public long getEstimate_cost() {
		return estimate_cost;
	}
	public void setEstimate_cost(long estimate_cost) {
		this.estimate_cost = estimate_cost;
	}
	
	
	public long getSales_cost() {
		return sales_cost;
	}
	public void setSales_cost(long sales_cost) {
		this.sales_cost = sales_cost;
	}
	
	
	public long getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(long total_cost) {
		this.total_cost = total_cost;
	}
	
	
	public long getRent_cost() {
		return rent_cost;
	}
	public void setRent_cost(long rent_cost) {
		this.rent_cost = rent_cost;
	}
	
	
	
	
	
	
	
	public long getFood_cost() {
		return food_cost;
	}
	public void setFood_cost(long food_cost) {
		this.food_cost = food_cost;
	}
	public long getAv_rental_cost() {
		return av_rental_cost;
	}
	public void setAv_rental_cost(long av_rental_cost) {
		this.av_rental_cost = av_rental_cost;
	}
	public long getManager_cost() {
		return manager_cost;
	}
	public void setManager_cost(long manager_cost) {
		this.manager_cost = manager_cost;
	}
	public long getTotal_grant_cost() {
		return total_grant_cost;
	}
	public void setTotal_grant_cost(long total_grant_cost) {
		this.total_grant_cost = total_grant_cost;
	}
	public long getAttract_grant_cost() {
		return attract_grant_cost;
	}
	public void setAttract_grant_cost(long attract_grant_cost) {
		this.attract_grant_cost = attract_grant_cost;
	}
	public long getSales_grant_cost() {
		return sales_grant_cost;
	}
	public void setSales_grant_cost(long sales_grant_cost) {
		this.sales_grant_cost = sales_grant_cost;
	}
	public long getHeld_grant_cost() {
		return held_grant_cost;
	}
	public void setHeld_grant_cost(long held_grant_cost) {
		this.held_grant_cost = held_grant_cost;
	}

	public String getAttract_staff_id() {
		return attract_staff_id;
	}
	public void setAttract_staff_id(String attract_staff_id) {
		this.attract_staff_id = attract_staff_id;
	}
	public String getEvent_staff_id() {
		return event_staff_id;
	}
	public void setEvent_staff_id(String event_staff_id) {
		this.event_staff_id = event_staff_id;
	}
	public String getEtc_comment() {
		return etc_comment;
	}
	public void setEtc_comment(String etc_comment) {
		this.etc_comment = etc_comment;
	}
	public String getPartners_comment() {
		return partners_comment;
	}
	public void setPartners_comment(String partners_comment) {
		this.partners_comment = partners_comment;
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
	
	
	public List<String> getEvent_theme() {
		return event_theme;
	}
	public void setEvent_theme(List<String> event_theme) {
		this.event_theme = event_theme;
	}
	
	
	public String getEvent_theme_name() {
		return event_theme_name;
	}
	public void setEvent_theme_name(String event_theme_name) {
		this.event_theme_name = event_theme_name;
	}
	

	public String getEvent_theme_idx() {
		return event_theme_idx;
	}
	public void setEvent_theme_idx(String event_theme_idx) {
		this.event_theme_idx = event_theme_idx;
	}
	
		
	
	public List<String> getPlus_org() {
		return plus_org;
	}
	public void setPlus_org(List<String> plus_org) {
		this.plus_org = plus_org;
	}
	

	public List<String> getPlus_org_member() {
		return plus_org_member;
	}
	public void setPlus_org_member(List<String> plus_org_member) {
		this.plus_org_member = plus_org_member;
	}

	
	
}
