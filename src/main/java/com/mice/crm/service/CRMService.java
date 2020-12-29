package com.mice.crm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CRMService {
	
	
	public void insertOrganizerTheme(OrganizerVO vo);
	public void deleteOrganizerTheme(OrganizerVO vo);
	
	
	
	public void insertEventPlus(EventPlusVO vo);
	public void deleteEventPlus(EventPlusVO evo);
	public List<EventPlusVO> listEventPlus(EventPlusVO vo);
	
	public void insertEventTheme(EventThemeVO vo);
	public void deleteEventTheme(EventThemeVO evo);
	public List<EventThemeVO> listEventTheme(EventThemeVO vo);
	
	
	public int insertCustomer(CustomerVO vo);
	public void insertEvent(Event vo);
	public void insertEventAttachFile(EventAttachFile vo);
	public int insertOrganizer(OrganizerVO vo);
	public void insertPromotion(Promotion vo);
	public void insertCode(CodeVO vo);
	public void insertCustomerNOrganizer(CustomerOrganizerRelationVO vo);
	public void insertPromotionAttachFile(PromotionAttachFile file);
	public void insertRememberInfo(CustomerVO vo);
	
	public void updateCustomer(CustomerVO vo);
	public void updateCustomerRemember(CustomerVO vo);
	public void updateEvent(Event vo);
	public void updateEventAttachFile(EventAttachFile vo);
	public void updateOrganizer(OrganizerVO vo);
	public void updateOrganizerGrade(OrganizerVO vo);
	public void updatePromotion(Promotion vo);
	public void updateCode(CodeVO vo);
	public void updateCodeSortedNo(CodeVO vo);
	public void updateCustomerNOrganizer(CustomerOrganizerRelationVO vo);
	
	public void deleteCustomer(CustomerVO vo);
	public void deleteOrganizer(OrganizerVO vo);
	public void deleteCode(CodeVO vo);
	public void deleteCustomerNOrganizer(CustomerOrganizerRelationVO idx);
	public void deleteEvent(EventVO vo);
	public void deletePromotion(PromotionVO vo);
	public void deletePromotionAttachFile(String idx);
	public void deleteEventAttachFile(int idx);
	
	public Customer selectCustomer(int idx);
	public int selectCustomerCheck(CustomerVO vo);
	public String selectCustomerManager_id(CustomerVO vo);
	
	public Event selectEvent(int idx);
	public Organizer selectOrganizer(int idx);
	public Promotion selectPromotion(int idx);
	public int selectCodeSeq(CodeVO vo);
	public CustomerOrganizerRelationVO selectCustomerRelation(CustomerOrganizerRelationVO vo);
	public CRMStastics selectStatistics(CRMStasticsVO vo);
	
	public List<Customer> listCustomer(CustomerVO vo);
	public List<EventVO> listEvent(EventVO vo);
	
	public List<EventAttachFile> listEventAttachFile(EventVO vo);
	public List<Organizer> listOrganizer(OrganizerVO vo);
	public List<PromotionVO> listPromotion(PromotionVO vo);
	public List<PromotionVO> listEventRelationPromotion(PromotionVO vo);
	public List<CustomerOrganizerRelationVO> listCustomerRelation(int customer_idx);
	public List<CustomerVO> listOrganizerRelationCustomer(int organizer_idx);
	public List<CustomerOrganizerRelationVO> listOrganizerRelation(int organizer_idx);
	public List<EventVO> listEventOrganizerRelation(int organizer_idx);//
	public List<PromotionAttachFileVO> listPromotionAttachFile(int promotion_idx);
	public List<EventCalendarVO> listCalendar(EventCalendarVO vo);
	
	public List<CodeVO> listCodeType();
	public List<CodeVO> listCode(CodeVO vo);
	public List<CodeVO> listCodeFacility();
	public List<CodeVO> selectListCode(HashMap map);
	public int getCodeFacilityTotalCount();
	
	public List<CRMCodeExt> listCodeExt(CRMCodeExtVO vo);
	public List<EventVO> listSummary(EventVO vo);
	public List<EventVO> listXlsEvent(EventVO vo);
	
	public Map<String, Object> mapCustomer(CustomerVO vo);
	public Map<String, Object> mapEvent(EventVO vo);
	public Map<String, Object> mapOrganizer(OrganizerVO vo);
	public Map<String, Object> mapPromotion(PromotionVO vo);
	
	public List<OrganizerVO> searchOrganizer(String name);
	
	public EventVO selectSummary(EventVO vo);
	public long selectAreaCalculator(int parent_idx);
	public long selectCostCalculator(int parent_idx);
	
}
