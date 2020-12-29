package com.mice.crm.service;

public class KMSLogVO {
	private int log_idx;
	private String download_id;
	private String download_date;
	private String atchFileId;
	private String checkedIdForFileId;
	
	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getCheckedIdForFileId() {
		return checkedIdForFileId;
	}

	public void setCheckedIdForFileId(String checkedIdForFileId) {
		this.checkedIdForFileId = checkedIdForFileId;
	}

	public int getLog_idx() {
		return log_idx;
	}

	public void setLog_idx(int log_idx) {
		this.log_idx = log_idx;
	}

	public String getDownload_id() {
		return download_id;
	}

	public void setDownload_id(String download_id) {
		this.download_id = download_id;
	}

	public String getDownload_date() {
		return download_date;
	}

	public void setDownload_date(String download_date) {
		this.download_date = download_date;
	}
}