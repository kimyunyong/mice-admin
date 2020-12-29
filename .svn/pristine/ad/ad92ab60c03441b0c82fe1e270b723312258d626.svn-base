package com.mice.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.crm.service.CRMInviteService;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.EventThemeVO;
import com.mice.crm.service.FileVO;
import com.mice.crm.service.InviteOpinionVO;
import com.mice.crm.service.InvitePersonVO;
import com.mice.crm.service.InviteSupportVO;
import com.mice.crm.service.InviteVO;

@Service("CRMInviteService")
public class CRMInviteServiceImpl implements CRMInviteService{
	@Resource(name = "CRMInviteDAO")
	CRMInviteDAO dao;
	
	@Override
	public void insert(InviteVO vo) {
		dao.insert(vo);
	}
	
	@Override
	public int getLastIndex(){
		
		return dao.getIndex();
	}
	
	public void insertPerson(InvitePersonVO personVO){
		dao.insertPerson(personVO);
	}

	@Override
	public void update(InviteVO vo, List<InvitePersonVO> personList) {
		dao.deletePerson(vo.getIdx());
		dao.update(vo);
		
		for(InvitePersonVO personVO : personList)
			dao.insertPerson(personVO);
	}

	@Override
	public void delete(int idx) {
		dao.delete(idx);
	}

	@Override
	public InviteVO get(int idx) {
		InviteVO getInvite = dao.get(idx);
		
		getInvite.setPlace_val(dao.getCodeValue(getInvite.getPlace()));
		getInvite.setEvent_division_val(dao.getCodeValue(getInvite.getEvent_division_idx()));
		getInvite.setImplementation_status_val(dao.getCodeValue(getInvite.getImplementation_status()));
		getInvite.setInvite_character_val(dao.getCodeValue(getInvite.getInvite_character()));
		getInvite.setInvite_category_val(dao.getCodeValue(getInvite.getInvite_category()));
		getInvite.setRelation_name_val(dao.getCodeValue(getInvite.getRelation_name()));
		
		return getInvite;
	}

	@Override
	public List<InviteVO> getAll(InviteVO vo) {
		// TODO Auto-generated method stub
		
		List<InviteVO> getAllList = dao.getAll(vo);
		
		for(InviteVO getList : getAllList){
			getList.setPlace_val(dao.getCodeValue(getList.getPlace()));
			getList.setEvent_division_val(dao.getCodeValue(getList.getEvent_division_idx()));
			getList.setImplementation_status_val(dao.getCodeValue(getList.getImplementation_status()));
		}
		
		return getAllList;
	}

	@Override
	public int getCount(InviteVO vo) {
		
		return dao.getCount(vo);
	}

	@Override
	public List<CustomerVO> getCustomerList(CustomerVO customerVO) {

		return dao.getCustomerList(customerVO);
	}

	@Override
	public List<CustomerVO> getPersonList(int invite_idx) {

		return dao.getPsersonList(invite_idx);
	}

	@Override
	public void deletePerson(int invite_idx) {
		dao.deletePerson(invite_idx);
	}

	@Override
	public void insertOpinion(InviteOpinionVO opinionVO) {
		dao.insertOpinion(opinionVO);
	}

	@Override
	public List<InvitePersonVO> getOpinionList(InvitePersonVO personVO) {
		return dao.getOpinionList(personVO);
	}

	@Override
	public void deleteOpinion(int idx) {
		dao.deleteOpinion(idx);
	}
	
	@Override
	public List<FileVO> getFile(FileVO fileVO){
		return dao.getFileList(fileVO);
	}
	
	@Override
	public void deleteFile(String file_id){
		dao.deletePromotionFile(file_id);
		dao.deleteComtNFileDetail(file_id);
		dao.deleteComtNFile(file_id);
	}

	@Override
	public void deleteAllOpinion(int parent_idx) {
		dao.deleteAllOpinion(parent_idx);
	}

	@Override
	public int getLastOpinionIdx() {

		return dao.getLastOpinionIdx();
	}

	@Override
	public String getCustomerName(int customer_idx) {
		
		return dao.getCustomerName(customer_idx);
	}

	@Override
	public String getOrganizerName(int idx) {
		return dao.getOrganizerName(idx);
	}

	@Override
	public int getMaxOrganizerIdx() {

		return dao.getMaxOrganizerIdx();
	}

	@Override
	public void update(InviteVO vo) {
		dao.update(vo);
	}

	@Override
	public void insertInviteTheme(EventThemeVO tvo) {
		dao.insertInviteTheme(tvo);
	}

	@Override
	public List<EventThemeVO> listInviteTheme(EventThemeVO vo) {

		return dao.listInviteTheme(vo);
	}

	@Override
	public void deleteInviteTheme(int idx) {
		dao.deleteInviteTheme(idx);
	}
	
	@Override
	public void insertInviteSupport(InviteSupportVO vo) {
		dao.insertInviteSupport(vo);
	}
	@Override
	public void deleteInviteSupport(int invite_idx) {
		dao.deleteInviteSupport(invite_idx);
	}
	
	@Override
	public List<InviteSupportVO> getInviteSupport(InviteSupportVO vo) {
		return dao.getInviteSupport(vo);
	}
}
