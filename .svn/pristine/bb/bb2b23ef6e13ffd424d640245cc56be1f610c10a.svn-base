package com.mice.cvb.organizer.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.cvb.organizer.service.OrganizerVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("OrganizerDAO")
public class OrganizerDAO  extends EgovComAbstractDAO  {

	public List<OrganizerVO> list(OrganizerVO vo){
		return (List<OrganizerVO>)list("OrganizerDAO.list", vo);
	}
	
	public int listCount(OrganizerVO vo){
		return (int)select("OrganizerDAO.listCount", vo);
	}
	
	public OrganizerVO info(int idx){
		return (OrganizerVO)select("OrganizerDAO.info", idx);
	}
	
	public void insert(OrganizerVO vo){
		insert("OrganizerDAO.insert", vo);
	}
	
	public void update(OrganizerVO vo){
		update("OrganizerDAO.update", vo);
	}
	
	public void delete(OrganizerVO vo){
		update("OrganizerDAO.delete", vo);
	}
}
