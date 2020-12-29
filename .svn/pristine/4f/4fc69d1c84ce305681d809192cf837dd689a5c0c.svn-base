package com.mice.hico.contact.service;

public class Contact {
	public int idx = -1;
	public String manager_email = "";
	public String requester_email = ""; 
	public String comment = "";
	public String confirm_id = "";
	public String confirm_status = "";
	public String confirm_date = "";
	public String reg_date = "";
	public String expire_id = "";
	public String expire_date = "";
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		try
		{
			this.manager_email = com.mice.common.encrypt.AESGenerator.encrypt(manager_email);
		}catch(Exception ex){
			this.manager_email = manager_email;
		}
	}
	public String getRequester_email() {
		return requester_email;
	}
	public void setRequester_email(String requester_email) {
		try
		{
			this.requester_email = com.mice.common.encrypt.AESGenerator.encrypt(requester_email);
		}catch(Exception ex){
			this.requester_email = requester_email;
		}
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getConfirm_id() {
		return confirm_id;
	}
	public void setConfirm_id(String confirm_id) {
		this.confirm_id = confirm_id;
	}
	public String getConfirm_status() {
		return confirm_status;
	}
	public void setConfirm_status(String confirm_status) {
		this.confirm_status = confirm_status;
	}
	public String getConfirm_date() {
		return confirm_date;
	}
	public void setConfirm_date(String confirm_date) {
		this.confirm_date = confirm_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getExpire_id() {
		return expire_id;
	}
	public void setExpire_id(String expire_id) {
		this.expire_id = expire_id;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
}
