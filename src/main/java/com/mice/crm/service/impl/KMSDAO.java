package com.mice.crm.service.impl;

import java.util.Iterator;
import java.util.List;

import org.hsqldb.rights.UserManager;
import org.springframework.stereotype.Repository;

import com.mice.crm.service.KMSEvaluateCurrVO;
import com.mice.crm.service.KMSEvaluateSearchVO;
import com.mice.crm.service.KMSEvaluateVO;
import com.mice.crm.service.KMSInsertVO;
import com.mice.crm.service.KMSLogVO;
import com.mice.crm.service.KMSMemberVO;
import com.mice.crm.service.KMSSearchVO;

import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.umt.service.UserManageVO;

@Repository("KMSDAO")
public class KMSDAO extends EgovComAbstractDAO{
	
	public List<KMSSearchVO> getAllTeam() {
		return (List<KMSSearchVO>)list("KMSDAO.getAllTeam");
	}
	public List<KMSSearchVO> getTeam(String userId) {
		return (List<KMSSearchVO>)list("KMSDAO.getTeam",userId);
	}
	public List<KMSSearchVO> getEmpByTeam(int team_idx){
		return (List<KMSSearchVO>)list("KMSDAO.getAllEmpByTeam", team_idx);
	}
	public List<KMSSearchVO> getEmpByTeam(KMSMemberVO vo){
		return (List<KMSSearchVO>)list("KMSDAO.getAllEmp", vo);
	}
	public void insertCommonFolder(KMSSearchVO kmsVO) {
		
		insert("KMSDAO.insertCommonFolder", kmsVO);
	}
	public void insertTeam(KMSSearchVO vo){
		insert("KMSDAO.insertTeam", vo);
	}
	public void insertDirEmp(UserManageVO userManageVO) {
		insert("KMSDAO.insertDirEmp", userManageVO);
	}
	public List<KMSSearchVO> getAllFolder(KMSSearchVO vo){
		return (List<KMSSearchVO>)list("KMSDAO.getAllFolder", vo);
	}
	public void updateAllDirUseFalse(UserManageVO userManageVO){
		update("KMSDAO.updateAllDirUseFalse", userManageVO);
	}
	public void updateDirUseTrue(UserManageVO userManageVO){
		update("KMSDAO.updateDirUseTrue", userManageVO);
	}
	public int getDirCountByTeamAndEmp(UserManageVO userManageVO){
		return (Integer)select("KMSDAO.getDirCountByTeamAndEmp", userManageVO);
	}
	public List<KMSSearchVO> getProByEmp(KMSSearchVO vo) {
		return (List<KMSSearchVO>)list("KMSDAO.getProByEmp", vo);
	}
	public List<KMSSearchVO> getCateByPro(KMSSearchVO vo) {
		return (List<KMSSearchVO>)list("KMSDAO.getCateByPro", vo);
	}
	public List<KMSSearchVO> getYearsByCate(KMSSearchVO vo) {
		return (List<KMSSearchVO>)list("KMSDAO.getYearsByCate", vo);
	}
	public List<KMSSearchVO> getFolder_1ByYears(KMSSearchVO vo) {
		return (List<KMSSearchVO>)list("KMSDAO.getFolder_1ByYears", vo);
	}
	public List<KMSSearchVO> getFolder_2ByFolder_1(KMSSearchVO vo) {
		return (List<KMSSearchVO>)list("KMSDAO.getFolder_2ByFolder_1", vo);
	}
	public List<KMSSearchVO> getFileList(KMSSearchVO vo) {
		return (List<KMSSearchVO>)list("KMSDAO.getFileList", vo);
	}
	public int getFileCount(KMSSearchVO vo) {
		return (Integer)select("KMSDAO.getFileCount", vo);
	}
	public String insertFileInfs(List<?> fileList) throws Exception {
		KMSSearchVO vo = (KMSSearchVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();

		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (KMSSearchVO) iter.next();
			
			insert("KMSDAO.insertFile", vo);
		}
		
		return atchFileId;
	}
	/**
	 * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * 
	 * @param vo
	 * @throws Exception
	 */
	public void insertFileInf(KMSSearchVO vo) throws Exception {
		insert("KMSDAO.insertFile", vo);
	}
	
	
	
	public void deleteFile(String atchFileId) {
		update("KMSDAO.deleteFile", atchFileId); 
	}

	public UserManageVO teamPositionById(String userId) {
		return (UserManageVO)select("KMSDAO.getTeamPositionById", userId); 
	}

	public void updateTeamName(KMSSearchVO kmsVO) {
		update("KMSDAO.updateTeamName", kmsVO);
	}

	public void updateDirEmpName(UserManageVO userManageVO) {
		update("KMSDAO.updateDirEmpName", userManageVO);
	}
	
	
	
	
	
	
	public void projectInsertAction(KMSInsertVO vo){
		insert("KMSDAO.insertProject", vo);
	}
	public void categoryInsertAction(KMSInsertVO vo){
		insert("KMSDAO.insertCategory", vo);
	}
	public void yearsInsertAction(KMSInsertVO vo){
		insert("KMSDAO.insertYears", vo);
	}
	public void folder1InsertAction(KMSInsertVO vo){
		insert("KMSDAO.insertFolder1", vo);
	}
	public void folder2InsertAction(KMSInsertVO vo){
		insert("KMSDAO.insertFolder2", vo);
	}
	
	public void projectUpdateAction(KMSInsertVO vo){
		update("KMSDAO.UpdateProject", vo);
	}
	public void categoryUpdateAction(KMSInsertVO vo){
		update("KMSDAO.UpdateCategory", vo);
	}
	public void yearsUpdateAction(KMSInsertVO vo){
		update("KMSDAO.UpdateYears", vo);
	}
	public void folder1UpdateAction(KMSInsertVO vo){
		update("KMSDAO.UpdateFolder1", vo);
	}
	public void folder2UpdateAction(KMSInsertVO vo){
		update("KMSDAO.UpdateFolder2", vo);
	}
	public void projectDeleteAction(KMSInsertVO vo){
		update("KMSDAO.DeleteProject", vo);
	}
	public void categoryDeleteAction(KMSInsertVO vo){
		update("KMSDAO.DeleteCategory", vo);
	}
	
	public void yearsDeleteAction(KMSInsertVO vo){
		update("KMSDAO.DeleteYears", vo);
	}
	public void folder1DeleteAction(KMSInsertVO vo){
		update("KMSDAO.DeleteFolder1", vo);
	}
	public void folder2DeleteAction(KMSInsertVO vo){
		update("KMSDAO.DeleteFolder2", vo);
	}
	
	public void fileDeleteAction(KMSInsertVO vo){
	    	update("KMSDAO.DeleteFile", vo);
	}
	
    public List<KMSEvaluateSearchVO> getEvaluateList(KMSEvaluateVO vo){
    	return (List<KMSEvaluateSearchVO>)list("KMSDAO.getEvaluateList", vo);	
    }
    public void evaluateInsertAction(KMSEvaluateCurrVO vo){
    	insert("KMSDAO.InsertEvaluate", vo);
	}
    public void evaluateUpdateAction(KMSEvaluateCurrVO vo){
    	update("KMSDAO.UpdateEvaluate", vo);
	}
    
    public void logInsertAction(KMSLogVO vo){
    	insert("KMSDAO.InsertLog", vo);
    }
    	
	public FileVO selectFileInf(FileVO fvo) throws Exception {
		return (FileVO) select("KMSDAO.selectFileInf", fvo);
	}
	public List<KMSLogVO> getFileLog(String atchFileId){
		return (List<KMSLogVO>)list("KMSDAO.getFileLog", atchFileId);
	}
	public UserManageVO selectUser(String emp_idx){
	      return (UserManageVO) select("KMSDAO.selectUser", emp_idx);
	 }
	   
   public void deleteFileById(String emp_idx){
      update("KMSDAO.DeleteFileById", emp_idx);
   }
}