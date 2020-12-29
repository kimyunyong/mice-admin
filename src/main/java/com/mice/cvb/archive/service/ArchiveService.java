package com.mice.cvb.archive.service;

import java.util.List;
import java.util.Map;

public interface ArchiveService {

	public Map<String, Object> codeList(ArchiveCodeVO vo) throws Exception;
	
	public void codeUpdate(ArchiveCodeVO vo) throws Exception;
	
	public void codeDelete(ArchiveCodeVO vo) throws Exception;
	
	public void codeInsert(ArchiveCodeVO vo) throws Exception;
	
	public int lastSortCodeNo() throws Exception;
	
	public void infoInsert(ArchiveInfoVO vo) throws Exception;
	
	public Map<String, Object> infoList(ArchiveInfoVO vo) throws Exception;
	
	public ArchiveInfoVO infoDetail(ArchiveInfoVO vo) throws Exception;
	
	public List<ArchiveRelation> relationList(int archive_idx) throws Exception;
	
	public void infoUpdate(ArchiveInfoVO vo) throws Exception;
	
	public void infoDelete(ArchiveInfoVO vo) throws Exception;
	
	public Map<String, Object> logList(ArchiveDownloadLogVO vo) throws Exception;
	
}
