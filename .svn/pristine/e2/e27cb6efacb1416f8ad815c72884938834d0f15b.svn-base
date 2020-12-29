package com.mice.crm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mice.crm.service.CRMEventOrderService;
import com.mice.crm.service.CRMService;
import com.mice.crm.service.EventAttachFile;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.FacilityVO;
import com.mice.crm.service.FileVO;
import com.mice.crm.service.OrderVO;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 *  
 * 	@이름 : 이벤트 오더 관리 컨트롤러
 * 	@최초생성일 : 20171012
 * 	@최초작성자 : 푸른들 김윤용
 * 	@설명 : 이벤트 오더관리 - 리스트, 세부 정보, 프린트, 등록, 작성중 저장 외 기타 컨트롤러
 * 
**/

@Controller
public class CRMEventOrderController {
	
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComIndexController.class);
	
	@Resource(name = "CRMEventOrderService")
	CRMEventOrderService service;
	
	@Resource(name = "CRMService")
	CRMService crmService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "userManageService")
	private EgovUserManageService userService;
	
	/* 이벤트 오더 관리를 위한 대관신청 리스트를 가져온다. */
	@RequestMapping("/crm/order/list.do")
	public String listOrder(@ModelAttribute("EventVO") EventVO vo, Model model){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<EventVO> getListOrder = service.getOrderList(vo);			// 대관신청 리스트를 가져와 비지니스 처리를 하고 리턴 받는다.
		
		paginationInfo.setTotalRecordCount(service.getCount(vo));
		
		model.addAttribute("resultList", getListOrder);							// 대관신청 리스트
		model.addAttribute("vo", vo);													// 사용자가 입력한 search 정보를 담고 있음.
		model.addAttribute("paginationInfo", paginationInfo);					// 페이징 정보
		
		return "mice/crm/order/list";
	}
	
	/*이벤트 오더 print */
	@RequestMapping("/crm/order/print.do")
	public String print(@ModelAttribute("OrderVO") OrderVO vo , Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		Map<String, Object> getOrderMap = service.getOrderMap(vo);
		OrderVO getOrder = (OrderVO) getOrderMap.get("getOrder");
		List<FacilityVO> getFacList = (List<FacilityVO>)getOrderMap.get("getFacList");
		
		
		FileVO fileVO = new FileVO();
		fileVO.setCrm_event_idx(vo.getCrm_event_idx());
		
		
		fileVO.setType("hall_order_file"); //행사장 참고사항
		List<FileVO> getHallFile = service.getFile(fileVO);
		
		fileVO.setType("cate_order_file"); //partners_attach_file , 케이터링
		List<FileVO> getCateFile = service.getFile(fileVO);
		
		fileVO.setType("etc_order_file"); //etc_attach_file , 첨부파일
		List<FileVO> getEtcFile = service.getFile(fileVO);
		

		
		//model.addAttribute("orderVO", getOrder);
		//model.addAttribute("facList", getFacList);
		model.addAttribute("getHallFile", getHallFile);
		model.addAttribute("getCateFile", getCateFile);
		model.addAttribute("getEtcFile", getEtcFile);
		model.addAttribute("getOrder", getOrder);
		model.addAttribute("getFacList", getFacList);
		
		return "mice/crm/order/print";
	}
	
	
	
	/*이벤트 오더 엑셀다운로드 */
	@RequestMapping("/crm/order/excel_download.do")
	public String infoOrderExcelDownload(@ModelAttribute("OrderVO") OrderVO vo , Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		Map<String, Object> getOrderMap = service.getOrderMap(vo);
		OrderVO getOrder = (OrderVO) getOrderMap.get("getOrder");
		List<FacilityVO> getFacList = (List<FacilityVO>)getOrderMap.get("getFacList");
		
		
		FileVO fileVO = new FileVO();
		fileVO.setCrm_event_idx(vo.getCrm_event_idx());
		
		
		fileVO.setType("hall_order_file"); //행사장 참고사항
		List<FileVO> getHallFile = service.getFile(fileVO);
		
		fileVO.setType("cate_order_file"); //partners_attach_file , 케이터링
		List<FileVO> getCateFile = service.getFile(fileVO);
		
		fileVO.setType("etc_order_file"); //etc_attach_file , 첨부파일
		List<FileVO> getEtcFile = service.getFile(fileVO);
		

		
		//model.addAttribute("orderVO", getOrder);
		//model.addAttribute("facList", getFacList);
		model.addAttribute("getHallFile", getHallFile);
		model.addAttribute("getCateFile", getCateFile);
		model.addAttribute("getEtcFile", getEtcFile);
		model.addAttribute("getOrder", getOrder);
		model.addAttribute("getFacList", getFacList);
		
		return "mice/crm/order/excel_download";
	}
		
	
	/*이벤트 오더 상세 정보 */
	@RequestMapping("/crm/order/info.do")
	public String infoOrder(@ModelAttribute("OrderVO") OrderVO vo , Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		Map<String, Object> getOrderMap = service.getOrderMap(vo);
		OrderVO getOrder = (OrderVO) getOrderMap.get("getOrder");
		List<FacilityVO> getFacList = (List<FacilityVO>)getOrderMap.get("getFacList");
		
		
		FileVO fileVO = new FileVO();
		fileVO.setCrm_event_idx(vo.getCrm_event_idx());
		
		
		fileVO.setType("hall_order_file"); //행사장 참고사항
		List<FileVO> getHallFile = service.getFile(fileVO);
		
		fileVO.setType("cate_order_file"); //partners_attach_file , 케이터링
		List<FileVO> getCateFile = service.getFile(fileVO);
		
		fileVO.setType("etc_order_file"); //etc_attach_file , 첨부파일
		List<FileVO> getEtcFile = service.getFile(fileVO);
		

		
		//model.addAttribute("orderVO", getOrder);
		//model.addAttribute("facList", getFacList);
		model.addAttribute("getHallFile", getHallFile);
		model.addAttribute("getCateFile", getCateFile);
		model.addAttribute("getEtcFile", getEtcFile);
		model.addAttribute("getOrder", getOrder);
		model.addAttribute("getFacList", getFacList);
		
		return "mice/crm/order/info";
	}
	
	/*이벤트 오더 상세 정보 */
	@RequestMapping("/crm/order/modify.do")
	public String modifyOrder(@ModelAttribute("OrderVO") OrderVO vo , Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		Map<String, Object> getOrderMap = service.getOrderMap(vo);
		OrderVO getOrder = (OrderVO) getOrderMap.get("getOrder");
		List<FacilityVO> getFacList = (List<FacilityVO>)getOrderMap.get("getFacList");
		//List<FacilityVO> getAllFacList = (List<FacilityVO>)getOrderMap.get("getAllFacList");
		
		FileVO fileVO = new FileVO();
		fileVO.setCrm_event_idx(vo.getCrm_event_idx());
		
		
		fileVO.setType("hall_order_file"); //행사장 참고사항
		List<FileVO> getHallFile = service.getFile(fileVO);
		
		fileVO.setType("cate_order_file"); //partners_attach_file , 케이터링
		List<FileVO> getCateFile = service.getFile(fileVO);
		
		fileVO.setType("etc_order_file"); //etc_attach_file , 첨부파일
		List<FileVO> getEtcFile = service.getFile(fileVO);
		

		model.addAttribute("getHallFile", getHallFile);
		model.addAttribute("getCateFile", getCateFile);
		model.addAttribute("getEtcFile", getEtcFile);
		model.addAttribute("getOrder", getOrder);
		model.addAttribute("getFacList", getFacList);
		//model.addAttribute("getAllFacList", getAllFacList);
		
		
		return "mice/crm/order/modify";
	}
	
	/*이벤트 오더 관리의 입력 중 저장*/
	@RequestMapping(value="/crm/order/save.do", method=RequestMethod.POST)
	public String saveOrder(@ModelAttribute("OrderVO") OrderVO vo, @ModelAttribute("FacilityVO") FacilityVO facVo, final MultipartHttpServletRequest multiRequest,
			RedirectAttributes redirectAttr, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception{
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<egovframework.com.cmm.service.FileVO> result = null;
		String atchFileId = "";
		
		service.insertOrder(vo);
		service.deleteEventPlace(facVo);
		service.insertEventPlace(facVo);

		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {
			for (int i = 0; i < map.getValue().size(); i++) {
				result = fileUtil.parseFileInf(
						getFileMap(map.getKey(), map.getValue().get(i)),
						"FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				
				if(atchFileId != null && !atchFileId.equals("")) {
					EventAttachFile file = new EventAttachFile();
					file.setFile_id(atchFileId);
					file.setCrm_event_idx(vo.getCrm_event_idx());
					file.setType(map.getKey());
					crmService.insertEventAttachFile(file);
				}
			}
		}
		
		return "redirect:/crm/order/modify.do?crm_event_idx="+vo.getCrm_event_idx()+"&write_condition_tf="+vo.getWrite_condition_tf();
	}
	
	/*이벤트 오더 등록*/
	@RequestMapping(value="/crm/order/insert.do", method=RequestMethod.POST)
	public String insertOrder(@ModelAttribute("OrderVO") OrderVO vo, @ModelAttribute("FacilityVO") FacilityVO facVo, final MultipartHttpServletRequest multiRequest,
			RedirectAttributes redirectAttr, BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
				
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<egovframework.com.cmm.service.FileVO> result = null;
		String atchFileId = "";
		
		service.insertOrder(vo);
		service.deleteEventPlace(facVo);
		service.insertEventPlace(facVo);

		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {
			for (int i = 0; i < map.getValue().size(); i++) {
				result = fileUtil.parseFileInf(
						getFileMap(map.getKey(), map.getValue().get(i)),
						"FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				
				if(atchFileId != null && !atchFileId.equals("")) {
					EventAttachFile file = new EventAttachFile();
					file.setFile_id(atchFileId);
					file.setCrm_event_idx(vo.getCrm_event_idx());
					file.setType(map.getKey());
					crmService.insertEventAttachFile(file);
				}
			}
		}
		
		return "redirect:/crm/order/list.do";
	}
	
	@RequestMapping("/crm/order/from.do")
	public String fromOrder(@RequestParam("idx") int idx, ModelMap model) throws Exception {
		
		String write_condition_tf = service.getWrite_condition_tf(idx);
		
		if(write_condition_tf!= null){
			return "redirect:/crm/order/modify.do?crm_event_idx=" + idx + "&write_condition_tf=" + write_condition_tf;
		}else{
			return "redirect:/crm/order/modify.do?crm_event_idx=" + idx + "&write_condition_tf=";
		}
		
	}
	
	@RequestMapping("/crm/order/deletePartnersFile.do")
	public ModelAndView deletePartnersFile(@RequestParam String file_id, @RequestParam String crm_event_idx, @RequestParam String write_condition_tf) throws Exception {		
		service.deletePartnersFile(file_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("test", new String("test"));
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	private Map<String, MultipartFile> getFileMap(String key, MultipartFile file){
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;
	}	
}