package com.mice.cvb.archive.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mice.cvb.archive.service.ArchiveCodeVO;
import com.mice.cvb.archive.service.ArchiveDownloadLogVO;
import com.mice.cvb.archive.service.ArchiveInfoVO;
import com.mice.cvb.archive.service.ArchiveRelation;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("ArchiveDAO")
public class ArchiveDAO extends EgovComAbstractDAO {
	
	public List<ArchiveCodeVO> codeList(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<ArchiveCodeVO>)list("ArchiveDAO.codeList");
	}

		
	public void codeUpdate(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("ArchiveDAO.codeUpdate", vo);
	}

	
	public void codeDelete(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("ArchiveDAO.codeDelete", vo);
		update("ArchiveDAO.codeSortUpdate");
	}
	
	public void codeInsert(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setSort_no((int)select("ArchiveDAO.codeSortNo", vo));
		insert("ArchiveDAO.codeInsert", vo);
	}
	
	public int lastSortCodeNo() throws Exception{
		return (int)select("ArchiveDAO.codeSortNo");
	}
	
	public void infoInsert(ArchiveInfoVO vo) throws Exception {
		insert("ArchiveDAO.infoInsert", vo);
	}
	
	public List<ArchiveInfoVO> infoList(ArchiveInfoVO vo) throws Exception{
		return (List<ArchiveInfoVO>)list("ArchiveDAO.infoList", vo);
	}
	
	public int infoListCount(ArchiveInfoVO vo) throws Exception{
		return (int)select("ArchiveDAO.infoListCount", vo);
	}

	
	public ArchiveInfoVO infoDetail(ArchiveInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (ArchiveInfoVO)select("ArchiveDAO.infoDetail", vo);
	}


	
	public List<ArchiveRelation> relationList(int archive_idx) throws Exception {
		// TODO Auto-generated method stub
		return (List<ArchiveRelation>)list("ArchiveDAO.relationList", archive_idx);
	}
	
	
	public void infoUpdate(ArchiveInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("ArchiveDAO.infoUpdate", vo);
	}


	
	public void infoDelete(ArchiveInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		update("ArchiveDAO.infoDelete", vo);
	}
	
	public List<ArchiveDownloadLogVO> logList(ArchiveDownloadLogVO vo)
			throws Exception {
		// TODO Auto-generated method stub
		return (List<ArchiveDownloadLogVO>)list("ArchiveDAO.logList", vo);
	}
	
	
	public int logListCount(ArchiveDownloadLogVO vo){
		return (int)select("ArchiveDAO.logListCount", vo);
	}
}
