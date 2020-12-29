package com.mice.hico.contact.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mice.hico.contact.service.ContactVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("ContactDAO")
public class ContactDAO  extends EgovComAbstractDAO  {
	
	public void deleteContact(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("ContactDAO.delete", vo);
	}

	
	public void updateContact(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("ContactDAO.update", vo);
	}

	
	public ContactVO selectContact(int idx) throws Exception {
		// TODO Auto-generated method stub
		return (ContactVO)select("ContactDAO.select", idx);
	}

	
	public List<ContactVO> listContact(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<ContactVO>)list("ContactDAO.list", vo);
	}

	
	public int listCnt(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int)select("ContactDAO.listCount",vo);
	}
}
