package com.mice.crm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mice.crm.service.CRMEventOrderService;
import com.mice.crm.service.CodeVO;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.FacilityVO;
import com.mice.crm.service.FileVO;
import com.mice.crm.service.OrderVO;

/**
 *  
 * 	@이름 : CRMEventOrderServiceImpl
 * 	@최초생성일 : 20171017
 * 	@최초작성자 : 푸른들 김윤용
 * 	@설명 : 이벤트 오더 관리 비지니스 로직 구현
 * 
**/

@Service("CRMEventOrderService")
public class CRMEventOrderServiceImpl implements CRMEventOrderService{
	@Resource(name = "CRMEventOrderDAO")
	CRMEventOrderDAO dao;
	
	/* 이미 구현 되어 있는 대관신청 관리 관련 메소드를 활용하기 위해 injection함. */
	@Override
	public List<EventVO> getOrderList(EventVO vo) {
		List<EventVO> getOrderList = dao.getOrderList(vo);
		return getOrderList;
	}

	@Override
	public int getCount(EventVO vo) {
		return dao.getOrderCount(vo);
	}
	
	@Override
	public Map<String, Object> getOrderMap(OrderVO vo) {	
		OrderVO getOrder = null;
		List<FacilityVO> getFacList = new ArrayList<FacilityVO>();		// 시설 정보를 가져와 담기위한 리스트
		
		if(vo.getWrite_condition_tf().equals("")){						// 처음등록 - 이벤트 오더관리에서 '작성 전'이면 "" 이다.
			getOrder = dao.getOrder(vo.getCrm_event_idx());				// 대관신청관리의 특정 레코드를 불러와 담는다.
			String facilites = getOrder.getRent_facility_text();					// 대관신청관리의 시설 인덱스 정보를 담는다. (1, 51, 11)
			
			List<String> facilityList = new ArrayList<String>();				// 잘라낸 시설 인덱스 정보를 담기위해 List를 생성.
			HashMap<String, List<String>> facMap = new HashMap<String, List<String>>();	// 잘라낸 시설 인덱스 정보를 List에 담고 Map에 다시 담기위해 생성. (기존에 만들어진 CRMDAO의 시설 정보를 가져오는 Method를 사용하기 위해 Map을 사용한다.)
			
			if(facilites.length() > 0){
				String facility[] = facilites.split(",");
				
				for(int i=0; i<facility.length; i++){
					facilityList.add(facility[i]);						// 잘라낸 시설 인덱스를 리스트에 담는다.
				}
				facMap.put("idxList", facilityList);				// 잘라낸 시설 인덱스 리스트를 Map에 담는다.
			}
			
			getFacList = dao.getFacilityList(facMap);
			
			// text에 value를 담고  value에 idx를 담는다.
			for(int i=0; i<getFacList.size(); i++){
				getFacList.get(i).setText(getFacList.get(i).getValue());							
				getFacList.get(i).setValue(String.valueOf(getFacList.get(i).getIdx()));				// ***FacilityVO의 변수 value는 시설의 idx이다. (value = idx 변환)  
			}
			getOrder.setView_chk("a,b,c,d,e,f,g,h");	//처음등록이면  항목 모두 표시
			
		}else{
			getOrder = dao.get(vo.getCrm_event_idx());
			getFacList = dao.getOrderFacilityList(vo.getCrm_event_idx());
			//getOrder.setJoin_personal_cnt(dao.getPersonalCount(vo.getCrm_event_idx()));	//db에서 가지고 온다.
		}
		
		
		for(FacilityVO fac : getFacList){
			List<FacilityVO> getValueList = new ArrayList<FacilityVO>();
			getValueList = dao.getFacilityValueList(fac.getType());
			
			fac.setValueList(getValueList);													// valueList(FacilityVO)의 변수 value는 시설의 idx이다.
		}
		
		List<FacilityVO> getAllFacList = dao.getAllFacilityList();				// 모든 CodeList를 가지고 온다.		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("getOrder", getOrder);
		resultMap.put("getFacList", getFacList);
		resultMap.put("getAllFacList", getAllFacList);
		
		return resultMap;
	}
	
	public List<FileVO> getFile(FileVO fileVO){
		return dao.getFileList(fileVO);
	}
	
	@Override
	public void insertOrder(OrderVO vo) {
		if(dao.get(vo.getCrm_event_idx()) == null){				// 이벤트 오더관리에서 등록이 되지 않았으면 Insert, 있으면 Update
			dao.insertOrder(vo);
		}else{
			dao.updateOrder(vo);
		}
	}
	
	@Override
   public void insertEventPlace(FacilityVO facVo) {
		//String[] valueArr = facVo.getValueArr();
		//String[] typeArr = facVo.getTypeArr();
		String[] placeArr = facVo.getPlaceArr();
		String[] p_rent_st_dateArr = facVo.getP_rent_st_dateArr();
		String[] p_rent_ed_dateArr = facVo.getP_rent_ed_dateArr();
		String[] rent_timeArr = facVo.getRent_timeArr();
		
		System.out.println("__________placeArr=="+facVo.getPlaceArr());
		System.out.println("__________getRent_timeArr=="+facVo.getRent_timeArr());
		
		//String[] rent_time_amArr = facVo.getRent_time_amArr();
		//String[] rent_time_pmArr = facVo.getRent_time_pmArr();
		//String[] rent_time_nightArr = facVo.getRent_time_nightArr();
		String[] rent_settingArr = facVo.getRent_settingArr();
		//String[] rent_etc_textArr = facVo.getRent_etc_textArr();
		String[] personal_cntArr = facVo.getPersonal_cntArr();
		String[] etc_textArr = facVo.getEtc_textArr();

	
		if (placeArr != null) {
			for (int i = 0; i < placeArr.length; i++) {
				//facVo.setValue(valueArr[i]);
				//facVo.setType(typeArr[i]);
				facVo.setPlace(placeArr[i]);
				facVo.setP_rent_st_date(p_rent_st_dateArr[i]);
				facVo.setP_rent_ed_date(p_rent_ed_dateArr[i]);
				
				facVo.setRent_time(rent_timeArr[i]);
				//facVo.setRent_time_am(rent_time_amArr[i]);
				//facVo.setRent_time_pm(rent_time_pmArr[i]);
				//facVo.setRent_time_night(rent_time_nightArr[i]);
				facVo.setRent_setting(rent_settingArr[i]);
				//facVo.setRent_etc_text(rent_etc_textArr[i].trim());
				facVo.setPersonal_cnt(personal_cntArr[i].trim());
				facVo.setEtc_text(etc_textArr[i].trim());

				dao.insertEventPlace(facVo);
			}
		}

   }
	
	@Override
	public void deleteEventPlace(FacilityVO facVo){
		dao.deleteEventPlace(facVo);
	}
	
	@Override
	public String getWrite_condition_tf(int idx){
		return dao.getWrite_condition_tf(idx);
	}
	
	@Override
	public void deletePartnersFile(String file_id){
		dao.deleteAttachFileInfo(file_id);
		dao.deleteComtNFileDetail(file_id);
		dao.deleteComtNFile(file_id);
	}
}
