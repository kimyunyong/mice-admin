package com.mice.crm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.crm.service.CodeVO;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.FacilityVO;
import com.mice.crm.service.FileVO;
import com.mice.crm.service.OrderVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 *  @
 * 	@이름 : CRMEventOrderDAO
 * 	@최초생성일 : 20171017
 * 	@최초작성자 : 푸른들 김윤용
 * 	@설명 : 이벤트 오더 관리 데이터 엑세스 로직 구현.
 * 
**/

@Repository("CRMEventOrderDAO")
public class CRMEventOrderDAO extends EgovComAbstractDAO{
	// 대관신청 관리 데이터를 불러온다.
	public List<EventVO> getOrderList(EventVO vo) {
		return (List<EventVO>)list("CRMEventOrderDAO.getOrderList", vo);
	}
	
	// 대관신청 관리 세부 데이터를 불러온다.
	public OrderVO getOrder(int crm_event_idx) {
		return (OrderVO)select("CRMEventOrderDAO.getOrder", crm_event_idx);
	}
	
	public int getOrderCount(EventVO vo){
		return (int)select("CRMEventOrderDAO.OrderCount", vo);
	}
	
	/* 대관 시설 관리에서 등록한 시설 리스트를 불러온다. 
	 * @ map : 시설 인덱스 리스트
	 * */
	public List<FacilityVO> getFacilityList(HashMap<String, List<String>> map) {
		return (List<FacilityVO>)list("CRMEventOrderDAO.getFacilityList", map);
	}
	
	/* 오더를 등록한다. */
	public void insertOrder(OrderVO orderVO) {
		insert("CRMEventOrderDAO.insertOrder", orderVO);
	}
	
	/* 오더관리를 업데이트 한다. */
	public void updateOrder(OrderVO orderVO){		
		update("CRMEventOrderDAO.updateOrder", orderVO);
	}
	
	/* 특정 오더관리를 가지고 온다. */
	public OrderVO get(int crm_event_idx) {
		return (OrderVO)select("CRMEventOrderDAO.get", crm_event_idx);
	}
	
	/* 오더관리에서 등록한 시설 리스트 정보를 가지고 온다. */
	public List<FacilityVO> getOrderFacilityList(int crm_event_idx){
		return (List<FacilityVO>)list("CRMEventOrderDAO.getOrderFacilityList", crm_event_idx);
	}
	
	/* 파일 정보 리스트를 가지고 온다.
	 * @ fileVO : 대관 시설에서 등록한 이벤트 인덱스와 파일의 타입(협력사 파일의 타입 또는 기타 정보 파일의 타입 등) 정보를 가지고 있다.
	 */
	public List<FileVO> getFileList(FileVO fileVO){
		return (List<FileVO>)list("CRMEventOrderDAO.getFile", fileVO);
	}
	
	/* @ 특정 오더 장소를 등록한다.*/
	public void insertEventPlace(FacilityVO facVo) {
		insert("CRMEventOrderDAO.insertEventPlace", facVo);
	}
	
	/* @ 특정 오더 장소를 삭제한다. */
	public void deleteEventPlace(FacilityVO facVo) {
		delete("CRMEventOrderDAO.deleteEventPlace", facVo);
	}
	
	public String getWrite_condition_tf(int idx){
		return (String)select("CRMEventOrderDAO.getWrite_condition_tf", idx);
	}
	
	public List<FacilityVO> getFacilityValueList(String type){
		return (List<FacilityVO>)list("CRMEventOrderDAO.getFacilityValueList", type);
	}
	
	public List<FacilityVO> getAllFacilityList(){
		return (List<FacilityVO>)list("CRMEventOrderDAO.getAllFacilityList");
	}

	public int getPersonalCount(int crm_event_idx) {
		return (Integer)select("CRMEventOrderDAO.getPersonalCount", crm_event_idx);
	}
	
	public void deleteAttachFileInfo(String file_id){
		delete("CRMEventOrderDAO.deleteEvent_attach_file_info", file_id);
	}
	
	public void deleteComtNFileDetail(String file_id){
		delete("CRMEventOrderDAO.deleteComtNFileDetail", file_id);
	}
	
	public void deleteComtNFile(String file_id){
		delete("CRMEventOrderDAO.deleteComtNFile", file_id);
	}
}