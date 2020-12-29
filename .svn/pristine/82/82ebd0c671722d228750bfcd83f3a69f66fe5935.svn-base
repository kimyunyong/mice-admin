package com.mice.crm.service;

import java.util.List;

import egovframework.com.cmm.service.FileVO;
import egovframework.com.uss.umt.service.UserManageVO;

public interface KMSService {
	public List<KMSSearchVO> getAllTeam();
	public List<KMSSearchVO> getEmpByTeam(int team_idx);
	public List<KMSSearchVO> getProByEmp(KMSSearchVO vo);
	public List<KMSSearchVO> getCateByPro(KMSSearchVO vo);
	public List<KMSSearchVO> getYearsByCate(KMSSearchVO vo);
	public List<KMSSearchVO> getFolder_1ByYears(KMSSearchVO vo);
	public List<KMSSearchVO> getFolder_2ByFolder_1(KMSSearchVO vo);
	public List<KMSSearchVO> getFileList(KMSSearchVO vo);
	public int getFileCount(KMSSearchVO vo);
	public String insertFileInfs(List<?> fvoList) throws Exception;
	public String insertFileInf(KMSSearchVO vo) throws Exception;
	public List<KMSSearchVO> getTeam(String userId);
	public List<KMSSearchVO> getEmpByTeam(KMSMemberVO vo);
	
	public void deleteFile(KMSSearchVO vo);
	public UserManageVO teamPositionById(String userId);

	public List<KMSSearchVO> getAllFolder(KMSSearchVO vo);
	
	public void projectInsertAction(KMSInsertVO vo);
	public void categoryInsertAction(KMSInsertVO vo);
    public void yearsInsertAction(KMSInsertVO vo);
    public void folder1InsertAction(KMSInsertVO vo);
    public void folder2InsertAction(KMSInsertVO vo);
    
    public void projectUpdateAction(KMSInsertVO vo);
    public void categoryUpdateAction(KMSInsertVO vo);
    public void yearsUpdateAction(KMSInsertVO vo);
    public void folder1UpdateAction(KMSInsertVO vo);
    public void folder2UpdateAction(KMSInsertVO vo);
    
    public void projectDeleteAction(KMSInsertVO vo);
    public void categoryDeleteAction(KMSInsertVO vo);
    public void yearsDeleteAction(KMSInsertVO vo);
    public void folder1DeleteAction(KMSInsertVO vo);
    public void folder2DeleteAction(KMSInsertVO vo);
    
    public void fileDeleteAction(KMSInsertVO vo);
    
    public List<KMSEvaluateSearchVO> getEvaluateList(KMSEvaluateVO vo);
    public void evaluateInsertAction(KMSEvaluateCurrVO vo);
    public void evaluateUpdateAction(KMSEvaluateCurrVO vo);
    
    public void logInsertAction(KMSLogVO vo);
	public FileVO selectFileInf(FileVO fileVO) throws Exception;
	public List<KMSLogVO> getFileLog(String atchFileId);
}
