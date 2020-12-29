package com.mice.crm.service;

public class PromotionVO extends Promotion {

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
	
	private String searchRegName = "";
	private String searchStartDate = "";
	private String searchEndDate = "";
	private String searchPromotionType = "";
	
	private String user_nm = "";
	private String event_name = "";
	private String file_cnt = "";
	
	private String searchEvtName = "";
	private String searchOrgName = "";
	private String searchPromotionType2 = "";
	
	
	
	
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
		if(searchCnd.equals("1"))
		{
			try
			{
				this.searchWrd = com.mice.common.encrypt.AESGenerator.encrypt(searchWrd);
			}catch(Exception ex){
				this.searchWrd = searchWrd;
			}
		}else{
			this.searchWrd = searchWrd;
		}
	}
	
	
	
	public String getSearchPromotionType() {
		return searchPromotionType;
	}
	public void setSearchPromotionType(String searchPromotionType) {
		this.searchPromotionType = searchPromotionType;
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
	public String getFile_cnt() {
		return file_cnt;
	}
	public void setFile_cnt(String file_cnt) {
		this.file_cnt = file_cnt;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getSearchRegName() {
		return searchRegName;
	}
	public void setSearchRegName(String searchRegName) {
		this.searchRegName = searchRegName;
	}
	public String getSearchStartDate() {
		return searchStartDate;
	}
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	public String getSearchEndDate() {
		return searchEndDate;
	}
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}
	
	
	
	public String getSearchEvtName() {
		return searchEvtName;
	}
	public void setSearchEvtName(String searchEvtName) {
		this.searchEvtName = searchEvtName;
	}	
	

	public String getSearchOrgName() {
		return searchOrgName;
	}
	public void setSearchOrgName(String searchOrgName) {
		this.searchOrgName = searchOrgName;
	}	
	
	public String getSearchPromotionType2() {
		return searchPromotionType2;
	}
	public void setSearchPromotionType2(String searchPromotionType2) {
		this.searchPromotionType2 = searchPromotionType2;
	}
	
	
	
}
