package com.mice.crm.service;

public class CustomerVO extends Customer{
	
	
	
	   
	   /** 검색시작일 */
	   private String searchBgnDe = "";
	   
	   /** 검색조건 */
	   private String searchCnd = "";
	  
	   /** 검색조건 -  담당자 */
	   private String searchMng = "";

	   
	   
	   /** 검색종료일 */
	   private String searchEndDe = "";
	   
	   /** 검색단어 */
	   private String searchWrd = "";
	   
	   /** 검색단어 - 이름 */
	   private String searchWrdName = "";
	   
	   /** 검색단어 -  소속 */
	   private String searchWrdSosoc = "";
	   
	   
	   
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
	   
	   private String searchName = "";
	   
	   private String searchOrganizer = "";
	   
	   private int organizer_cnt = 0;

	   private String user_nm = "";
	   

	   
		/** 내.외국인  */
	   private String searchCountry = "";
	
	   /** 검색조건 -  뉴스레터 */
	   private String searchNewsletter = "";

	   

		
		
	public String getUser_nm() {
		return user_nm;
	}

	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}

	public int getOrganizer_cnt() {
		return organizer_cnt;
	}

	public void setOrganizer_cnt(int organizer_cnt) {
		this.organizer_cnt = organizer_cnt;
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

	
	
	public String getSearchMng() {
		return searchMng;
	}

	public void setSearchMng(String searchMng) {
		this.searchMng = searchMng;
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
		if(this.searchCnd.equals("1")) //&& !this.searchWrd.equals("")
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


	public String getSearchWrdName() {
		return searchWrdName;
	}
	public void setSearchWrdName(String searchWrdName) {
		try
		{
			this.searchWrdName = com.mice.common.encrypt.AESGenerator.encrypt(searchWrdName);
		}catch(Exception ex){
			this.searchWrdName = searchWrdName;
		}		
	}
	
	public String getSearchWrdSosoc() {
		return searchWrdSosoc;
	}
	public void setSearchWrdSosoc(String searchWrdSosoc) {
		this.searchWrdSosoc = searchWrdSosoc;
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

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchOrganizer() {
		return searchOrganizer;
	}

	public void setSearchOrganizer(String searchOrganizer) {
		this.searchOrganizer = searchOrganizer;
	}
	   

	
	
	
	
	
	
	public String getSearchCountry() {
		return searchCountry;
	}

	public void setSearchCountry(String searchCountry) {
		this.searchCountry = searchCountry;
	}
	

	
	public String getSearchNewsletter() {
		return searchNewsletter;
	}

	public void setSearchNewsletter(String searchNewsletter) {
		this.searchNewsletter = searchNewsletter;
	}
	
	
	
	
	
}
