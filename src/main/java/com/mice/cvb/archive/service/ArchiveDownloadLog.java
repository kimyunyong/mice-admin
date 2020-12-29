package com.mice.cvb.archive.service;

public class ArchiveDownloadLog {

	public int idx = -1;
	public int archive_idx = -1;
	public String purpose_text = "";
	public String reg_date = "";
	public String ip = "";
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getArchive_idx() {
		return archive_idx;
	}
	public void setArchive_idx(int archive_idx) {
		this.archive_idx = archive_idx;
	}
	public String getPurpose_text() {
		return purpose_text;
	}
	public void setPurpose_text(String purpose_text) {
		this.purpose_text = purpose_text;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}

