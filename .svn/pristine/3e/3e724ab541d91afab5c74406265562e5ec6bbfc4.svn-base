package com.mice.cvb.archive.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;










import com.mice.cvb.archive.service.ArchiveCodeVO;
import com.mice.cvb.archive.service.ArchiveDownloadLogVO;
import com.mice.cvb.archive.service.ArchiveInfoVO;
import com.mice.cvb.archive.service.ArchiveRelation;
import com.mice.cvb.archive.service.ArchiveService;


@Service("ArchiveService")
public class ArchiveServiceImpl implements ArchiveService  {

	@Resource(name = "ArchiveDAO")
	private ArchiveDAO dao;

	@Override
	public Map<String, Object> codeList(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<ArchiveCodeVO> lst = dao.codeList(vo);
		map.put("resultList", lst);
		map.put("resultListCount", lst.size());
		return map;
	}


	@Override
	public void codeUpdate(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.codeUpdate(vo);
	}

	@Override
	public void codeDelete(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.codeDelete(vo);
		
	}

	@Override
	public void codeInsert(ArchiveCodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.codeInsert(vo);
	}


	@Override
	public int lastSortCodeNo() throws Exception {
		
		return dao.lastSortCodeNo();
	}


	@Override
	public void infoInsert(ArchiveInfoVO vo) throws Exception {
		dao.infoInsert(vo);;
	}


	@Override
	public Map<String, Object> infoList(ArchiveInfoVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.infoList(vo));
		map.put("resultListCount", dao.infoListCount(vo));
		return map;
	}


	@Override
	public ArchiveInfoVO infoDetail(ArchiveInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.infoDetail(vo);
	}


	@Override
	public List<ArchiveRelation> relationList(int archive_idx) throws Exception {
		// TODO Auto-generated method stub
		return (List<ArchiveRelation>)dao.relationList(archive_idx);
	}


	@Override
	public void infoUpdate(ArchiveInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.infoUpdate(vo);
	}


	@Override
	public void infoDelete(ArchiveInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.infoDelete(vo);
	}


	@Override
	public Map<String, Object> logList(ArchiveDownloadLogVO vo)
			throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.logList(vo));
		map.put("resultListCount", dao.logListCount(vo));
		return map;
	}
}
