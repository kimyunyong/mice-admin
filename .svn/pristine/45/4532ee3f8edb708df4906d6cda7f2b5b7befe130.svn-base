package com.mice.crm.service;

import java.util.List;

public interface CRMInviteService {
	public void insert(InviteVO vo);
	public void update(InviteVO vo, List<InvitePersonVO> personList);
	public void update(InviteVO vo);
	public void delete(int idx);
	public InviteVO get(int idx);
	public List<InviteVO> getAll(InviteVO vo);
	public int getCount(InviteVO vo);
	public List<CustomerVO> getCustomerList(CustomerVO customerVO);
	public List<CustomerVO> getPersonList(int invite_idx);
	public void deletePerson(int invite_idx);
	public void insertOpinion(InviteOpinionVO opinionVO);
	public int getLastOpinionIdx();
	public List<InvitePersonVO> getOpinionList(InvitePersonVO personVO);
	public void deleteOpinion(int idx);
	public int getLastIndex();
	public List<FileVO> getFile(FileVO fileVO);
	public void deleteFile(String file_id);
	public void deleteAllOpinion(int parent_idx);
	
	public String getCustomerName(int customer_idx);
	public String getOrganizerName(int idx);
	public int getMaxOrganizerIdx();
	
	public void insertPerson(InvitePersonVO personVO);
	public void insertInviteTheme(EventThemeVO tvo);
	public List<EventThemeVO> listInviteTheme(EventThemeVO vo);
	public void deleteInviteTheme(int idx);
	public void insertInviteSupport(InviteSupportVO vo);
	public void deleteInviteSupport(int invite_idx);
	public List<InviteSupportVO> getInviteSupport(InviteSupportVO vo);
}
