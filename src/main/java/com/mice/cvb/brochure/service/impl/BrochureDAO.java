package com.mice.cvb.brochure.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mice.cvb.brochure.service.BrochureVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("BrochureDAO")
public class BrochureDAO  extends EgovComAbstractDAO  {

	public List<BrochureVO> list(BrochureVO vo){
		return (List<BrochureVO>)list("BrochureDAO.list", vo);
	}
	public int listCount(BrochureVO vo){
		return (int)select("BrochureDAO.listCount", vo);
	}
	public BrochureVO info(int idx){
		return (BrochureVO)select("BrochureDAO.info", idx);
	}
	public void update(BrochureVO vo){
		update("BrochureDAO.update", vo);
	}
	public void delete(BrochureVO vo){
		update("BrochureDAO.delete", vo);
	}
	public void insert(BrochureVO vo){
		insert("BrochureDAO.insert", vo);
	}
}
