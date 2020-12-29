package com.mice.crm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.crm.service.CRMCodeExt;
import com.mice.crm.service.CRMCodeExtVO;
import com.mice.crm.service.CRMService;
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
import com.mice.crm.service.KMSSearchVO;
import com.mice.crm.service.PromotionAttachFile;
import com.mice.crm.service.PromotionAttachFileVO;
import com.mice.crm.service.PromotionVO;
import com.mice.crm.service.EventPlusVO;
import com.mice.crm.service.EventThemeVO;

import java.util.Map;

import com.mice.crm.service.Organizer;
import com.mice.crm.service.OrganizerVO;
import com.mice.crm.service.Promotion;
import com.sun.star.ucb.ListEvent;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("CRMService")
public class CRMServiceImpl extends EgovAbstractServiceImpl implements CRMService{

	@Resource(name = "CRMDAO")
	CRMDAO dao;
	
	@Resource(name = "KMSDAO")
	KMSDAO kmsDao;
		
	@Override
	public void insertOrganizerTheme(OrganizerVO vo) {
		dao.insertOrganizerTheme(vo);
	}

	@Override
	public void deleteOrganizerTheme(OrganizerVO vo) {
		dao.deleteOrganizerTheme(vo);
	}
	
	
	
	@Override
	public void insertEventPlus(EventPlusVO vo) {
		dao.insertEventPlus(vo);
	}

	@Override
	public void deleteEventPlus(EventPlusVO vo) {
		dao.deleteEventPlus(vo);
	}

	@Override
	public List<EventPlusVO> listEventPlus(EventPlusVO vo) {
		return dao.listEventPlus(vo);
	}

	
	@Override
	public void insertEventTheme(EventThemeVO vo) {
		dao.insertEventTheme(vo);
	}

	@Override
	public void deleteEventTheme(EventThemeVO vo) {
		dao.deleteEventTheme(vo);
	}

	@Override
	public List<EventThemeVO> listEventTheme(EventThemeVO vo) {
		return dao.listEventTheme(vo);
	}
	
	
	
	
	
	@Override
	public int insertCustomer(CustomerVO vo) {
		return dao.insertCustomer(vo);
	}

	@Override
	public void insertEvent(Event vo) {
		dao.insertEvent(vo);
	}


	@Override
	public void insertEventAttachFile(EventAttachFile vo) {
		dao.insertEventAttachFile(vo);
	}

	@Override
	public void insertPromotion(Promotion vo) {
		dao.insertPromotion(vo);
	}

	@Override
	public void insertRememberInfo(CustomerVO vo) {
		dao.insertRememberInfo(vo);
	}
	
	
	
	
	@Override
	public void updateCustomer(CustomerVO vo) {
		dao.updateCustomer(vo);
	}
	
	@Override
	public void updateCustomerRemember(CustomerVO vo) {
		dao.updateCustomerRemember(vo);
	}
	
	@Override
	public void updateEvent(Event vo) {
		dao.updateEvent(vo);
	}

	@Override
	public void updateEventAttachFile(EventAttachFile vo) {
		dao.updateEventAttachFile(vo);
	}

	@Override
	public void updateOrganizer(OrganizerVO vo) {
		dao.updateOrganizer(vo);
	}

	@Override
	public void updateOrganizerGrade(OrganizerVO vo) {
		dao.updateOrganizerGrade(vo);
	}
	
	@Override
	public void updatePromotion(Promotion vo) {
		dao.updatePromotion(vo);
	}

	
	
	
	
	
	
	@Override
	public Customer selectCustomer(int idx) {
		return dao.selectCustomer(idx);
	}

	@Override
	public int selectCustomerCheck(CustomerVO vo) {
		return dao.selectCustomerCheck(vo);
	}
	

	@Override
	public String selectCustomerManager_id(CustomerVO vo) {
		return dao.selectCustomerManager_id(vo);
	}
	
	
	@Override
	public Event selectEvent(int idx) {
		return dao.selectEvent(idx);
	}

	@Override
	public Organizer selectOrganizer(int idx) {
		return dao.selectOrganizer(idx);
	}

	@Override
	public Promotion selectPromotion(int idx) {
		return dao.selectPromotion(idx);
	}

	@Override
	public List<PromotionVO> listPromotion(PromotionVO vo) {
		return dao.listPromotion(vo);
	}

	@Override
	public List<Customer> listCustomer(CustomerVO vo) {
		return dao.listCustomer(vo);
	}

	
	
	@Override
	public List<EventAttachFile> listEventAttachFile(EventVO vo) {
		return dao.listEventAttachFile(vo);
	}

	@Override
	public List<Organizer> listOrganizer(OrganizerVO vo) {
		return dao.listOrganizer(vo);
	}

	@Override
	public Map<String, Object> mapCustomer(CustomerVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listCustomer(vo));
		map.put("resultListCount", dao.listCustomerCount(vo));
		return map;
	}
	
	

	@Override
	public Map<String, Object> mapEvent(EventVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<EventVO> levo = dao.listEvent(vo);	// 이벤트 리스트를 가져온다.
		for(int i=0;i<levo.size();i++){
			HashMap mapp = new HashMap();
			if(levo.get(i).getRent_facility_text() != null && levo.get(i).getRent_facility_text().length() > 0){
				try{
				String[] spl = levo.get(i).getRent_facility_text().split(",");		// 대관시설의 idx(FK)가 , 형태로 들어가 있다. 이것을 잘라서 배열에 넣는다.
				List arrlist = new ArrayList();
				for(int j=0;j<spl.length;j++){
					arrlist.add(spl[j]);
				}
				
				mapp.put("idxList", arrlist);		// 잘라낸 대관시설 인덱스를 각각 List에 넣고 이 List를 Map에 넣는다.
				}catch(Exception ex){
					System.out.println(ex.getMessage());
				}
				try{
					levo.get(i).setFacility_text_description(getFacilities_Description(mapp));	
				}catch(Exception ex){
					System.out.println(ex.getMessage());
				}
			}
		}
		
		map.put("resultList", levo);
		map.put("resultListCount", dao.listEventCount(vo));
		return map;
	}

	private String getFacilities_Description(HashMap map){
		List<CodeVO> list = dao.selectListCode(map);
		
		HashMap codeMap = new HashMap();
		
		String strValue1 = "";
		String strValue2 = "";
		String strValue3 = "";
		String strValue4 = "";
		
		for (int i = 0; i < list.size(); i++) {
			switch (list.get(i).getType()) {
			case "1층" :
				if (!"".equals(strValue1)) {
					strValue1 += ", ";
				}
				strValue1 += list.get(i).getValue();
				break;
			case "2층" :
				if (!"".equals(strValue2)) {
					strValue2 += ", ";
				}
				strValue2 += list.get(i).getValue();
				break;
			case "3층" :
				if (!"".equals(strValue3)) {
					strValue3 += ", ";
				}
				strValue3 += list.get(i).getValue();
				break;
			case "기타" :
				if (!"".equals(strValue4)) {
					strValue4 += ", ";
				}
				strValue4 += list.get(i).getValue();
				break;
			}
		}
		
		return (strValue1.length() > 0 ? (strValue1 + "\n") : "")  
				+ (strValue2.length() > 0 ? (strValue2 + "\n") : "")
				+ (strValue3.length() > 0 ? (strValue3 + "\n") : "")
				+ (strValue4.length() > 0 ? (strValue4 + "\n") : "");
	}
	@Override
	public Map<String, Object> mapOrganizer(OrganizerVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listOrganizer(vo));
		map.put("resultListCount", dao.listOrganizerCount(vo));
		return map;
	}

	@Override
	public Map<String, Object> mapPromotion(PromotionVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.listPromotion(vo));
		map.put("resultListCount", dao.listPromotionCount(vo));
		return map;
	}

	@Override
	public void deleteCustomer(CustomerVO vo) {
		dao.deleteCustomer(vo);
	}

	@Override
	public void deleteOrganizer(OrganizerVO vo){
		dao.deleteOrganizer(vo);
	}

	@Override
	public int insertOrganizer(OrganizerVO vo) {
		// TODO Auto-generated method stub
		return dao.insertOrganizer(vo);
	}

	@Override
	public void insertCode(CodeVO vo) {
		int team_idx = dao.insertCode(vo);
		
		if(vo.getType().equals("팀")){
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			KMSSearchVO kmsVO = new KMSSearchVO();
			kmsVO.setTeam_idx(String.valueOf(team_idx));
			kmsVO.setReg_id(user.getId());
			kmsVO.setTeam_name(vo.getValue());
			
			kmsDao.insertCommonFolder(kmsVO);
			kmsDao.insertTeam(kmsVO);
		}
	}

	@Override
	public void updateCode(CodeVO vo) {
		// TODO Auto-generated method stub
		dao.updateCode(vo);
//		dao.updatePlace(vo);
		
		if(vo.getType().equals("팀")){
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			KMSSearchVO kmsVO = new KMSSearchVO();
			kmsVO.setTeam_idx(String.valueOf(vo.getIdx()));
			kmsVO.setReg_id(user.getId());
			kmsVO.setTeam_name(vo.getValue());
			
			kmsDao.updateTeamName(kmsVO);
		}
	}

	@Override
	public void updateCodeSortedNo(CodeVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCode(CodeVO vo) {
		// TODO Auto-generated method stub
		dao.deleteCode(vo);
	}

	@Override
	public List<CodeVO> listCodeType() {
		// TODO Auto-generated method stub
		return dao.listCodeType();
	}

	@Override
	public List<CodeVO> listCode(CodeVO vo) {
		// TODO Auto-generated method stub
		return dao.listCode(vo);
	}

	@Override
	public int selectCodeSeq(CodeVO vo) {
		// TODO Auto-generated method stub
		return dao.selectCodeSeq(vo);
	}

	@Override
	public void insertCustomerNOrganizer(CustomerOrganizerRelationVO vo) {
		// TODO Auto-generated method stub
		dao.insertCustomerNOrganizer(vo);
	}

	@Override
	public void deleteCustomerNOrganizer(CustomerOrganizerRelationVO vo) {
		// TODO Auto-generated method stub
		dao.deleteCustomerNOrganizer(vo);
	}

	@Override
	public List<CustomerOrganizerRelationVO> listCustomerRelation(int customer_idx) {
		// TODO Auto-generated method stub
		return dao.listCustomerRelation(customer_idx);
	}

	@Override
	public List<CustomerOrganizerRelationVO> listOrganizerRelation(int organizer_idx){
		return dao.listOrganizerRelation(organizer_idx);
	}
	
	@Override
	public CustomerOrganizerRelationVO selectCustomerRelation(
			CustomerOrganizerRelationVO vo) {
		
		return dao.selectCustomerRelation(vo);
	}

	@Override
	public void updateCustomerNOrganizer(CustomerOrganizerRelationVO vo) {
		dao.updateCustomerNOrganizer(vo);
	}

	@Override
	public List<CustomerVO> listOrganizerRelationCustomer(int organizer_idx) {
		return dao.listOrganizerRelationCustomer(organizer_idx);
	}

	@Override
	public List<EventVO> listEventOrganizerRelation(int organizer_idx) {
		return dao.listEventOrganizerRelation(organizer_idx);
	}//////
	
	@Override
	public List<CodeVO> listCodeFacility() {
		return dao.listCodeFacility();
	}
	
	@Override
	public List<CodeVO> selectListCode(HashMap map) {
		return dao.selectListCode(map);
	}

	
	
	@Override
	public List<EventVO> listEvent(EventVO vo) {
		
		return dao.listEvent(vo);
	}

	@Override
	public void deleteEvent(EventVO vo) {
		dao.deleteEvent(vo);
	}

	@Override
	public void deletePromotion(PromotionVO vo) {
		// TODO Auto-generated method stub
		dao.deletePromotion(vo);
	}

	@Override
	public List<PromotionVO> listEventRelationPromotion(PromotionVO vo) {
		// TODO Auto-generated method stub
		return dao.listEventRelationPromotion(vo);
	}

	@Override
	public void insertPromotionAttachFile(PromotionAttachFile file) {
		dao.insertPromotionAttachFile(file);
	}

	@Override
	public void deletePromotionAttachFile(String file_id) {
		dao.deletePromotionAttachFile(file_id);
	}

	@Override
	public List<PromotionAttachFileVO> listPromotionAttachFile(int promotion_idx) {
		return dao.listPromotionAttachFile(promotion_idx);
	}

	@Override
	public void deleteEventAttachFile(int idx) {
		// TODO Auto-generated method stub
		dao.deleteEventAttachFile(idx);
	}

	@Override
	public List<EventCalendarVO> listCalendar(EventCalendarVO vo) {
		return dao.listCalendar(vo);
	}

	@Override
	public List<OrganizerVO> searchOrganizer(String name) {
		// TODO Auto-generated method stub
		return dao.searchOrganizer(name);
	}

	@Override
	public CRMStastics selectStatistics(CRMStasticsVO vo) {

		return dao.selectStatistics(vo);
	}

	@Override
	public List<CRMCodeExt> listCodeExt(CRMCodeExtVO vo) {
		// TODO Auto-generated method stub
		return dao.listCodeExt(vo);
	}

	@Override
	public List<EventVO> listSummary(EventVO vo) {
		// TODO Auto-generated method stub
		return dao.listSummary(vo);
	}

	@Override
	public long selectAreaCalculator(int parent_idx) {
		// TODO Auto-generated method stub
		return dao.selectAreaCalculator(parent_idx);
	}

	@Override
	public long selectCostCalculator(int parent_idx) {
		// TODO Auto-generated method stub
		return dao.selectCostCalculator(parent_idx);
	}

	@Override
	public EventVO selectSummary(EventVO vo) {
		// TODO Auto-generated method stub
		return dao.selectSummary(vo);
	}

	@Override
	public List<EventVO> listXlsEvent(EventVO vo) {
		// TODO Auto-generated method stub
		return dao.listXlsEvent(vo);
	}

	@Override
	public int getCodeFacilityTotalCount() {

		return dao.getCodeFacilityTotalCount();
	}

}
