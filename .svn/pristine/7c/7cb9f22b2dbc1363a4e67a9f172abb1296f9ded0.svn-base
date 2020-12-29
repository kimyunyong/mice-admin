package com.mice.crm.service;

import java.util.List;
import java.util.Map;

/**
 *
 * 	@이름 : CRMEventOrderService
 * 	@최초생성일 : 20171017
 * 	@최초작성자 : 푸른들 김윤용
 * 	@설명 : 이벤트 오더 관리 비지니스 로직 인터페이스
 * 
**/

public interface CRMEventOrderService {
	public int getCount(EventVO vo);	// 대관신청 관리(이벤트) 레코드 총 개수를 가져온다.
	public List<EventVO> getOrderList(EventVO vo);	// 대관신청 관리(이벤트) 리스트를 가져온다.
	public Map<String, Object> getOrderMap(OrderVO vo);	// 대관신청 관리(이벤트) 또는 이벤트 오더 관리 리스트를 가져온다.
	public List<FileVO> getFile(FileVO fileVO);	// 이벤트 파일 정보를 가지고 온다.
	void insertOrder(OrderVO vo);	// 이벤트 오더 관리를 등록한다.
	void insertEventPlace(FacilityVO facVo); // 이벤트 오더 행사장 정보를 등록한다.
	void deleteEventPlace(FacilityVO facVo); // 이벤트 오더 행사장 정보를 등록한다.
	public String getWrite_condition_tf(int idx);
	void deletePartnersFile(String file_id);

}