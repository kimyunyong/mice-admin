package com.mice.cvb.lodgment.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mice.cvb.lodgment.service.LodgmentVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("LodgmentDAO")
public class LodgmentDAO  extends EgovComAbstractDAO  {

	public void delete(LodgmentVO vo) {
		// TODO Auto-generated method stub
		delete("LodgmentDAO.delete", vo);
	}


	public void update(LodgmentVO vo) {
		// TODO Auto-generated method stub
		update("LodgmentDAO.update", vo);
	}


	public LodgmentVO select(LodgmentVO vo) {
		// TODO Auto-generated method stub
		return (LodgmentVO)select("LodgmentDAO.info", vo);
	}

	
	public List<LodgmentVO> list(LodgmentVO vo) {
		// TODO Auto-generated method stub
		return (List<LodgmentVO>)list("LodgmentDAO.list", vo);
	}

	
	public int listCount(LodgmentVO vo) {
		// TODO Auto-generated method stub
		return (int)select("LodgmentDAO.listCount", vo);
	}
	
	public void insert(LodgmentVO vo){
		insert("LodgmentDAO.insert", vo);
	}

}
