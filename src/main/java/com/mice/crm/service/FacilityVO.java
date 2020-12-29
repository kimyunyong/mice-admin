package com.mice.crm.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FacilityVO extends Code{
	private int place_idx;					// 인덱스	(pk)
	private int crm_event_idx;			// 행사장 정보 인덱스 (fk)
	private String place="";		// 장소
	private String p_rent_st_date="";		// 대관 기간 (시작)
	private String p_rent_ed_date="";		// 대관 기간 (종료)
	private String rent_time="";		// 시간
	//private String rent_time_am="";		// 대관 시간 오전
	//private String rent_time_pm="";		// 대관 시간 오후
	//private String rent_time_night="";		// 대관 시간 야간
	private String rent_setting="";			// 렌트 세팅 (극장식, 강의식, 연회식, 기타)
	//private String rent_etc_text="";		// 렌트 세팅 기타 텍스트
	private String personal_cnt="";			// 인원(수용)
	private String etc_text="";				// 비고	
	private String text="";	

	
	/**
	* 다중Row 데이터를 받기 위한  임시 배열
	*/
	private String[] place_idxArr;
	private String[] crm_event_idxArr;
	private String[] placeArr;
	//private String[] typeArr;
	//private String[] valueArr;
	private String[] p_rent_st_dateArr;
	private String[] p_rent_ed_dateArr;
	private String[] rent_timeArr;
	//private String[] rent_time_amArr;
	//private String[] rent_time_pmArr;
	//private String[] rent_time_nightArr;
	private String[] rent_settingArr;
	//private String[] rent_etc_textArr;
	private String[] personal_cntArr;
	private String[] etc_textArr;
	
	private String[] textArr;
	
	private List<FacilityVO> facList = new ArrayList<FacilityVO>();
	

	
	@Override
	public String toString() {
		
		//+ ", rent_time_am=" + rent_time_am + ", rent_time_pm=" + rent_time_pm + ", rent_time_night=" + rent_time_night 
		//+ ", rent_time_amArr=" + Arrays.toString(rent_time_amArr) + ", rent_time_pmArr="
		//+ Arrays.toString(rent_time_pmArr) + ", rent_time_nightArr=" + Arrays.toString(rent_time_nightArr)
		//+ ", valueArr=" + Arrays.toString(valueArr) 
		//+ ", typeArr=" + Arrays.toString(typeArr)

		//+ ", rent_etc_text=" + rent_etc_text 	
		//+ ", rent_etc_textArr="+ Arrays.toString(rent_etc_textArr) 		
		
		return "FacilityVO [place_idx=" + place_idx 
				+ ", crm_event_idx=" + crm_event_idx 
				+ ", place=" + place 
				+ ", p_rent_st_date=" + p_rent_st_date 
				+ ", p_rent_ed_date=" + p_rent_ed_date 
				+ ", rent_time=" + rent_time
				+ ", rent_setting=" + rent_setting 
				+ ", personal_cnt=" + personal_cnt 
				+ ", etc_text="+ etc_text + ", text=" + text 
				+ ", place_idxArr=" + Arrays.toString(place_idxArr)
				+ ", crm_event_idxArr=" + Arrays.toString(crm_event_idxArr)
				+ ", placeArr="+ Arrays.toString(placeArr) 
				+ ", p_rent_st_dateArr="+ Arrays.toString(p_rent_st_dateArr) 
				+ ", p_rent_ed_dateArr=" + Arrays.toString(p_rent_ed_dateArr)
				+ ", rent_timeArr=" + Arrays.toString(rent_timeArr) 
				+ ", rent_settingArr=" + Arrays.toString(rent_settingArr) 
				+ ", personal_cntArr=" + Arrays.toString(personal_cntArr)
				+ ", etc_textArr=" + Arrays.toString(etc_textArr) 
				+ ", textArr=" + Arrays.toString(textArr)
				+ ", facList=" + facList + "]";
	}

	public void setValueList(List<FacilityVO> valueList){
		this.facList = valueList;
	}
	
	public List<FacilityVO> getValueList(){
		return facList;
	}

	public int getPlace_idx() {
		return place_idx;
	}

	public void setPlace_idx(int place_idx) {
		this.place_idx = place_idx;
	}

	public int getCrm_event_idx() {
		return crm_event_idx;
	}

	public void setCrm_event_idx(int crm_event_idx) {
		this.crm_event_idx = crm_event_idx;
	}

	
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}	
	
	
	public String getP_rent_st_date() {
		return p_rent_st_date;
	}

	public void setP_rent_st_date(String p_rent_st_date) {
		this.p_rent_st_date = p_rent_st_date;
	}

	public String getP_rent_ed_date() {
		return p_rent_ed_date;
	}

	public void setP_rent_ed_date(String p_rent_ed_date) {
		this.p_rent_ed_date = p_rent_ed_date;
	}
	
	public String getRent_time() {
		return rent_time;
	}

	public void setRent_time(String rent_time) {
		this.rent_time = rent_time;
	}		
		
	
/*
	public String getRent_time_am() {
		return rent_time_am;
	}

	public void setRent_time_am(String rent_time_am) {
		this.rent_time_am = rent_time_am;
	}

	public String getRent_time_pm() {
		return rent_time_pm;
	}

	public void setRent_time_pm(String rent_time_pm) {
		this.rent_time_pm = rent_time_pm;
	}

	public String getRent_time_night() {
		return rent_time_night;
	}

	public void setRent_time_night(String rent_time_night) {
		this.rent_time_night = rent_time_night;
	}
*/
	public String getRent_setting() {
		return rent_setting;
	}

	public void setRent_setting(String rent_setting) {
		this.rent_setting = rent_setting;
	}
/*
	public String getRent_etc_text() {
		return rent_etc_text;
	}

	public void setRent_etc_text(String rent_etc_text) {
		this.rent_etc_text = rent_etc_text;
	}
*/
	public String getEtc_text() {
		return etc_text;
	}

	public void setEtc_text(String etc_text) {
		this.etc_text = etc_text;
	}

	public String getPersonal_cnt() {
		return personal_cnt;
	}

	public void setPersonal_cnt(String personal_cnt) {
		this.personal_cnt = personal_cnt;
	}


	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}		
	
	
	
	
	
	
	
	
	public String[] getPlace_idxArr() {
		return place_idxArr;
	}

	public void setPlace_idxArr(String[] place_idxArr) {
		this.place_idxArr = place_idxArr;
	}

	public String[] getCrm_event_idxArr() {
		return crm_event_idxArr;
	}

	public void setCrm_event_idxArr(String[] crm_event_idxArr) {
		this.crm_event_idxArr = crm_event_idxArr;
	}


	public String[] getPlaceArr() {
		return placeArr;
	}

	public void setPlaceArr(String[] placeArr) {
		this.placeArr = placeArr;
	}	
	
/*	
	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	
	public String[] getValueArr() {
		return valueArr;
	}

	public void setValueArr(String[] valueArr) {
		this.valueArr = valueArr;
	}
*/
	public String[] getP_rent_st_dateArr() {
		return p_rent_st_dateArr;
	}

	public void setP_rent_st_dateArr(String[] p_rent_st_dateArr) {
		this.p_rent_st_dateArr = p_rent_st_dateArr;
	}

	public String[] getP_rent_ed_dateArr() {
		return p_rent_ed_dateArr;
	}

	public void setP_rent_ed_dateArr(String[] p_rent_ed_dateArr) {
		this.p_rent_ed_dateArr = p_rent_ed_dateArr;
	}
	
	public String[] getRent_timeArr() {
		return rent_timeArr;
	}

	public void setRent_timeArr(String[] rent_timeArr) {
		this.rent_timeArr = rent_timeArr;
	}
/*	
	public String[] getRent_time_amArr() {
		return rent_time_amArr;
	}

	public void setRent_time_amArr(String[] rent_time_amArr) {
		this.rent_time_amArr = rent_time_amArr;
	}

	public String[] getRent_time_pmArr() {
		return rent_time_pmArr;
	}

	public void setRent_time_pmArr(String[] rent_time_pmArr) {
		this.rent_time_pmArr = rent_time_pmArr;
	}

	public String[] getRent_time_nightArr() {
		return rent_time_nightArr;
	}

	public void setRent_time_nightArr(String[] rent_time_nightArr) {
		this.rent_time_nightArr = rent_time_nightArr;
	}
*/
	public String[] getRent_settingArr() {
		return rent_settingArr;
	}

	public void setRent_settingArr(String[] rent_settingArr) {
		this.rent_settingArr = rent_settingArr;
	}
/*
	public String[] getRent_etc_textArr() {
		return rent_etc_textArr;
	}

	public void setRent_etc_textArr(String[] rent_etc_textArr) {
		this.rent_etc_textArr = rent_etc_textArr;
	}
*/
	public String[] getPersonal_cntArr() {
		return personal_cntArr;
	}

	public void setPersonal_cntArr(String[] personal_cntArr) {
		this.personal_cntArr = personal_cntArr;
	}

	public String[] getEtc_textArr() {
		return etc_textArr;
	}

	public void setEtc_textArr(String[] etc_textArr) {
		this.etc_textArr = etc_textArr;
	}

	public String[] getTextArr() {
		return textArr;
	}

	public void setTextArr(String[] textArr) {
		this.textArr = textArr;
	}

}
