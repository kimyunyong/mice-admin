package com.mice.crm.service;

public class FileVO {
	private int idx;
	private String atch_file_id;
	private int crm_event_idx;
	private String type;
	private String file_stre_cours;
	private String stre_file_nm;
	private String orignl_file_nm;
	private int file_size;
	
	@Override
	public String toString() {
		return "FileVO [idx=" + idx + ", atch_file_id=" + atch_file_id + ", crm_event_idx=" + crm_event_idx + ", type="
				+ type + ", file_stre_cours=" + file_stre_cours + ", orignl_file_nm=" + orignl_file_nm + ", file_size="
				+ file_size + "]";
	}

	public String getAtch_file_id() {
		return atch_file_id;
	}

	public void setAtch_file_id(String atch_file_id) {
		this.atch_file_id = atch_file_id;
	}

	
	public String getFile_stre_cours() {
		return file_stre_cours;
	}

	public void setFile_stre_cours(String file_stre_cours) {
		this.file_stre_cours = file_stre_cours;
	}
	
	
	public String getStre_file_nm() {
		return stre_file_nm;
	}

	public void setStre_file_nm(String stre_file_nm) {
		this.stre_file_nm = stre_file_nm;
	}
	
	

	public String getOrignl_file_nm() {
		return orignl_file_nm;
	}

	public void setOrignl_file_nm(String orignl_file_nm) {
		this.orignl_file_nm = orignl_file_nm;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
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
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
}
