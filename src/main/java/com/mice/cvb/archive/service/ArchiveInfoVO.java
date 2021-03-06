package com.mice.cvb.archive.service;

public class ArchiveInfoVO extends ArchiveInfo{

	private static final long serialVersionUID = -8274004534207618049L;
	
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

   private String search_code = "";
   
   private String codes = "";
   
   private String code_names = "";
	public String getCodes() {
		return codes;
	}

	public void setCodes(String codes) {
		this.codes = codes;
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

	public String getSearch_code() {
		return search_code;
	}

	public void setSearch_code(String search_code) {
		this.search_code = search_code;
	}

	public String getCode_names() {
		return code_names;
	}

	public void setCode_names(String code_names) {
		this.code_names = code_names;
	}
}
