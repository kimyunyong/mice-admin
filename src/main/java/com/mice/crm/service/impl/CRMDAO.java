package com.mice.crm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.crm.service.CRMCodeExt;
import com.mice.crm.service.CRMCodeExtVO;
import com.mice.crm.service.CRMStastics;
import com.mice.crm.service.CRMStasticsVO;
import com.mice.crm.service.CodeVO;
import com.mice.crm.service.Customer;
import com.mice.crm.service.CustomerOrganizerRelation;
import com.mice.crm.service.CustomerOrganizerRelationVO;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.Event;
import com.mice.crm.service.EventAttachFile;
import com.mice.crm.service.EventCalendarVO;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.Organizer;
import com.mice.crm.service.Promotion;
import com.mice.crm.service.OrganizerVO;
import com.mice.crm.service.PromotionAttachFile;
import com.mice.crm.service.PromotionAttachFileVO;
import com.mice.crm.service.PromotionVO;
import com.mice.crm.service.EventPlusVO;
import com.mice.crm.service.EventThemeVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("CRMDAO")
public class CRMDAO extends EgovComAbstractDAO {
	
	
	public void insertOrganizerTheme(OrganizerVO vo){
		insert("CRMDAO.insertOrganizerTheme", vo);
	}	
	public void deleteOrganizerTheme(OrganizerVO vo){
		delete("CRMDAO.deleteOrganizerTheme", vo);
	}
	
	
	
	
	
	public void insertEventPlus(EventPlusVO vo){
		insert("CRMDAO.insertEventPlus", vo);
	}	
	public void deleteEventPlus(EventPlusVO vo){
		update("CRMDAO.deleteEventPlus", vo);
	}
	public List<EventPlusVO> listEventPlus(EventPlusVO vo){
		return (List<EventPlusVO>)list("CRMDAO.listEventPlus", vo);
	}	
	
	public void insertEventTheme(EventThemeVO vo){
		insert("CRMDAO.insertEventTheme", vo);
	}	
	public void deleteEventTheme(EventThemeVO vo){
		update("CRMDAO.deleteEventTheme", vo);
	}
	public List<EventThemeVO> listEventTheme(EventThemeVO vo){
		return (List<EventThemeVO>)list("CRMDAO.listEventTheme", vo);
	}	
	

	
	
	
	
	public int insertCustomer(CustomerVO vo){
		return (int)insert("CRMDAO.insertCustomer", vo);
	}
	public void insertEvent(Event vo){
		insert("CRMDAO.insertEvent", vo);
	}
	
	public void insertEventAttachFile(EventAttachFile vo){
		insert("CRMDAO.insertEventAttachFile", vo);
	}
	public int insertOrganizer(Organizer vo){
		return (int)insert("CRMDAO.insertOrganizer", vo);
	}
	public void insertPromotion(Promotion vo){
		insert("CRMDAO.insertPromotion", vo);
	}
	public void insertRememberInfo(CustomerVO vo){
		insert("CRMDAO.insertRememberInfo", vo);
	}
	
	
	
	
	
	public void updateCustomer(CustomerVO vo){
		update("CRMDAO.updateCustomer", vo);
	}
	public void updateCustomerRemember(CustomerVO vo){
		update("CRMDAO.updateCustomerRemember", vo);
	}	
	public void updateEvent(Event vo){
		update("CRMDAO.updateEvent", vo);
	}
	public void updateEventAttachFile(EventAttachFile vo){
		update("CRMDAO.updateEventAttachFile", vo);
	}
	public void updateOrganizer(OrganizerVO vo){
		update("CRMDAO.updateOrganizer", vo);
	}
	public void updateOrganizerGrade(OrganizerVO vo){
		update("CRMDAO.updateOrganizerGrade", vo);
	}
	public void updatePromotion(Promotion vo){
		update("CRMDAO.updatePromotion", vo);
	}
	
	public void deleteCustomer(CustomerVO vo){
		update("CRMDAO.deleteCustomer", vo);
	}
	
	public void deleteOrganizer(OrganizerVO vo){
		update("CRMDAO.deleteOrganizer", vo);
	}
	
	public CustomerVO selectCustomer(int idx){
		return (CustomerVO)select("CRMDAO.selectCustomer", idx);
	}
	
	public int selectCustomerCheck(CustomerVO vo){
		return (int)select("CRMDAO.selectCustomerCheck", vo);
	}
	
	public String selectCustomerManager_id(CustomerVO vo){
		return (String)select("CRMDAO.selectCustomerManager_id", vo);
	}
	
	
	public Event selectEvent(int idx){
		return (Event)select("CRMDAO.selectEvent", idx);
	}
	public Organizer selectOrganizer(int idx){
		return (Organizer)select("CRMDAO.selectOrganizer", idx);
	}
	public Promotion selectPromotion(int idx){
		return (Promotion)select("CRMDAO.selectPromotion", idx);
	}
	
	public List<Customer> listCustomer(CustomerVO vo){
		return (List<Customer>)list("CRMDAO.listCustomer", vo);
	}
	
	public List<EventAttachFile> listEventAttachFile(Event vo){
		return (List<EventAttachFile>)list("CRMDAO.listEventAttachFile", vo);
	}
	public List<Organizer> listOrganizer(OrganizerVO vo){
		return (List<Organizer>)list("CRMDAO.listOrganizer", vo);
	}
	public List<PromotionVO> listPromotion(PromotionVO vo){
		return (List<PromotionVO>)list("CRMDAO.listPromotion", vo);
	}
	
	public int listCustomerCount(CustomerVO vo){
		return (int)select("CRMDAO.listCustomerCount", vo);
	}
	
	public int listOrganizerCount(OrganizerVO vo){
		return (int)select("CRMDAO.listOrganizerCount", vo);
	}
	
	public List<EventVO> listEvent(EventVO vo) {
		return (List<EventVO>)list("CRMDAO.listEvent", vo);
	}

	public int listEventCount(EventVO vo){
		return (int)select("CRMDAO.listEventCount", vo);
	}
	
	public int listPromotionCount(PromotionVO vo){
		return (int)select("CRMDAO.listPromotionCount", vo);
	}
	
	public List<CodeVO> listCodeType(){
		return (List<CodeVO>)list("CRMDAO.listCodeType", null);
	}

	public List<CodeVO> listCode(CodeVO vo){
		return (List<CodeVO>)list("CRMDAO.listCode", vo);
	}
	public int insertCode(CodeVO vo){
		vo.setSorted_no(selectCodeSeq(vo));
		return (int) insert("CRMDAO.insertCode", vo);
	}

	public void updateCodeSortedNo(CodeVO vo){
		update("CRMDAO.updateCodeSortedNo", vo);
	}
	
	public void updateCode(CodeVO vo){
		update("CRMDAO.updateCode", vo);
	}
	
	public void deleteCode(CodeVO vo){
		delete("CRMDAO.deleteCode", vo);
	}
	
	public int selectCodeSeq(CodeVO vo){
		return (int)select("CRMDAO.selectCodeSeq", vo);
	}

	public void insertCustomerNOrganizer(CustomerOrganizerRelationVO vo) {
		// TODO Auto-generated method stub
		insert("CRMDAO.insertCustomerNOrganizer", vo);
	}

	
	public void deleteCustomerNOrganizer(CustomerOrganizerRelationVO vo) {
		// TODO Auto-generated method stub
		delete("CRMDAO.deleteCustomerNOrganizer", vo);
	}

	public List<CustomerOrganizerRelationVO> listCustomerRelation(int customer_idx) {
		// TODO Auto-generated method stub
		return (List<CustomerOrganizerRelationVO>)list("CRMDAO.listCustomerNOrganizer", customer_idx);
	}
	
	public List<CustomerOrganizerRelationVO> listOrganizerRelation(int organizer_idx){
		return (List<CustomerOrganizerRelationVO>)list("CRMDAO.listOrganizerNCustomer", organizer_idx);
	}
	
	public CustomerOrganizerRelationVO selectCustomerRelation(
			CustomerOrganizerRelationVO vo) {
		
		return (CustomerOrganizerRelationVO)select("CRMDAO.selectCustomerNOrganizer", vo);
	}
	
	public void updateCustomerNOrganizer(CustomerOrganizerRelationVO vo) {
		update("CRMDAO.updateCustomerNOrganizer", vo);
	}
	
	public List<CustomerVO> listOrganizerRelationCustomer(int organizer_idx) {
		// TODO Auto-generated method stub
		return (List<CustomerVO>)list("CRMDAO.listOrganizerRelationCustomer", organizer_idx);
	}
	
	public List<EventVO> listEventOrganizerRelation(int organizer_idx) {
		return (List<EventVO>)list("CRMDAO.selectEventRelationOrganizer", organizer_idx);
	}
	
	public List<CodeVO> listCodeFacility() {
		return (List<CodeVO>)list("CRMDAO.listCodeFacility", null);
	}

	public List<CodeVO> selectListCode(HashMap map) {
		return (List<CodeVO>)list("CRMDAO.selectListCode", map);
	}
	
	public void deleteEvent(EventVO vo) {
		update("CRMDAO.deleteEvent", vo);
	}
	
	public void deletePromotion(PromotionVO vo) {
		update("CRMDAO.deletePromotion", vo);
	}
	
	public List<PromotionVO> listEventRelationPromotion(PromotionVO vo) {
		return (List<PromotionVO>)list("CRMDAO.listEventRelationPromotion", vo);
	}
	
	public void insertPromotionAttachFile(PromotionAttachFile file) {
		insert("CRMDAO.insertPromotionAttachFile", file);
	}

	public void deletePromotionAttachFile(String file_id) {
		delete("CRMDAO.deletePromotionAttachFile", file_id);
	}
	
	public List<PromotionAttachFileVO> listPromotionAttachFile(int promotion_idx){
		return (List<PromotionAttachFileVO>)list("CRMDAO.listPromotionAttachFile", promotion_idx);
	}
	
	public void deleteEventAttachFile(int idx) {
		// TODO Auto-generated method stub
		delete("CRMDAO.deleteEventAttachFile",idx);
	}
	
	public List<EventCalendarVO> listCalendar(EventCalendarVO vo) {
		return (List<EventCalendarVO>)list("CRMDAO.listCalendar", vo);
	}
	
	public List<OrganizerVO> searchOrganizer(String name) {
		// TODO Auto-generated method stub
		return (List<OrganizerVO>)list("CRMDAO.searchOrganizer", name);
	}
	
	public CRMStastics selectStatistics(CRMStasticsVO vo) {

		return (CRMStastics)select("CRMDAO.selectStatistics", vo);
	}
	
	public List<CRMCodeExt> listCodeExt(CRMCodeExtVO vo) {
		// TODO Auto-generated method stub
		return (List<CRMCodeExt>)list("CRMDAO.listCodeExt", vo);
	}
	
	public List<EventVO> listSummary(EventVO vo) {
		return (List<EventVO>)list("CRMDAO.listSummary",vo);
	}
	
	
	public long selectAreaCalculator(int parent_idx) {
		return (long)select("CRMDAO.selectAreaCalculator", parent_idx);
	}
	
	public long selectCostCalculator(int parent_idx) {
		return (long)select("CRMDAO.selectCostCalculator", parent_idx);
	}
	
	public EventVO selectSummary(EventVO vo) {
		return (EventVO)select("CRMDAO.selectSummary", vo);
	}
	
	public List<EventVO> listXlsEvent(EventVO vo){
		return (List<EventVO>)list("CRMDAO.listXlsEvent", vo);
	}
	
	public int getCodeFacilityTotalCount() {
		return (int)select("CRMDAO.selectCodeFacilityTotalCount");
	}
	
	public String getWrite_condition_tf(int idx){
		return (String)select("CRMEventOrderDAO.getWrite_condition_tf", idx);
	}
}
