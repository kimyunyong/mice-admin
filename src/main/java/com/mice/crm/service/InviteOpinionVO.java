package com.mice.crm.service;

public class InviteOpinionVO {
	private int idx;
	private int parent_idx;
	private String customer_idx;
	private String promotion_type;
	private String comment;
	private String input_date;
	private String reg_id;
	private String reg_date;
	private String opinion_type;
	
	

	
	@Override
	public String toString() {
		return "InviteOpinionVO [idx=" + idx + ", parent_idx=" + parent_idx + ", promotion_type=" + promotion_type
				+ ", comment=" + comment + ", input_date=" + input_date + ", reg_id=" + reg_id + ", reg_date="
				+ reg_date + ", opinion_type=" + opinion_type + ", customer_idx=" + customer_idx + "]";
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOpinion_type() {
		return opinion_type;
	}
	public void setOpinion_type(String opinion_type) {
		this.opinion_type = opinion_type;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public int getParent_idx() {
		return parent_idx;
	}
	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}
	public String getPromotion_type() {
		return promotion_type;
	}
	public void setPromotion_type(String promotion_type) {
		this.promotion_type = promotion_type;
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

	public String getCustomer_idx() {
		return customer_idx;
	}

	public void setCustomer_idx(String customer_idx) {
		this.customer_idx = customer_idx;
	}
	

	
}
