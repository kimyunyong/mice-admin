package com.mice.crm.service;

import java.util.List;

public class EventVO extends Event{
	
	 /** 검색시작일 */
	   private String searchBgnDe = "";
	   
	   /** 검색조건 */
	   private String searchCnd = "";
	   
	   /** 검색종료일 */
	   private String searchEndDe = "";
	   
	   /** 검색단어 */
	   private String searchWrd = "";
	   
	   /** 정렬순서(DESC,ASC) */
	   private long sortOrdr = 0L;

	   /** 검색사용여부 */
	   private String searchUseYn = "";

	   /** 현재페이지 */
	   private int pageIndex = 1;

	   /** 페이지갯수 */
	   private int pageUnit = 10;

	   /** 페이지사이즈 */
	   private int pageSize = 10;

	   /** 첫페이지 인덱스 */
	   private int firstIndex = 1;

	   /** 마지막페이지 인덱스 */
	   private int lastIndex = 1;

	   /** 페이지당 레코드 개수 */
	   private int recordCountPerPage = 10;

	   /** 레코드 번호 */
	   private int rowNo = 0;
	
	private String searchIdx = "";
	private List<String> searchImplementsStatusList = null;
	private List<String> searchEventDivisionList = null;
	private String searchPlaceIdx = "";
	private String searchRegId = "";
	private String searchRentStartDate = "";
	private String searchRentEndDate = "";
	private String searchEventStartDate = "";
	private String searchEventEndDate = "";
	private String searchJoinPersonalMinCount = "";
	private String searchJoinPersonalMaxCount = "";
	private String searchJoinNationalsMinCount = "";
	private String searchJoinNationalsMaxCount = "";
	private String searchJoinForeignerMinCount = "";
	private String searchJoinForeignerMaxCount = "";
	private String searchExhibitionScaleMinCount = "";
	private String searchExhibitionScaleMaxCount = "";
	private String searchParticipatingStatesMinCount = "";
	private String searchParticipatingStatesMaxCount = "";
	private String searchAttractGrantMinCost = "";
	private String searchAttractGrantMaxCost = "";
	private String searchSalesGrantMinCost = "";
	private String searchSalesGrantMaxCost = "";
	private String searchHeldGrantMinCost = "";
	private String searchHeldGrantMaxCost = "";
	private String searchOrganizers_1 = "";
	private String searchOrganizers_2 = "";
	private String searchRentFacility = "";
	private String searchEventName = "";
	private String searchOrderby = "-1";
	private String searchFloor = "";
	
	
	private String place_name = "";
	private String organizers_1_name = "";
	private String organizers_2_name = "";
	private String attract_staff_name = "";
	private String event_staff_name = "";
	private String implementation_status_name = "";
	private String facility_text_description = "";
	private String event_division_name = "";
	private String event_type_name = "";
	private String event_scale_name = "";
	private String manager_1_name = "";
	private String manager_2_name = "";
	
	private String rent_area_value = ""; //대관가능면적
	private String rent_cost_value = ""; //대관가능매출
	private String rent_area_day_value = ""; //대관면적/일
	private String rent_yn_value = ""; //대관유무
	private String rent_day_value = ""; //대관기간(일)
	private String rent_all_area_value = ""; // 전체대관면적
	private String rent_inner_area_value = ""; // 실내전시실대관면적
	
	private String searchAttachFileType = "";
	private int diffDay = 0;
	private String cowork = "";
	private String write_condition_tf;				// 작성 현황
	
	
	private String manager_1_tel_no = "";	/* 주최기관 - 연락처 */
	private String manager_1_phone_no = "";	/* 주최기관 - 휴대폰 */
	private String manager_1_email = ""; /* 주최기관 - 이메일 */
	private String manager_1_position = ""; /* 주최기관 - 직책  */
	
	
	private String manager_2_tel_no = "";	/* 주관기관 - 연락처 */
	private String manager_2_phone_no = "";	/* 주관기관 - 휴대폰 */
	private String manager_2_email = ""; /* 주관기관 - 이메일 */
	private String manager_2_position = ""; /* 주관기관 - 직책  */
	
	

	private String manager_event = ""; /* 일반행사, 주관행사 여부  */
	private String search_manager_event = ""; /* 일반행사, 주관행사 여부  */

	
	public String getWrite_condition_tf() {
		return write_condition_tf;
	}
	public void setWrite_condition_tf(String write_condition_tf) {
		this.write_condition_tf = write_condition_tf;
	}
	public String getCowork() {
		return cowork;
	}
	public void setCowork(String cowork) {
		this.cowork = cowork;
	}
	public String getRent_area_value() {
		return rent_area_value;
	}
	public void setRent_area_value(String rent_area_value) {
		this.rent_area_value = rent_area_value;
	}
	public String getRent_cost_value() {
		return rent_cost_value;
	}
	public void setRent_cost_value(String rent_cost_value) {
		this.rent_cost_value = rent_cost_value;
	}
	public String getRent_area_day_value() {
		return rent_area_day_value;
	}
	public void setRent_area_day_value(String rent_area_day_value) {
		this.rent_area_day_value = rent_area_day_value;
	}
	public String getRent_yn_value() {
		return rent_yn_value;
	}
	public void setRent_yn_value(String rent_yn_value) {
		this.rent_yn_value = rent_yn_value;
	}
	public String getRent_day_value() {
		return rent_day_value;
	}
	public void setRent_day_value(String rent_day_value) {
		this.rent_day_value = rent_day_value;
	}
	public String getRent_all_area_value() {
		return rent_all_area_value;
	}
	public void setRent_all_area_value(String rent_all_area_value) {
		this.rent_all_area_value = rent_all_area_value;
	}
	public String getRent_inner_area_value() {
		return rent_inner_area_value;
	}
	public void setRent_inner_area_value(String rent_inner_area_value) {
		this.rent_inner_area_value = rent_inner_area_value;
	}
	public int getDiffDay() {
		return diffDay;
	}
	public void setDiffDay(int diffDay) {
		this.diffDay = diffDay;
	}
	public String getSearchAttachFileType() {
		return searchAttachFileType;
	}
	public void setSearchAttachFileType(String searchAttachFileType) {
		this.searchAttachFileType = searchAttachFileType;
	}
	public String getManager_1_name() {
		return manager_1_name;
	}
	public void setManager_1_name(String manager_1_name) {
		this.manager_1_name = manager_1_name;
	}
	public String getManager_2_name() {
		return manager_2_name;
	}
	public void setManager_2_name(String manager_2_name) {
		this.manager_2_name = manager_2_name;
	}
	public String getEvent_division_name() {
		return event_division_name;
	}
	public void setEvent_division_name(String event_division_name) {
		this.event_division_name = event_division_name;
	}
	public String getEvent_type_name() {
		return event_type_name;
	}
	public void setEvent_type_name(String event_type_name) {
		this.event_type_name = event_type_name;
	}
	public String getEvent_scale_name() {
		return event_scale_name;
	}
	public void setEvent_scale_name(String event_scale_name) {
		this.event_scale_name = event_scale_name;
	}
	public String getFacility_text_description() {
		return facility_text_description;
	}
	public void setFacility_text_description(String facility_text_description) {
		this.facility_text_description = facility_text_description;
	}
	public String getImplementation_status_name() {
		return implementation_status_name;
	}
	public void setImplementation_status_name(String implementation_status_name) {
		this.implementation_status_name = implementation_status_name;
	}
	public String getAttract_staff_name() {
		return attract_staff_name;
	}
	public void setAttract_staff_name(String attract_staff_name) {
		this.attract_staff_name = attract_staff_name;
	}
	public String getEvent_staff_name() {
		return event_staff_name;
	}
	public void setEvent_staff_name(String event_staff_name) {
		this.event_staff_name = event_staff_name;
	}
	public String getOrganizers_1_name() {
		return organizers_1_name;
	}
	public void setOrganizers_1_name(String organizers_1_name) {
		this.organizers_1_name = organizers_1_name;
	}
	public String getOrganizers_2_name() {
		return organizers_2_name;
	}
	public void setOrganizers_2_name(String organizers_2_name) {
		this.organizers_2_name = organizers_2_name;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getSearchBgnDe() {
		return searchBgnDe;
	}
	public void setSearchBgnDe(String searchBgnDe) {
		this.searchBgnDe = searchBgnDe;
	}
	public String getSearchCnd() {
		return searchCnd;
	}
	public void setSearchCnd(String searchCnd) {
		this.searchCnd = searchCnd;
	}
	public String getSearchEndDe() {
		return searchEndDe;
	}
	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}
	public String getSearchWrd() {
		return searchWrd;
	}
	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}
	public long getSortOrdr() {
		return sortOrdr;
	}
	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getRowNo() {
		return rowNo;
	}
	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}
	public String getSearchIdx() {
		return searchIdx;
	}
	public void setSearchIdx(String searchIdx) {
		this.searchIdx = searchIdx;
	}
	public List<String> getSearchImplementsStatusList() {
		return searchImplementsStatusList;
	}
	public void setSearchImplementsStatusList(
			List<String> searchImplementsStatusList) {
		this.searchImplementsStatusList = searchImplementsStatusList;
	}
	public List<String> getSearchEventDivisionList() {
		return searchEventDivisionList;
	}
	public void setSearchEventDivisionList(List<String> searchEventDivisionList) {
		this.searchEventDivisionList = searchEventDivisionList;
	}
	public String getSearchPlaceIdx() {
		return searchPlaceIdx;
	}
	public void setSearchPlaceIdx(String searchPlaceIdx) {
		this.searchPlaceIdx = searchPlaceIdx;
	}
	public String getSearchRegId() {
		return searchRegId;
	}
	public void setSearchRegId(String searchRegId) {
		this.searchRegId = searchRegId;
	}
	public String getSearchRentStartDate() {
		return searchRentStartDate;
	}
	public void setSearchRentStartDate(String searchRentStartDate) {
		this.searchRentStartDate = searchRentStartDate;
	}
	public String getSearchRentEndDate() {
		return searchRentEndDate;
	}
	public void setSearchRentEndDate(String searchRentEndDate) {
		this.searchRentEndDate = searchRentEndDate;
	}
	public String getSearchEventStartDate() {
		return searchEventStartDate;
	}
	public void setSearchEventStartDate(String searchEventStartDate) {
		this.searchEventStartDate = searchEventStartDate;
	}
	public String getSearchEventEndDate() {
		return searchEventEndDate;
	}
	public void setSearchEventEndDate(String searchEventEndDate) {
		this.searchEventEndDate = searchEventEndDate;
	}
	public String getSearchJoinPersonalMinCount() {
		return searchJoinPersonalMinCount;
	}
	public void setSearchJoinPersonalMinCount(String searchJoinPersonalMinCount) {
		this.searchJoinPersonalMinCount = searchJoinPersonalMinCount;
	}
	public String getSearchJoinPersonalMaxCount() {
		return searchJoinPersonalMaxCount;
	}
	public void setSearchJoinPersonalMaxCount(String searchJoinPersonalMaxCount) {
		this.searchJoinPersonalMaxCount = searchJoinPersonalMaxCount;
	}
	public String getSearchJoinNationalsMinCount() {
		return searchJoinNationalsMinCount;
	}
	public void setSearchJoinNationalsMinCount(String searchJoinNationalsMinCount) {
		this.searchJoinNationalsMinCount = searchJoinNationalsMinCount;
	}
	public String getSearchJoinNationalsMaxCount() {
		return searchJoinNationalsMaxCount;
	}
	public void setSearchJoinNationalsMaxCount(String searchJoinNationalsMaxCount) {
		this.searchJoinNationalsMaxCount = searchJoinNationalsMaxCount;
	}
	public String getSearchJoinForeignerMinCount() {
		return searchJoinForeignerMinCount;
	}
	public void setSearchJoinForeignerMinCount(String searchJoinForeignerMinCount) {
		this.searchJoinForeignerMinCount = searchJoinForeignerMinCount;
	}
	public String getSearchJoinForeignerMaxCount() {
		return searchJoinForeignerMaxCount;
	}
	public void setSearchJoinForeignerMaxCount(String searchJoinForeignerMaxCount) {
		this.searchJoinForeignerMaxCount = searchJoinForeignerMaxCount;
	}
	public String getSearchExhibitionScaleMinCount() {
		return searchExhibitionScaleMinCount;
	}
	public void setSearchExhibitionScaleMinCount(
			String searchExhibitionScaleMinCount) {
		this.searchExhibitionScaleMinCount = searchExhibitionScaleMinCount;
	}
	public String getSearchExhibitionScaleMaxCount() {
		return searchExhibitionScaleMaxCount;
	}
	public void setSearchExhibitionScaleMaxCount(
			String searchExhibitionScaleMaxCount) {
		this.searchExhibitionScaleMaxCount = searchExhibitionScaleMaxCount;
	}
	public String getSearchParticipatingStatesMinCount() {
		return searchParticipatingStatesMinCount;
	}
	public void setSearchParticipatingStatesMinCount(
			String searchParticipatingStatesMinCount) {
		this.searchParticipatingStatesMinCount = searchParticipatingStatesMinCount;
	}
	public String getSearchParticipatingStatesMaxCount() {
		return searchParticipatingStatesMaxCount;
	}
	public void setSearchParticipatingStatesMaxCount(
			String searchParticipatingStatesMaxCount) {
		this.searchParticipatingStatesMaxCount = searchParticipatingStatesMaxCount;
	}
	public String getSearchAttractGrantMinCost() {
		return searchAttractGrantMinCost;
	}
	public void setSearchAttractGrantMinCost(String searchAttractGrantMinCost) {
		this.searchAttractGrantMinCost = searchAttractGrantMinCost;
	}
	public String getSearchAttractGrantMaxCost() {
		return searchAttractGrantMaxCost;
	}
	public void setSearchAttractGrantMaxCost(String searchAttractGrantMaxCost) {
		this.searchAttractGrantMaxCost = searchAttractGrantMaxCost;
	}
	public String getSearchSalesGrantMinCost() {
		return searchSalesGrantMinCost;
	}
	public void setSearchSalesGrantMinCost(String searchSalesGrantMinCost) {
		this.searchSalesGrantMinCost = searchSalesGrantMinCost;
	}
	public String getSearchSalesGrantMaxCost() {
		return searchSalesGrantMaxCost;
	}
	public void setSearchSalesGrantMaxCost(String searchSalesGrantMaxCost) {
		this.searchSalesGrantMaxCost = searchSalesGrantMaxCost;
	}
	public String getSearchHeldGrantMinCost() {
		return searchHeldGrantMinCost;
	}
	public void setSearchHeldGrantMinCost(String searchHeldGrantMinCost) {
		this.searchHeldGrantMinCost = searchHeldGrantMinCost;
	}
	public String getSearchHeldGrantMaxCost() {
		return searchHeldGrantMaxCost;
	}
	public void setSearchHeldGrantMaxCost(String searchHeldGrantMaxCost) {
		this.searchHeldGrantMaxCost = searchHeldGrantMaxCost;
	}
	public String getSearchOrganizers_1() {
		return searchOrganizers_1;
	}
	public void setSearchOrganizers_1(String searchOrganizers_1) {
		this.searchOrganizers_1 = searchOrganizers_1;
	}
	public String getSearchOrganizers_2() {
		return searchOrganizers_2;
	}
	public void setSearchOrganizers_2(String searchOrganizers_2) {
		this.searchOrganizers_2 = searchOrganizers_2;
	}
	public String getSearchRentFacility() {
		return searchRentFacility;
	}
	public void setSearchRentFacility(String searchRentFacility) {
		this.searchRentFacility = searchRentFacility;
	}
	public String getSearchEventName() {
		return searchEventName;
	}
	public void setSearchEventName(String searchEventName) {
		this.searchEventName = searchEventName;
	}
	public String getSearchOrderby() {
		return searchOrderby;
	}
	public void setSearchOrderby(String searchOrderby) {
		this.searchOrderby = searchOrderby;
	}
	public String getSearchFloor() {
		return searchFloor;
	}
	public void setSearchFloor(String searchFloor) {
		this.searchFloor = searchFloor;
	}	
	
	
	
	

	public String getManager_1_tel_no() {
		return manager_1_tel_no;
	}
	public void setManager_1_tel_no(String manager_1_tel_no) {
		this.manager_1_tel_no = manager_1_tel_no;
	}
	
	public String getManager_1_phone_no() {
		return manager_1_phone_no;
	}
	public void setManager_1_phone_no(String manager_1_phone_no) {
		this.manager_1_phone_no = manager_1_phone_no;
	}
	
	public String getManager_1_email() {
		return manager_1_email;
	}
	public void setManager_1_email(String manager_1_email) {
		this.manager_1_email = manager_1_email;
	}
		
	public String getManager_1_position() {
		return manager_1_position;
	}
	public void setManager_1_position(String manager_1_position) {
		this.manager_1_position = manager_1_position;
	}
		
	
	

	public String getManager_2_tel_no() {
		return manager_2_tel_no;
	}
	public void setManager_2_tel_no(String manager_2_tel_no) {
		this.manager_2_tel_no = manager_2_tel_no;
	}
	
	public String getManager_2_phone_no() {
		return manager_2_phone_no;
	}
	public void setManager_2_phone_no(String manager_2_phone_no) {
		this.manager_2_phone_no = manager_2_phone_no;
	}
	
	public String getManager_2_email() {
		return manager_2_email;
	}
	public void setManager_2_email(String manager_2_email) {
		this.manager_2_email = manager_2_email;
	}
		
	public String getManager_2_position() {
		return manager_2_position;
	}
	public void setManager_2_position(String manager_2_position) {
		this.manager_2_position = manager_2_position;
	}
	
	
	public String getManager_event() {
		return manager_event;
	}
	public void setManager_event(String manager_event) {
		this.manager_event = manager_event;
	}	

	public String getSearch_manager_event() {
		return search_manager_event;
	}
	public void setSearch_manager_event(String search_manager_event) {
		this.search_manager_event = search_manager_event;
	}	
	
	
	
}
