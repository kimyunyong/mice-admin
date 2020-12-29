package com.mice.cvb.service.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.cvb.service.service.RFPService;
import com.mice.cvb.service.service.RFPVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("RFPDAO")
public class RFPDAO  extends EgovComAbstractDAO {

	
	public void updateRFP(RFPVO vo) {
		// TODO Auto-generated method stub
		update("RFPDAO.updateRFP", vo);
	}

	
	public RFPVO selectRFP(int idx) {
		// TODO Auto-generated method stub
		return (RFPVO)select("RFPDAO.selectRFP", idx);
	}

	
	public List<RFPVO> selectRFPList(RFPVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<RFPVO>)list("RFPDAO.selectRFPList", vo);
	}

	
	public int selectRFPListCount(RFPVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int)select("RFPDAO.selectRFPListCount", vo);
	}

	
	public void deleteRFP(RFPVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("RFPDAO.deleteRFP", vo);
	}

}
