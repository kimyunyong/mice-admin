package com.mice.crm.service;

import java.lang.reflect.Field;
import java.util.List;

public class OrganizerVO extends Organizer {
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
	   
	private String searchName = "";
	private String searchType = "";
	private String user_nm = "";
	private String searchAddress = "";
	private String type_name = "";
	private String manager_nm = "";
	private String search_manager_nm = "";
	

	private String search_manager_event = "";
	private String search_crm_event_idx;
	private String search_event_cate_biz1;
	private String search_event_cate_biz2;
	private String search_event_cate_biz3;

	private String search_org_import = "";
	private String search_org_grade = "";
	private String search_org_step = "";

	private List<String> search_event_cate_serviceList = null;
	private List<String> search_event_cate_itemList = null;
	
	public String getSearch_manager_nm() {
		return search_manager_nm;
	}
	public void setSearch_manager_nm(String search_manager_nm) {
		this.search_manager_nm = search_manager_nm;
	}
	public String getManager_nm() {
		return manager_nm;
	}
	public void setManager_nm(String manager_nm) {
		this.manager_nm = manager_nm;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getSearchAddress() {
		return searchAddress;
	}
	public void setSearchAddress(String searchAddress) {
		try
		{
			this.searchAddress = com.mice.common.encrypt.AESGenerator.encrypt(searchAddress);
		}catch(Exception ex){
			this.searchAddress = searchAddress;
		}
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
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	
	
	
	
	public String getSearch_manager_event() {
		return search_manager_event;
	}
	public void setSearch_manager_event(String search_manager_event) {
		this.search_manager_event = search_manager_event;
	}
	public String getSearch_crm_event_idx() {
		return search_crm_event_idx;
	}
	public void setSearch_crm_event_idx(String search_crm_event_idx) {
		this.search_crm_event_idx = search_crm_event_idx;
	}
	public String getSearch_event_cate_biz1() {
		return search_event_cate_biz1;
	}
	public void setSearch_event_cate_biz1(String search_event_cate_biz1) {
		this.search_event_cate_biz1 = search_event_cate_biz1;
	}
	public String getSearch_event_cate_biz2() {
		return search_event_cate_biz2;
	}
	public void setSearch_event_cate_biz2(String search_event_cate_biz2) {
		this.search_event_cate_biz2 = search_event_cate_biz2;
	}
	public String getSearch_event_cate_biz3() {
		return search_event_cate_biz3;
	}
	public void setSearch_event_cate_biz3(String search_event_cate_biz3) {
		this.search_event_cate_biz3 = search_event_cate_biz3;
	}
	public String getSearch_org_import() {
		return search_org_import;
	}
	public void setSearch_org_import(String search_org_import) {
		this.search_org_import = search_org_import;
	}
	public String getSearch_org_grade() {
		return search_org_grade;
	}
	public void setSearch_org_grade(String search_org_grade) {
		this.search_org_grade = search_org_grade;
	}
	public String getSearch_org_step() {
		return search_org_step;
	}
	public void setSearch_org_step(String search_org_step) {
		this.search_org_step = search_org_step;
	}
	
	

	
	
	
	
	public List<String> getSearch_event_cate_serviceList() {
		return search_event_cate_serviceList;
	}
	public void setSearch_event_cate_serviceList(List<String> search_event_cate_serviceList) {
		this.search_event_cate_serviceList = search_event_cate_serviceList;
	}
	public List<String> getSearch_event_cate_itemList() {
		return search_event_cate_itemList;
	}
	public void setSearch_event_cate_itemList(List<String> search_event_cate_itemList) {
		this.search_event_cate_itemList = search_event_cate_itemList;
	}

	
	
}
