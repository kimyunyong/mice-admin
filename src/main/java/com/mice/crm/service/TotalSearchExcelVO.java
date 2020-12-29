package com.mice.crm.service;

import java.util.List;

public class TotalSearchExcelVO{
	
	private int 	idx; /* 파일 인덱스 */
	private String type; /* 파일 형태 */
	private int 	search_cnt; /* 엑셀 파일 갯수 */
	private String  search_params; /* 엑셀 파라미터 */
	private String  search_title; /* 엑셀 파일 제목 */
	private String file_id; /* 엑셀 파일이름 */
	private String file_path; /* 파일 경로 */
	private String file_name; /* 파일 이름 */
	private int file_size = 0; /* 파일 사이즈 */
	private String reg_id; /* 엑셀 파일이름 */
	private String reg_date; /* 엑셀 파일이름 */

	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	

	public int getSearch_cnt() {
		return search_cnt;
	}
	public void setSearch_cnt(int search_cnt) {
		this.search_cnt = search_cnt;
	}
	
	public String getSearch_params() {
		return search_params;
	}
	public void setSearch_params(String search_params) {
		this.search_params = search_params;
	}
	public String getSearch_title() {
		return search_title;
	}
	public void setSearch_title(String search_title) {
		this.search_title = search_title;
	}
	
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
		
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}	
	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}	

	
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size2) {
		this.file_size = file_size2;
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
	
	
}
