package com.mice.crm.service;

/**
 *  
 * 	@이름 : OrderVO
 * 	@최초생성일 : 20171017
 * 	@최초작성자 : 푸른들 김윤용
 * 	@설명 : 이벤트 오더 관리 Value Object
 * 
**/

public class OrderVO {
	private int idx;										// 이벤트 오더 관리 일련번호(PK) 
	private int crm_event_idx;					// 대관 신청 관리 인덱스(FK)
	private String name_ko;						// 행사명(국문)
	private String name_en;						// 행사명(영문)
	private String rent_st_date;					// 대관기간(시작)
	private String rent_ed_date;					// 대관기간(종료)
	private String event_st_date;				// 행사기간(시작)
	private String event_ed_date;				// 행사기간(종료)
		
	private String organizers_1;					// 주최기관 일련번호
	private String organizers_1_name;		// 주최기관 명
	private String manager_1;					// 주최기관 담당자 인덱스
	private String manager_1_name;			// 주최기관 담당자 이름
	private String manager_1_tel;				// 주최기관 담당자 전화번호
	private String manager_1_staff;			// 주최기관 담당자 직급
	private String organizers_2;					// 주관기관 일련번호
	private String organizers_2_name;		// 주관기관 명

	private String manager_2;					// 주관기관 담당자 인덱스
	private String manager_2_name;			// 주관기관 담당자 이름
	private String manager_2_phone_no;		// 주관기관 연락처
	private String manager_2_tel;				// 주관기관 담당자 전화번호
	private String manager_2_staff;			// 주관기관 담당자 직급
	
	private String organizers_3_name;		// AV장비 업체명
	private String manager_3_name;			// AV장비 담당자 이름	
	private String manager_3_tel;				// AV장비 담당자 전화번호
	private String manager_3_staff;			// AV장비 담당자 직급
	
	private String manager_4_name;			// 홀매니저 담당자 이름
	private String manager_4_tel;				// 홀매니저 담당자 전화번호
	private String manager_4_staff;			// 홀매니저 담당자 직급
	
	private String event_staff_id;				// 행사 담당자 아이디
	private String user_nm;						// 행사 담당자 이름
	private String position;						// 행사 담당자 이름
	private String user_tel;					// 행사 담당자 전화번호
	private String user_staff;					// 행사 담당자 직급 	
	
	private String join_personal_cnt;				// 전체 참가자 수
	private String rent_facility_text;			// 대관 인덱스들 (ex : 15, 20, 30 ...n)	
	
	private String event_comment; 			// 행사장 참고사항
	private String equipment_rent_comment;		// AV 및 장비임대 확인사항
	private String etc_comment;				// 기타 특이사항
	private String reg_date;						// 등록일 & 수정일
	
	private String write_condition_tf;
	private String out_gate1_tf;
	private String out_under_access_tf  = "0";	
	private String out_gate2_tf  = "0";
	private String out_gate3_tf  = "0";	
	private String out_gate4_tf  = "0";
	private String out_big_left_tf  = "0";	
	private String out_big_right_tf  = "0";
	private String out_center_crossing_tf  = "0";	
	private String out_light_banner_tf  = "0";	
	private String out_none_tf  = "0";	
	private String out_etc_tf  = "0";	
	private String out_etc_text;
	private String in_ju_tf  = "0";
	private String in_center_road_tf  = "0";	
	private String in_3_1_tf  = "0";	
	private String in_3_2_tf  = "0";	
	private String in_3_3_tf  = "0";	
	private String in_3_4_tf  = "0";	
	private String in_3_5_tf  = "0";	
	private String in_etc_tf  = "0";	
	private String in_etc_text;	
	private String el_fir_multi_tf  = "0";	
	private String el_fir_guid_tf  = "0";	
	private String el_fir_office_tf  = "0";	
	private String el_hall_1_a_tf  = "0";	
	private String el_hall_1_b_tf  = "0";	
	private String el_hall_2_tf  = "0";	
	private String el_sec_office_tf  = "0";	
	private String el_300a_tf  = "0";	
	private String el_300b_tf  = "0";	
	private String el_300c_tf  = "0";	
	private String el_thi_multi_tf  = "0";	
	private String el_etc_tf  = "0";	
	private String el_etc_text;	
	private String ev_etc_text;
	private String ca_hyun_tf  = "0";	
	private String ca_ro_tf  = "0";	
	private String ca_gle_tf  = "0";	
	private String ca_etc_tf  = "0";	
	private String ca_etc_text;
	
	private String kaosk_tf = "0";
	private String organizers_5_name;
	private String manager_5_name;
	private String manager_5_tel;
	private String manager_5_staff;
	
	private String view_chk;
	private String order_no = ""; /* 이벤트 번호 */
	
	
	
	@Override
	public String toString() {
		return "OrderVO [idx=" + idx + ", crm_event_idx=" + crm_event_idx+ ", order_no=" + order_no + ", name_ko=" + name_ko + ", name_en="
				+ name_en + ", rent_st_date=" + rent_st_date + ", rent_ed_date=" + rent_ed_date + ", event_st_date="
				+ event_st_date + ", event_ed_date=" + event_ed_date + ", organizers_1=" + organizers_1
				+ ", organizers_1_name=" + organizers_1_name + ", manager_1=" + manager_1 + ", manager_1_name="
				+ manager_1_name + ", manager_1_tel=" + manager_1_tel + ", manager_1_staff=" + manager_1_staff
				+ ", organizers_2=" + organizers_2 + ", organizers_2_name=" + organizers_2_name + ", manager_2="
				+ manager_2 + ", manager_2_name=" + manager_2_name + ", manager_2_tel=" + manager_2_tel
				+ ", manager_2_staff=" + manager_2_staff + ", organizers_3_name=" + organizers_3_name
				+ ", manager_3_name=" + manager_3_name + ", manager_3_tel=" + manager_3_tel + ", manager_3_staff="
				+ manager_3_staff + ", manager_4_name=" + manager_4_name + ", manager_4_tel=" + manager_4_tel
				+ ", manager_4_staff=" + manager_4_staff + ", event_staff_id=" + event_staff_id + ", user_nm=" + user_nm+ ", position=" + position
				+ ", user_tel=" + user_tel + ", user_staff=" + user_staff + ", join_personal_cnt=" + join_personal_cnt
				+ ", rent_facility_text=" + rent_facility_text + ", event_comment=" + event_comment
				+ ", equipment_rent_comment=" + equipment_rent_comment + ", etc_comment=" + etc_comment + ", reg_date="
				+ reg_date + ", write_condition_tf=" + write_condition_tf + ", out_gate1_tf=" + out_gate1_tf
				+ ", out_under_access_tf=" + out_under_access_tf + ", out_gate2_tf=" + out_gate2_tf + ", out_gate3_tf="
				+ out_gate3_tf + ", out_gate4_tf=" + out_gate4_tf + ", out_big_left_tf=" + out_big_left_tf
				+ ", out_big_right_tf=" + out_big_right_tf + ", out_center_crossing_tf=" + out_center_crossing_tf
				+ ", out_light_banner_tf=" + out_light_banner_tf + ", out_none_tf=" + out_none_tf + ", out_etc_tf="
				+ out_etc_tf + ", out_etc_text=" + out_etc_text + ", in_ju_tf=" + in_ju_tf + ", in_center_road_tf="
				+ in_center_road_tf + ", in_3_1_tf=" + in_3_1_tf + ", in_3_2_tf=" + in_3_2_tf + ", in_3_3_tf="
				+ in_3_3_tf + ", in_3_4_tf=" + in_3_4_tf + ", in_3_5_tf=" + in_3_5_tf + ", in_etc_tf=" + in_etc_tf
				+ ", in_etc_text=" + in_etc_text + ", el_fir_multi_tf=" + el_fir_multi_tf + ", el_fir_guid_tf="
				+ el_fir_guid_tf + ", el_fir_office_tf=" + el_fir_office_tf + ", el_hall_1_a_tf=" + el_hall_1_a_tf
				+ ", el_hall_1_b_tf=" + el_hall_1_b_tf + ", el_hall_2_tf=" + el_hall_2_tf + ", el_sec_office_tf="
				+ el_sec_office_tf + ", el_300a_tf=" + el_300a_tf + ", el_300b_tf=" + el_300b_tf + ", el_300c_tf="
				+ el_300c_tf + ", el_thi_multi_tf=" + el_thi_multi_tf + ", el_etc_tf=" + el_etc_tf + ", el_etc_text="
				+ el_etc_text + ", ev_etc_text=" + ev_etc_text + ", ca_hyun_tf=" + ca_hyun_tf + ", ca_ro_tf=" + ca_ro_tf
				+ ", ca_gle_tf=" + ca_gle_tf + ", ca_etc_tf=" + ca_etc_tf + ", ca_etc_text=" + ca_etc_text
				+ ", kaosk_tf=" + kaosk_tf + ", organizers_5_name=" + organizers_5_name + ", manager_5_name="
				+ manager_5_name + ", manager_5_tel=" + manager_5_tel + ", manager_5_staff=" + manager_5_staff + ", view_chk=" + view_chk+ "]";
	}

	public String getOut_etc_text() {
		return out_etc_text;
	}

	public void setOut_etc_text(String out_etc_text) {
		this.out_etc_text = out_etc_text;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCrm_event_idx() {
		return crm_event_idx;
	}

	public void setCrm_event_idx(int crm_event_idx) {
		this.crm_event_idx = crm_event_idx;
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

	public String getOrganizers_1() {
		return organizers_1;
	}

	public void setOrganizers_1(String organizers_1) {
		this.organizers_1 = organizers_1;
	}

	public String getOrganizers_1_name() {
		return organizers_1_name;
	}

	public void setOrganizers_1_name(String organizers_1_name) {
		this.organizers_1_name = organizers_1_name;
	}

	public String getManager_1() {
		return manager_1;
	}

	public void setManager_1(String manager_1) {
		this.manager_1 = manager_1;
	}

	public String getManager_1_name() {
		return manager_1_name;
	}

	public void setManager_1_name(String manager_1_name) {
		this.manager_1_name = manager_1_name;
	}

	public String getManager_1_tel() {
		return manager_1_tel;
	}

	public void setManager_1_tel(String manager_1_tel) {
		this.manager_1_tel = manager_1_tel;
	}

	public String getManager_1_staff() {
		return manager_1_staff;
	}

	public void setManager_1_staff(String manager_1_staff) {
		this.manager_1_staff = manager_1_staff;
	}

	public String getOrganizers_2() {
		return organizers_2;
	}

	public void setOrganizers_2(String organizers_2) {
		this.organizers_2 = organizers_2;
	}

	public String getOrganizers_2_name() {
		return organizers_2_name;
	}

	public void setOrganizers_2_name(String organizers_2_name) {
		this.organizers_2_name = organizers_2_name;
	}

	public String getManager_2() {
		return manager_2;
	}

	public void setManager_2(String manager_2) {
		this.manager_2 = manager_2;
	}

	public String getManager_2_name() {
		return manager_2_name;
	}

	public void setManager_2_name(String manager_2_name) {
		this.manager_2_name = manager_2_name;
	}

	public String getManager_2_phone_no() {
		return manager_2_phone_no;
	}

	public void setManager_2_phone_no(String manager_2_phone_no) {
		this.manager_2_phone_no = manager_2_phone_no;
	}
	
	
	
	
	public String getManager_2_tel() {
		return manager_2_tel;
	}

	public void setManager_2_tel(String manager_2_tel) {
		this.manager_2_tel = manager_2_tel;
	}

	public String getManager_2_staff() {
		return manager_2_staff;
	}

	public void setManager_2_staff(String manager_2_staff) {
		this.manager_2_staff = manager_2_staff;
	}

	public String getManager_3_name() {
		return manager_3_name;
	}

	public void setManager_3_name(String manager_3_name) {
		this.manager_3_name = manager_3_name;
	}

	public String getManager_3_tel() {
		return manager_3_tel;
	}

	public void setManager_3_tel(String manager_3_tel) {
		this.manager_3_tel = manager_3_tel;
	}

	public String getManager_3_staff() {
		return manager_3_staff;
	}

	public void setManager_3_staff(String manager_3_staff) {
		this.manager_3_staff = manager_3_staff;
	}

	public String getManager_4_name() {
		return manager_4_name;
	}

	public void setManager_4_name(String manager_4_name) {
		this.manager_4_name = manager_4_name;
	}

	public String getManager_4_tel() {
		return manager_4_tel;
	}

	public void setManager_4_tel(String manager_4_tel) {
		this.manager_4_tel = manager_4_tel;
	}

	public String getManager_4_staff() {
		return manager_4_staff;
	}

	public void setManager_4_staff(String manager_4_staff) {
		this.manager_4_staff = manager_4_staff;
	}

	public String getEvent_staff_id() {
		return event_staff_id;
	}

	public void setEvent_staff_id(String event_staff_id) {
		this.event_staff_id = event_staff_id;
	}

	public String getUser_nm() {
		return user_nm;
	}

	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}


	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	
	
	
	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getJoin_personal_cnt() {
		return join_personal_cnt;
	}

	public void setJoin_personal_cnt(String join_personal_cnt) {
		this.join_personal_cnt = join_personal_cnt;
	}

	public String getRent_facility_text() {
		return rent_facility_text;
	}

	public void setRent_facility_text(String rent_facility_text) {
		this.rent_facility_text = rent_facility_text;
	}

	public String getEvent_comment() {
		return event_comment;
	}

	public void setEvent_comment(String event_comment) {
		this.event_comment = event_comment;
	}

	public String getEquipment_rent_comment() {
		return equipment_rent_comment;
	}

	public void setEquipment_rent_comment(String equipment_rent_comment) {
		this.equipment_rent_comment = equipment_rent_comment;
	}

	public String getEtc_comment() {
		return etc_comment;
	}

	public void setEtc_comment(String etc_comment) {
		this.etc_comment = etc_comment;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getWrite_condition_tf() {
		return write_condition_tf;
	}

	public void setWrite_condition_tf(String write_condition_tf) {
		this.write_condition_tf = write_condition_tf;
	}

	public String getOut_gate1_tf() {
		return out_gate1_tf;
	}

	public void setOut_gate1_tf(String out_gate1_tf) {
		this.out_gate1_tf = out_gate1_tf;
	}

	public String getOut_under_access_tf() {
		return out_under_access_tf;
	}

	public void setOut_under_access_tf(String out_under_access_tf) {
		this.out_under_access_tf = out_under_access_tf;
	}

	public String getOut_gate2_tf() {
		return out_gate2_tf;
	}

	public void setOut_gate2_tf(String out_gate2_tf) {
		this.out_gate2_tf = out_gate2_tf;
	}

	public String getOut_gate3_tf() {
		return out_gate3_tf;
	}

	public void setOut_gate3_tf(String out_gate3_tf) {
		this.out_gate3_tf = out_gate3_tf;
	}

	public String getOut_gate4_tf() {
		return out_gate4_tf;
	}

	public void setOut_gate4_tf(String out_gate4_tf) {
		this.out_gate4_tf = out_gate4_tf;
	}

	public String getOut_big_left_tf() {
		return out_big_left_tf;
	}

	public void setOut_big_left_tf(String out_big_left_tf) {
		this.out_big_left_tf = out_big_left_tf;
	}

	public String getOut_big_right_tf() {
		return out_big_right_tf;
	}

	public void setOut_big_right_tf(String out_big_right_tf) {
		this.out_big_right_tf = out_big_right_tf;
	}

	public String getOut_center_crossing_tf() {
		return out_center_crossing_tf;
	}

	public void setOut_center_crossing_tf(String out_center_crossing_tf) {
		this.out_center_crossing_tf = out_center_crossing_tf;
	}

	public String getOut_light_banner_tf() {
		return out_light_banner_tf;
	}

	public void setOut_light_banner_tf(String out_light_banner_tf) {
		this.out_light_banner_tf = out_light_banner_tf;
	}

	public String getOut_none_tf() {
		return out_none_tf;
	}

	public void setOut_none_tf(String out_none_tf) {
		this.out_none_tf = out_none_tf;
	}

	public String getOut_etc_tf() {
		return out_etc_tf;
	}

	public void setOut_etc_tf(String out_etc_tf) {
		this.out_etc_tf = out_etc_tf;
	}

	public String getIn_ju_tf() {
		return in_ju_tf;
	}

	public void setIn_ju_tf(String in_ju_tf) {
		this.in_ju_tf = in_ju_tf;
	}

	public String getIn_center_road_tf() {
		return in_center_road_tf;
	}

	public void setIn_center_road_tf(String in_center_road_tf) {
		this.in_center_road_tf = in_center_road_tf;
	}

	public String getIn_3_1_tf() {
		return in_3_1_tf;
	}

	public void setIn_3_1_tf(String in_3_1_tf) {
		this.in_3_1_tf = in_3_1_tf;
	}

	public String getIn_3_2_tf() {
		return in_3_2_tf;
	}

	public void setIn_3_2_tf(String in_3_2_tf) {
		this.in_3_2_tf = in_3_2_tf;
	}

	public String getIn_3_3_tf() {
		return in_3_3_tf;
	}

	public void setIn_3_3_tf(String in_3_3_tf) {
		this.in_3_3_tf = in_3_3_tf;
	}

	public String getIn_3_4_tf() {
		return in_3_4_tf;
	}

	public void setIn_3_4_tf(String in_3_4_tf) {
		this.in_3_4_tf = in_3_4_tf;
	}

	public String getIn_3_5_tf() {
		return in_3_5_tf;
	}

	public void setIn_3_5_tf(String in_3_5_tf) {
		this.in_3_5_tf = in_3_5_tf;
	}

	public String getIn_etc_tf() {
		return in_etc_tf;
	}

	public void setIn_etc_tf(String in_etc_tf) {
		this.in_etc_tf = in_etc_tf;
	}

	public String getIn_etc_text() {
		return in_etc_text;
	}

	public void setIn_etc_text(String in_etc_text) {
		this.in_etc_text = in_etc_text;
	}

	public String getEl_fir_multi_tf() {
		return el_fir_multi_tf;
	}

	public void setEl_fir_multi_tf(String el_fir_multi_tf) {
		this.el_fir_multi_tf = el_fir_multi_tf;
	}

	public String getEl_fir_guid_tf() {
		return el_fir_guid_tf;
	}

	public void setEl_fir_guid_tf(String el_fir_guid_tf) {
		this.el_fir_guid_tf = el_fir_guid_tf;
	}

	public String getEl_fir_office_tf() {
		return el_fir_office_tf;
	}

	public void setEl_fir_office_tf(String el_fir_office_tf) {
		this.el_fir_office_tf = el_fir_office_tf;
	}

	public String getEl_hall_1_a_tf() {
		return el_hall_1_a_tf;
	}

	public void setEl_hall_1_a_tf(String el_hall_1_a_tf) {
		this.el_hall_1_a_tf = el_hall_1_a_tf;
	}

	public String getEl_hall_1_b_tf() {
		return el_hall_1_b_tf;
	}

	public void setEl_hall_1_b_tf(String el_hall_1_b_tf) {
		this.el_hall_1_b_tf = el_hall_1_b_tf;
	}

	public String getEl_hall_2_tf() {
		return el_hall_2_tf;
	}

	public void setEl_hall_2_tf(String el_hall_2_tf) {
		this.el_hall_2_tf = el_hall_2_tf;
	}

	public String getEl_sec_office_tf() {
		return el_sec_office_tf;
	}

	public void setEl_sec_office_tf(String el_sec_office_tf) {
		this.el_sec_office_tf = el_sec_office_tf;
	}

	public String getEl_300a_tf() {
		return el_300a_tf;
	}

	public void setEl_300a_tf(String el_300a_tf) {
		this.el_300a_tf = el_300a_tf;
	}

	public String getEl_300b_tf() {
		return el_300b_tf;
	}

	public void setEl_300b_tf(String el_300b_tf) {
		this.el_300b_tf = el_300b_tf;
	}

	public String getEl_300c_tf() {
		return el_300c_tf;
	}

	public void setEl_300c_tf(String el_300c_tf) {
		this.el_300c_tf = el_300c_tf;
	}

	public String getEl_thi_multi_tf() {
		return el_thi_multi_tf;
	}

	public void setEl_thi_multi_tf(String el_thi_multi_tf) {
		this.el_thi_multi_tf = el_thi_multi_tf;
	}

	public String getEl_etc_tf() {
		return el_etc_tf;
	}

	public void setEl_etc_tf(String el_etc_tf) {
		this.el_etc_tf = el_etc_tf;
	}

	public String getEl_etc_text() {
		return el_etc_text;
	}

	public void setEl_etc_text(String el_etc_text) {
		this.el_etc_text = el_etc_text;
	}

	public String getEv_etc_text() {
		return ev_etc_text;
	}

	public void setEv_etc_text(String ev_etc_text) {
		this.ev_etc_text = ev_etc_text;
	}

	public String getCa_hyun_tf() {
		return ca_hyun_tf;
	}

	public void setCa_hyun_tf(String ca_hyun_tf) {
		this.ca_hyun_tf = ca_hyun_tf;
	}

	public String getCa_ro_tf() {
		return ca_ro_tf;
	}

	public void setCa_ro_tf(String ca_ro_tf) {
		this.ca_ro_tf = ca_ro_tf;
	}

	public String getCa_gle_tf() {
		return ca_gle_tf;
	}

	public void setCa_gle_tf(String ca_gle_tf) {
		this.ca_gle_tf = ca_gle_tf;
	}

	public String getCa_etc_tf() {
		return ca_etc_tf;
	}

	public void setCa_etc_tf(String ca_etc_tf) {
		this.ca_etc_tf = ca_etc_tf;
	}

	public String getCa_etc_text() {
		return ca_etc_text;
	}

	public void setCa_etc_text(String ca_etc_text) {
		this.ca_etc_text = ca_etc_text;
	}

	public String getOrganizers_3_name() {
		return organizers_3_name;
	}

	public void setOrganizers_3_name(String organizers_3_name) {
		this.organizers_3_name = organizers_3_name;
	}

	public String getUser_staff() {
		return user_staff;
	}

	public void setUser_staff(String user_staff) {
		this.user_staff = user_staff;
	}

	public String getKaosk_tf() {
		return kaosk_tf;
	}

	public void setKaosk_tf(String kaosk_tf) {
		this.kaosk_tf = kaosk_tf;
	}

	public String getOrganizers_5_name() {
		return organizers_5_name;
	}

	public void setOrganizers_5_name(String organizers_5_name) {
		this.organizers_5_name = organizers_5_name;
	}

	public String getManager_5_name() {
		return manager_5_name;
	}

	public void setManager_5_name(String manager_5_name) {
		this.manager_5_name = manager_5_name;
	}

	public String getManager_5_tel() {
		return manager_5_tel;
	}

	public void setManager_5_tel(String manager_5_tel) {
		this.manager_5_tel = manager_5_tel;
	}

	public String getManager_5_staff() {
		return manager_5_staff;
	}

	public void setManager_5_staff(String manager_5_staff) {
		this.manager_5_staff = manager_5_staff;
	}


	
	
	public String getView_chk() {
		return view_chk;
	}

	public void setView_chk(String view_chk) {
		this.view_chk = view_chk;
	}
	
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}		




	
	
	
}
