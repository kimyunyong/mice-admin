package com.mice.crm.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class EventTotalSearchVO extends  TotalSearchExcelVO{

	   
	   /** 검색종료일 */
	   private String searchEndDe = "";
	   
	   /** 검색단어 */
	   private String searchWrd = "";

	   /** 검색조건 */
	   private String searchCnd = "";

	   
	   /** 정렬순서(DESC,ASC) */
	   private long sortOrdr = 0L;

	   /** 검색사용여부 */
	   private String searchUseYn = "";

	   /** 현재페이지 */
	   private int pageIndex = 1;

	   /** 페이지갯수 */
	   private int pageUnit = 10; //페이지 번호 10개

	   /** 페이지사이즈 */
	   private int pageSize = 10; //콘텐츠 20개

	   /** 페이지사이즈 */
	   private int pageSize2 = 10;

	   
	   /** 첫페이지 인덱스 */
	   private int firstIndex = 1;

	   /** 마지막페이지 인덱스 */
	   private int lastIndex = 1;

	   /** 페이지당 레코드 개수 */
	   private int recordCountPerPage = 50;

	   /** 레코드 번호 */
	   private int rowNo = 0;
	   
	   
		
		
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

		
		
		public String getSearchCnd() {
			return searchCnd;
		}

		public void setSearchCnd(String searchCnd) {
			this.searchCnd = searchCnd;
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


		public int getPageSize2() {
			return pageSize2;
		}

		public void setPageSize2(int pageSize2) {
			this.pageSize2 = pageSize2;
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

		

		private int searchCusIdx;	/* 고객 번호*/
		private String searchUserName;	/* 고객성명*/
		private String searchUserAddr;	/* 고객주소*/
		private String searchUserPosition;	/* 고객직함*/
		private String searchUserEtc;	/* 고객비고 */
		
		private String searchSosoc; /* 소속*/
		private String searchEvtName; /* 행사명 */
		private String searchArea; /* 지역 */
		private String searchSdate; /* 행사개최년도 - 시작일*/
		private String searchEdate; /* 행사개최년도- 종료일*/
		private String searchMngName; /* 유치담당자*/
		private String searchRegName; /* 등록자 */
		private String searchSosoc_excel; /* 소속-엑샐 */
		private String searchDepartment; /* 부서 */
		private String searchEmail; /* 이메일 */
		
		
		//private List<String> searchOrgList = null; /* 주최기관 */
		private String searchOrgList; /* 주최기관 */
		
		//private List<String> searchEvtThemeList = null; /* 행사주제 */
		private String searchEvtThemeList; /* 행사주제 */
		
		private String searchEvtThemeStr = ""; /* 등록자 */
		private String searchNewsLetter; /* 뉴스레터 */
		private String searchCountry;	/* 내/외국인*/
		private String searchOrder;	/* 정렬 */
		private List<String>  searchNum;	/* 선택박스 번호 */
		private String searchExcel;	/* 엑셀다운로드 방법 */
		private String searchExcelDownName;	/* 엑셀다운로드 이름 */
		private int flag = 1;	/* 상단검색여부 */
		

		
		//SMS
		private int sms_remote_num;	/* 갯수 */
		private String sms_remote_phone;	/* 전화번호  */
		private String sms_remote_msg;	/* 메시지 */

		

		
		public int getSearchCusIdx() {
			return searchCusIdx;
		}

		public void setSearchCusIdx(int searchCusIdx) {
			this.searchCusIdx = searchCusIdx;
		}		
		
		
		public String getSearchUserName() {
			return searchUserName;
		}
		public void setSearchUserName(String searchUserName) {
			this.searchUserName = searchUserName;
		}

		
		public String getSearchUserAddr() {
			return searchUserAddr;
		}
		public void setSearchUserAddr(String searchUserAddr) {
			this.searchUserAddr = searchUserAddr;
		}
		
		
		public String getSearchUserPosition() {
			return searchUserPosition;
		}
		public void setSearchUserPosition(String searchUserPosition) {
			this.searchUserPosition = searchUserPosition;
		}
		
		public String getSearchUserEtc() {
			return searchUserEtc;
		}
		public void setSearchUserEtc(String searchUserEtc) {
			this.searchUserEtc = searchUserEtc;
		}
		
		
		
		
		public String getSearchSosoc() {
			return searchSosoc;
		}

		public void setSearchSosoc(String searchSosoc) {
			this.searchSosoc = searchSosoc;
		}

		public String getSearchEvtName() {
			return searchEvtName;
		}

		public void setSearchEvtName(String searchEvtName) {
			this.searchEvtName = searchEvtName;
		}

		public String getSearchArea() {
			return searchArea;
		}

		public void setSearchArea(String searchArea) {
			this.searchArea = searchArea;
		}

		public String getSearchSdate() {
			return searchSdate;
		}

		public void setSearchSdate(String searchSdate) {
			this.searchSdate = searchSdate;
		}

		public String getSearchEdate() {
			return searchEdate;
		}

		public void setSearchEdate(String searchEdate) {
			this.searchEdate = searchEdate;
		}

		public String getSearchMngName() {
			return searchMngName;
		}

		public void setSearchMngName(String searchMngName) {
			this.searchMngName = searchMngName;
		}

		public String getSearchRegName() {
			return searchRegName;
		}

		public void setSearchRegName(String searchRegName) {
			this.searchRegName = searchRegName;
		}

		public String getSearchSosoc_excel() {
			return searchSosoc_excel;
		}
		public void setSearchSosoc_excel(String searchSosoc_excel) {
			this.searchSosoc_excel = searchSosoc_excel;
		}
		
		public String getSearchDepartment() {
			return searchDepartment;
		}
		public void setSearchDepartment(String searchDepartment) {
			this.searchDepartment = searchDepartment;
		}
				

		public String getSearchEmail() {
			return searchEmail;
		}
		public void setSearchEmail(String searchEmail) {
			this.searchEmail = searchEmail;
		}
				
		
		
		
		/*
		public List<String> getSearchOrgList() {
			return searchOrgList;
		}
		public void setSearchOrgList(List<String> searchOrgList) {
			this.searchOrgList = searchOrgList;
		}
		*/		
		
		
		public String getSearchOrgList() {
			return searchOrgList;
		}
		public void setSearchOrgList(String searchOrgList) {
			this.searchOrgList = searchOrgList;
		}
		
		
		
		/*
		public List<String> getSearchEvtThemeList() {
			return searchEvtThemeList;
		}
		public void setSearchEvtThemeList(List<String> searchEvtThemeList) {
			this.searchEvtThemeList = searchEvtThemeList;
		}
		*/
		
		
		public String getSearchEvtThemeList() {
			return searchEvtThemeList;
		}
		public void setSearchEvtThemeList(String searchEvtThemeList) {
			this.searchEvtThemeList = searchEvtThemeList;
		}		
		
		
		
		
		
		
		public String getSearchEvtThemeStr() {
			return searchEvtThemeStr;
		}

		public void setSearchEvtThemeStr(String searchEvtThemeStr) {
			this.searchEvtThemeStr = searchEvtThemeStr;
		}
		
		
		
		
		public String getSearchNewsLetter() {
			return searchNewsLetter;
		}

		public void setSearchNewsLetter(String searchNewsLetter) {
			this.searchNewsLetter = searchNewsLetter;
		}


		public String getSearchCountry() {
			return searchCountry;
		}
		public void setSearchCountry(String searchCountry) {
			this.searchCountry = searchCountry;
		}

		public String getSearchOrder() {
			return searchOrder;
		}
		public void setSearchOrder(String searchOrder) {
			this.searchOrder = searchOrder;
		}
		
		public List<String> getSearchNum() {
			return searchNum;
		}
		public void setSearchNum(List<String> searchNum) {
			this.searchNum = searchNum;
		}
		public String getSearchExcel() {
			return searchExcel;
		}
		public void setSearchExcel(String searchExcel) {
			this.searchExcel = searchExcel;
		}	
		
		
		public String getSearchExcelDownName() {
			return searchExcelDownName;
		}
		public void setSearchExcelDownName(String searchExcelDownName) {
			this.searchExcelDownName = searchExcelDownName;
		}	
		
		
		public int getFlag() {
			return flag;
		}
		public void setFlag(int flag) {
			this.flag = flag;
		}			
		
		public int getSms_remote_num() {
			return sms_remote_num;
		}
		public void setSms_remote_num(int sms_remote_num) {
			this.sms_remote_num = sms_remote_num;
		}	
		
		public String getSms_remote_phone() {
			return sms_remote_phone;
		}
		public void setSms_remote_phone(String sms_remote_phone) {
			this.sms_remote_phone = sms_remote_phone;
		}	
		public String getSms_remote_msg() {
			return sms_remote_msg;
		}
		public void setSms_remote_msg(String sms_remote_msg) {
			this.sms_remote_msg = sms_remote_msg;
		}	
		
		

		
		
				
	private String excel_num; /* 엑셀번호*/
	private String excel_kind; /* 엑셀분류 */
	
	private int cus_idx; /* 명함 - 인덱스*/
	private String name_ko; /* 명함 - 이름 */
	private String tel_no;  /* 명함 - 전화번호 */
	private String phone_no; /* 명함 - 휴대전화 */
	private String email; /* 명함 - 이메일 */
	private String manager_id; /* 명함 - 담당자아이디 */
	private String newsletter; /* 명함 - 뉴스레터 여부*/
	private String country; /* 명함 - 내국인 여부*/
	private String country_name; /* 명함 - 내국인 여부*/
	private String reg_name; /* 조인 - 명함 - 담당자 이름*/
	private String oraganizer_name; /* 조인 - 명함 - 소속 여러개 - 조인해서 가져옴*/
	private String expire_date; /* 날짜 */
	private String position; /* 직함 */
	private String zip_code; /* 우편번호 */
	private String address_ko; /* 한글주소  */
	private String address_en; /* 영문주소  */
	private String etc; /* 비고  */
	private String sosoc_excel; /* 소속-엑셀  */
	private String department; /* 부서  */
	

	private int org_idx; /* 기관단체 - 인덱스*/
	private String org_city; /* 기관단체 - 도시*/
	private String org_type_name; /* 조인 - 기관단체 - 구분(공공기관, 기업체, 정부/지자체, 학회, 개인, 협회, 학교, 비영리단체) */

	private String org_zip_code; 
	private String org_address_ko; 
	private String org_address_ko_full; 

	
	private int event_idx; /* 대관신청 - 인덱스*/
	private String event_name; /* 대관신청 - 행사명*/
	private String event_staff_id; /* 대관신청 - 유치담당자 아이디  */
	private String event_staff_name; /* 대관신청 - 유치담당자 이름  */
	private int event_grant_cost; /* 대관신청 - 유치지원금  */
	private String event_st_date; /* 대관신청 - 행사시작일  */
	private String event_ed_date; /* 대관신청 - 행사종료일  */
	private String event_theme;	  /* 대관신청 - 행사주제  */
	private String event_theme_name;	  /* 대관신청 - 행사주제  */
	private List<String> eventSubContList = null;

	
	
	public String getExcel_num() {
		return excel_num;
	}
	public void setExcel_num(String excel_num) {
		this.excel_num = excel_num;
	}	
	

	public String getExcel_kind() {
		return excel_kind;
	}
	public void setExcel_kind(String excel_kind) {
		this.excel_kind = excel_kind;
	}	

	
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	
	
	public int getCus_idx() {
		return cus_idx;
	}
	public void setCus_idx(int cus_idx) {
		this.cus_idx = cus_idx;
	}
	public String getName_ko() {
		return name_ko;
	}
	public void setName_ko(String name_ko) {
		this.name_ko = name_ko;
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
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
	public String getCountry_name() {
		return country_name;
	}
	public void setNative_chk(String country_name) {
		this.country_name = country_name;
	}	
	public String getReg_name() {
		return reg_name;
	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	public String getOraganizer_name() {
		return oraganizer_name;
	}
	public void setOraganizer_name(String oraganizer_name) {
		this.oraganizer_name = oraganizer_name;
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
		this.address_ko = address_ko;
	}	
	
	public String getAddress_en() {
		return address_en;
	}
	public void setAddress_en(String address_en) {
		this.address_en = address_en;
	}	
	
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
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
	
	
	
	
	
	
	public int getOrg_idx() {
		return org_idx;
	}
	public void setOrg_idx(int org_idx) {
		this.org_idx = org_idx;
	}
	public String getOrg_city() {
		return org_city;
	}
	public void setOrg_city(String org_city) {
		this.org_city = org_city;
	}
	public String getOrg_type_name() {
		return org_type_name;
	}
	public void setOrg_type_name(String org_type_name) {
		this.org_type_name = org_type_name;
	}
	

	public String getOrg_zip_code() {
		return org_zip_code;
	}
	public void setOrg_zip_code(String org_zip_code) {
		this.org_zip_code = org_zip_code;
	}

	public String getOrg_address_ko() {
		return org_address_ko;
	}
	public void setOrg_address_ko(String org_address_ko) {
		this.org_address_ko = org_address_ko;
	}
	
	

	public String getOrg_address_ko_full() {
		return org_address_ko_full;
	}
	public void setOrg_address_ko_full(String org_address_ko_full) {
		this.org_address_ko_full = org_address_ko_full;
	}
	
	
	
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_staff_id() {
		return event_staff_id;
	}
	public void setEvent_staff_id(String event_staff_id) {
		this.event_staff_id = event_staff_id;
	}
	public String getEvent_staff_name() {
		return event_staff_name;
	}
	public void setEvent_staff_name(String event_staff_name) {
		this.event_staff_name = event_staff_name;
	}
	public int getEvent_grant_cost() {
		return event_grant_cost;
	}
	public void setEvent_grant_cost(int event_grant_cost) {
		this.event_grant_cost = event_grant_cost;
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
	
	public String getEvent_theme() {
		return event_theme;
	}
	public void setEvent_theme(String event_theme) {
		this.event_theme = event_theme;
	}

	public String getEvent_theme_name() {
		return event_theme_name;
	}
	public void setEvent_theme_name(String event_theme_name) {
		this.event_theme_name = event_theme_name;
	}

	public List getEventSubContList() {
		return eventSubContList;
	}
	public void setEventSubContList(List eventSubContList) {
		this.eventSubContList = eventSubContList;
	}


	
	
	
	
	
	
}
