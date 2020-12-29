package com.mice.crm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.EventThemeVO;
import com.mice.crm.service.FileVO;
import com.mice.crm.service.InviteOpinionVO;
import com.mice.crm.service.InvitePersonVO;
import com.mice.crm.service.InviteSupportVO;
import com.mice.crm.service.InviteVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("CRMInviteDAO")
public class CRMInviteDAO extends EgovComAbstractDAO {
	public void insert(InviteVO InviteVO){
		insert("CRMInviteDAO.insertInvite", InviteVO);
	};
	
	public void update(InviteVO vo){
		update("CRMInviteDAO.updateInvite", vo);
	};
	
	public void delete(int idx){
		delete("CRMInviteDAO.deleteInvite", idx);
	};
	
	public InviteVO get(int idx){
		return (InviteVO)select("CRMInviteDAO.getInvite", idx);
	};
	
	public List<InviteVO> getAll(InviteVO vo){
		return (List<InviteVO>)list("CRMInviteDAO.getInviteList", vo);
	};
	
	public String getCodeValue(String codeIndex){
		return (String)select("CRMInviteDAO.getCodeValue", codeIndex);
	}
	
	public int getCount(InviteVO vo){
		return (Integer)select("CRMInviteDAO.getCount", vo);
	}

	public List<CustomerVO> getCustomerList(CustomerVO customerVO) {

		return (List<CustomerVO>)list("CRMInviteDAO.getCustomerList", customerVO);
	}

	public void insertPerson(InvitePersonVO personVO) {
		insert("CRMInviteDAO.insertPerson", personVO);
	};

	public int getIndex() {
		return (Integer)select("CRMInviteDAO.getIndex");
	};
	
	public List<CustomerVO> getPsersonList(int invite_idx){
		return (List<CustomerVO>)list("CRMInviteDAO.getPersonList", invite_idx);
	}
	
	public void deletePerson(int invite_idx){
		delete("CRMInviteDAO.deletePerson", invite_idx);
	}

	public void insertOpinion(InviteOpinionVO opinionVO) {
		System.out.println(opinionVO);
		insert("CRMInviteDAO.insertOpinion", opinionVO);
	}
	
	public List<InvitePersonVO> getOpinionList(InvitePersonVO personVO){
		return (List<InvitePersonVO>)list("CRMInviteDAO.getOpinionList", personVO);
	}

	public void deleteOpinion(int idx) {
		delete("CRMInviteDAO.deleteOpinion", idx);
	}
	
	public void deleteAllOpinion(int parent_idx){
		delete("CRMInviteDAO.deleteAllOpinion", parent_idx);
	}
	
	public void deletePromotionFile(String file_id) {
		delete("CrmInviteDAO.deletePromotionFile", file_id);
	}
	
	public List<FileVO> getFileList(FileVO fileVO){
		return (List<FileVO>)list("CRMInviteDAO.getFile", fileVO);
	}
	
	public void deleteComtNFileDetail(String file_id){
		delete("CRMEventOrderDAO.deleteComtNFileDetail", file_id);
	}
	
	public void deleteComtNFile(String file_id){
		delete("CRMEventOrderDAO.deleteComtNFile", file_id);
	}
	
	public int getLastOpinionIdx() {

		return (Integer)select("CRMInviteDAO.getLastOpinionIdx");
	}

	public String getCustomerName(int customer_idx) {
		return (String)select("CRMInviteDAO.getCustomerName", customer_idx);
	}

	public String getOrganizerName(int idx) {
		return (String)select("CRMInviteDAO.getOrganizerName", idx);
	}

	public int getMaxOrganizerIdx() {
		return (Integer)select("CRMInviteDAO.getMaxOrganizerIdx");
	}

	public void insertInviteTheme(EventThemeVO vo) {
		insert("CRMInviteDAO.insertInviteTheme", vo);
	}
	
	public List<EventThemeVO> listInviteTheme(EventThemeVO vo) {
		return (List<EventThemeVO>)list("CRMInviteDAO.listInviteTheme", vo);
	}

	public void deleteInviteTheme(int idx) {
		delete("CRMInviteDAO.deleteInviteTheme", idx);
	}
	public void insertInviteSupport(InviteSupportVO vo) {
		insert("CRMInviteDAO.insertInviteSupport", vo);
	}
	public void deleteInviteSupport(int invite_idx) {
		delete("CRMInviteDAO.deleteInviteSupport", invite_idx);
	}
	public List<InviteSupportVO> getInviteSupport(InviteSupportVO vo) {
		 
		return (List<InviteSupportVO>)list("CRMInviteDAO.getInviteSupport", vo);
	}
}
