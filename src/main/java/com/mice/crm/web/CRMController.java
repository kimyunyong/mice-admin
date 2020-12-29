package com.mice.crm.web;

import java.io.File;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibm.icu.text.SimpleDateFormat;
import com.mice.common.encrypt.AESGenerator;
import com.mice.common.excel.ExcelExportView;
import com.mice.common.excel.ExcelMapping;
import com.mice.crm.service.CRMCodeExt;
import com.mice.crm.service.CRMCodeExtVO;
import com.mice.crm.service.CRMService;
import com.mice.crm.service.CodeVO;
import com.mice.crm.service.CustomerOrganizerRelationVO;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.Event;
import com.mice.crm.service.EventAttachFile;
import com.mice.crm.service.EventCalendarVO;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.OrganizerVO;
import com.mice.crm.service.PromotionAttachFile;
import com.mice.crm.service.PromotionVO;
import com.mice.crm.service.SummaryEventCalculator;
import com.mice.crm.service.EventPlusVO;
import com.mice.crm.service.EventThemeVO;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CRMController {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComIndexController.class);

	@Resource(name = "CRMService")
	CRMService service;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "userManageService")
	private EgovUserManageService userService;

	@RequestMapping("/crm/customer/list.do")
	public String customerList(@ModelAttribute("CustomerVO") CustomerVO vo,
			ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		if(vo.getSearchCnd().equals("1")){
			paginationInfo.setRecordCountPerPage(9999);
		}else
			paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = service.mapCustomer(vo);

		if(vo.getSearchCnd().equals("1")){
			List<CustomerVO> listCustomerVO = new ArrayList<CustomerVO>();
			List<CustomerVO> tmpCustomer = (List<CustomerVO>)map.get("resultList");
			for(int i=0;i<tmpCustomer.size();i++){
				if(AESGenerator.decrypt(tmpCustomer.get(i).getName_ko()).indexOf(AESGenerator.decrypt(vo.getSearchWrd())) > -1 ||
					AESGenerator.decrypt(tmpCustomer.get(i).getName_en()).indexOf(AESGenerator.decrypt(vo.getSearchWrd())) > -1)
					listCustomerVO.add(tmpCustomer.get(i));
			}
			
			
			map.put("resultList", listCustomerVO);
			map.put("resultListCount", listCustomerVO.size());
			
		}
		
		int totCnt = (int) map.get("resultListCount");

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "mice/crm/customer/list";
	}

	@RequestMapping("/crm/customer/info.do")
	public String customerInfo(@RequestParam("idx") int idx, ModelMap model, @ModelAttribute("CustomerVO") CustomerVO vo)
			throws Exception {
		model.addAttribute("result", service.selectCustomer(idx));
		model.addAttribute("vo", vo);
		return "mice/crm/customer/info";
	}

	@RequestMapping("/crm/customer/edit.do")
	public String customerEdit(@RequestParam("idx") int idx, ModelMap model)
			throws Exception {
		model.addAttribute("result", service.selectCustomer(idx));
		return "mice/crm/customer/edit";
	}

	@RequestMapping("/crm/customer/edit_action.do")
	public String customerEditAction(
			@ModelAttribute("CustomerVO") CustomerVO vo, ModelMap model)
			throws Exception {
		service.updateCustomer(vo);
		model.addAttribute("resultMsg", "success.common.update");
		return "redirect:/crm/customer/info.do?idx=" + vo.getIdx();
	}

	@RequestMapping("/crm/customer/organizer_attach_action")
	public String customerOrganizerAttachAction(
			@ModelAttribute("CustomerVO") CustomerVO cvo,
			@ModelAttribute("OrganizerVO") OrganizerVO ovo, ModelMap model)
			throws Exception {
		return "redirect:/crm/customer/info.do?idx=" + cvo.getIdx();
	}

	@RequestMapping("/crm/customer/organizer_delete_action")
	public String customerOrganizerDeleteAction(
			@ModelAttribute("CustomerVO") CustomerVO cvo,
			@RequestParam("organizer_idx") int idx, ModelMap model)
			throws Exception {
		return "redirect:/crm/customer/info.do?idx=" + cvo.getIdx();
	}

	@RequestMapping("/crm/customer/insert.do")
	public String customerInsert(ModelMap model) {
		
		OrganizerVO vo = new OrganizerVO();
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(10000);

		model.addAttribute("resultList", service.listOrganizer(vo));
		
		return "mice/crm/customer/insert";
	}

	@RequestMapping("/crm/customer/insert_action.do")
	public String customerInsertAction(
			@ModelAttribute("CustomerVO") CustomerVO vo, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		
		int row_no = service.insertCustomer(vo);
		
		/* 기관등록 */
		if( vo.getOrganizer_cnt_plus() > 0){
			CustomerOrganizerRelationVO ovo = new CustomerOrganizerRelationVO();
			for(int i =0; i< vo.getOrganizer_idx_plus().size() ;i++){
				
				ovo.setCustomer_idx(row_no);
				ovo.setOrganizer_idx(  Integer.parseInt(vo.getOrganizer_idx_plus().get(i)) );
				ovo.setUnit( vo.getUnit_plus().get(i) );
				ovo.setStaff( vo.getStaff_plus().get(i));
				ovo.setAdd_tel_no(vo.getAdd_tel_no_plus().get(i));
				ovo.setOperation(vo.getOperation_plus().get(i));
				
				service.insertCustomerNOrganizer(ovo);
			}
		}
		
		
		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/crm/customer/list.do";
	}

	@RequestMapping("/crm/customer/delete_action.do")
	public String customerDeleteAction(@RequestParam("idx") int idx,
			@ModelAttribute("CustomerVo") CustomerVO vo, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setExpire_id(user.getId());
		vo.setIdx(idx);
		service.deleteCustomer(vo);
		model.addAttribute("resultMsg", "success.common.delete");
		return "redirect:/crm/customer/list.do";
	}

	@RequestMapping("/crm/customer/organizer_list.do")
	public String customerAndOrganizerList(
			@RequestParam Map<String, Object> map, ModelMap model) {

		int idx = Integer.parseInt(map.get("idx").toString());

		model.addAttribute("organizerList", service.listCustomerRelation(idx));

		return "mice/crm/customer/organizer_list";
	}

	@RequestMapping("/crm/customer/organizer_edit_action.do")
	/*
	 * public String customerAndOrganizerEditAction(RedirectAttributes
	 * redirectAttr, @ModelAttribute("CustomerOrganizerRelation")
	 * CustomerOrganizerRelation vo, ModelMap model){
	 */
	public String customerAndOrganizerEditAction(
			RedirectAttributes redirectAttr,
			@ModelAttribute CustomerOrganizerRelationVO vo,
			BindingResult result, ModelMap model) throws Exception {
		try {
			service.updateCustomerNOrganizer(vo);
			redirectAttr
					.addFlashAttribute("resultMsg", "success.common.update");
		} catch (org.springframework.dao.DuplicateKeyException ex) {

			redirectAttr
					.addFlashAttribute("resultMsg", "fail.common.duplicate");
		}

		return "redirect:/crm/customer/info.do?idx=" + vo.getCustomer_idx();
	}

	@RequestMapping("/crm/customer/organizer_edit.do")
	public String customerAndOrganizerEdit(
			@RequestParam("customer_idx") int customer_idx,
			@RequestParam("organizer_idx") int organizer_idx, ModelMap model)
			throws Exception {

		OrganizerVO organizerVO = new OrganizerVO();
		organizerVO.setFirstIndex(0);
		organizerVO.setRecordCountPerPage(10000);

		model.addAttribute("resultList", service.listOrganizer(organizerVO));

		CustomerOrganizerRelationVO vo = new CustomerOrganizerRelationVO();
		vo.setOrganizer_idx(organizer_idx);
		vo.setCustomer_idx(customer_idx);
		model.addAttribute("res", service.selectCustomerRelation(vo));
		return "mice/crm/customer/organizer_edit";
	}

	@RequestMapping("/crm/customer/organizer_delete.do")
	public String customerAndOrganizerDelete(
			@ModelAttribute("CustomerOrganizerRelationVO") CustomerOrganizerRelationVO vo,
			ModelMap model) throws Exception {

		service.deleteCustomerNOrganizer(vo);
		model.addAttribute("resultMsg", "success.common.delete");
		return "redirect:/crm/customer/info.do?idx=" + vo.getCustomer_idx();
	}

	@RequestMapping("/crm/customer/organizer_insert.do")
	public String customerAndOrganizerInsert(@RequestParam("idx") int idx,
			@ModelAttribute("OrganizerVO") OrganizerVO vo, ModelMap model) {
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(10000);

		model.addAttribute("resultList", service.listOrganizer(vo));
		return "mice/crm/customer/organizer_insert";
	}

	@RequestMapping("/crm/customer/organizer_insert_action.do")
	public String customerAndOrganizerInsertAction(
			RedirectAttributes redirectAttr,
			@ModelAttribute("CustomerOrganizerRelationVO") CustomerOrganizerRelationVO vo,
			ModelMap model) {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		try {
			service.insertCustomerNOrganizer(vo);
			model.addAttribute("resultMsg", "success.common.insert");
		} catch (org.springframework.dao.DuplicateKeyException ex) {

			redirectAttr
					.addFlashAttribute("resultMsg", "fail.common.duplicate");
		}

		return "redirect:/crm/customer/info.do?idx=" + vo.getCustomer_idx();
	}

	@RequestMapping("/crm/customer/organizer_info.do")
	public String customerAndOrganizerInfo(
			@RequestParam Map<String, Object> map, ModelMap model) {
		int idx = -1;
		if (map.containsKey("organizer_idx")) {
			idx = Integer.parseInt(map.get("organizer_idx").toString());
			model.addAttribute("result", service.selectOrganizer(idx));
			if (model.get("result") == null)
				model.addAttribute("check", 0);
			else {
				model.addAttribute("organizers", map.get("organizers"));
				model.addAttribute("indexinfo", idx);
				model.addAttribute("check", 1);
			}
		} else {
			model.addAttribute("check", 0);
		}
		return "mice/crm/customer/organizer_info";
	}

	@RequestMapping("/crm/organizer/list.do")
	public String organizerList(@ModelAttribute("OrganizerVO") OrganizerVO vo,
			ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = service.mapOrganizer(vo);
		
		int totCnt = (int) map.get("resultListCount");

		paginationInfo.setTotalRecordCount(totCnt);

		if(!vo.getSearchAddress().equals("")){
			List<OrganizerVO> organizerList = new ArrayList<OrganizerVO>();
			int organizerCount = 0;
			
			List<OrganizerVO> tmpList = (List<OrganizerVO>)map.get("resultList");
			for(int i=0;i<tmpList.size();i++){
				if(AESGenerator.decrypt(tmpList.get(i).getAddress_en()).indexOf(AESGenerator.decrypt(vo.getSearchAddress())) > -1 ||
						AESGenerator.decrypt(tmpList.get(i).getAddress_ko()).indexOf(AESGenerator.decrypt(vo.getSearchAddress())) > -1)
					organizerList.add(tmpList.get(i));
			}
			
			if(organizerList.size() > 0){
				model.addAttribute("resultList", organizerList);
				model.addAttribute("resultListCount", organizerList.size());
				paginationInfo.setTotalRecordCount(organizerList.size());
				model.addAttribute("vo", vo);
				model.addAttribute("paginationInfo", paginationInfo);
				return "mice/crm/organizer/list";
			}
			
		}
			
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		return "mice/crm/organizer/list";
	}

	@RequestMapping("/crm/organizer/info.do")
	public String organizerInfo(@RequestParam("idx") int idx, ModelMap model)
			throws Exception {
		model.addAttribute("result", service.selectOrganizer(idx));
		return "mice/crm/organizer/info";
	}

	@RequestMapping("/crm/organizer/customer_relationlist.do")
	public String organizerAndCustomerList(
			@RequestParam("organizer_idx") int idx, ModelMap model)
			throws Exception {
		model.addAttribute("result", service.selectOrganizer(idx));
		if (model.get("result") != null) {
			model.addAttribute("customerList",
					service.listOrganizerRelationCustomer(idx));
			model.addAttribute("relationList",
					service.listOrganizerRelation(idx));
		}
		return "mice/crm/organizer/customer_list";
	}

	@RequestMapping("/crm/organizer/event_relationlist.do")
	public String organizerAndEventList(@RequestParam Map<String, Object> map,
			ModelMap model) throws Exception {
		model.addAttribute("eventList", service
				.listEventOrganizerRelation(Integer.parseInt((String) map
						.get("eventparam"))));
		model.addAttribute("organizers", map.get("organizers"));
		return "mice/crm/organizer/event_list";
	}

	@RequestMapping("/crm/organizer/edit.do")
	public String organizerEdit(@RequestParam("idx") int idx, ModelMap model)
			throws Exception {
		model.addAttribute("result", service.selectOrganizer(idx));
		return "mice/crm/organizer/edit";
	}

	@RequestMapping("/crm/organizer/edit_action.do")
	public String organizerEditAction(
			@ModelAttribute("OrganizerVO") OrganizerVO vo, ModelMap model)
			throws Exception {
		service.updateOrganizer(vo);
		model.addAttribute("resultMsg", "success.common.update");
		return "redirect:/crm/organizer/info.do?idx=" + vo.getIdx();
	}

	@RequestMapping("/crm/organizer/insert.do")
	public String organizerInsert(ModelMap model) {
		return "mice/crm/organizer/insert";
	}

	@RequestMapping("/crm/organizer/insert_action.do")
	public String organizerInsertAction(
			@ModelAttribute("OrganizerVO") OrganizerVO vo, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		service.insertOrganizer(vo);
		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/crm/organizer/list.do";
	}

	@RequestMapping("/crm/organizer/delete_action.do")
	public String organizerDeleteAction(@RequestParam("idx") int idx,
			@ModelAttribute("OrganizerVo") OrganizerVO vo, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setExpire_id(user.getId());
		vo.setIdx(idx);
		service.deleteOrganizer(vo);
		model.addAttribute("resultMsg", "success.common.delete");
		return "redirect:/crm/organizer/list.do";
	}

	@RequestMapping("/crm/code/info.do")
	public String codeInfo(@ModelAttribute("CodeVO") CodeVO vo, ModelMap model)
			throws Exception {

		model.addAttribute("codes", service.listCodeType());
		if (vo.getSearchType() == "" && vo.getType() == "")
			vo.setSearchType("추진현황");
		else if (vo.getSearchType() == "" && vo.getType() != "")
			vo.setSearchType(vo.getType());
		model.addAttribute("resultList", service.listCode(vo));
		model.addAttribute("vo", vo);

		return "mice/crm/code/info";
	}

	@RequestMapping("/crm/code/update.do")
	public String codeUpdate(RedirectAttributes redirectAttr,
			@ModelAttribute("CodeVO") CodeVO vo, ModelMap model)
			throws Exception {
		service.updateCode(vo);
		model.addAttribute("CodeVO", vo);
		model.addAttribute("resultMsg", "success.common.update");
		redirectAttr.addFlashAttribute("CodeVO", vo);
		return "redirect:/crm/code/info.do";
	}

	@RequestMapping("/crm/code/delete.do")
	public String codeDelete(RedirectAttributes redirectAttr,
			@ModelAttribute("CodeVO") CodeVO vo, ModelMap model)
			throws Exception {
		service.deleteCode(vo);
		redirectAttr.addFlashAttribute("CodeVO", vo);
		redirectAttr.addFlashAttribute("resultMsg", "success.common.delete");
		return "redirect:/crm/code/info.do";
	}

	@RequestMapping("/crm/code/info_insert.do")
	public String codeInsert(RedirectAttributes redirectAttr,
			@ModelAttribute("CodeVO") CodeVO vo, ModelMap model)
			throws Exception {

		service.insertCode(vo);
		redirectAttr.addFlashAttribute("CodeVO", vo);
		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/crm/code/info.do";
	}

	@RequestMapping(value = "/crm/customer/excel_download.do", method = RequestMethod.POST)
	public View viewExcelCustomer(@ModelAttribute("CustomerVO") CustomerVO vo,
			Model model) throws Exception {

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(999999);
		vo.setSearchCountry("");
		
		
		Map<String, Object> map = service.mapCustomer(vo);
		List<CustomerVO> list = (List<CustomerVO>) map.get("resultList");

		int j = 0;
		for (int i = 0; i < list.size(); i++) {
			j = i + 1;
			Class klass = Class.forName("com.mice.crm.service.Customer");
			setFieldValue(klass, "idx", i, list, Integer.toString( list.get(i).getIdx() ) );
			setFieldValue(klass, "name_ko", i, list, list.get(i).getName_ko());
			setFieldValue(klass, "name_en", i, list, list.get(i).getName_en());
			setFieldValue(klass, "position", i, list, list.get(i).getPosition());
			setFieldValue(klass, "sosoc_excel", i, list, list.get(i).getSosoc_excel());
			setFieldValue(klass, "department", i, list, list.get(i).getDepartment());
			setFieldValue(klass, "organizer_name", i, list, list.get(i).getOrganizer_name());
			setFieldValue(klass, "tel_no", i, list, list.get(i).getTel_no());
			setFieldValue(klass, "phone_no", i, list, list.get(i).getPhone_no());
			setFieldValue(klass, "email", i, list, list.get(i).getEmail());
			setFieldValue(klass, "fax_no", i, list, list.get(i).getFax_no());
			setFieldValue(klass, "zip_code", i, list, list.get(i).getZip_code());
			setFieldValue(klass, "address_ko", i, list, list.get(i).getAddress_ko());
			setFieldValue(klass, "address_en", i, list, list.get(i).getAddress_en());
			setFieldValue(klass, "manager_nm", i, list, list.get(i).getManager_nm());
			setFieldValue(klass, "newsletter", i, list, list.get(i).getNewsletter());
			setFieldValue(klass, "country", i, list, list.get(i).getCountry());
			setFieldValue(klass, "user_nm", i, list, list.get(i).getUser_nm());
			setFieldValue(klass, "etc", i, list, list.get(i).getEtc());
			
			//klass = Class.forName("com.mice.crm.service.CustomerVO");
			//setFieldValue(klass, "user_nm", i, list, list.get(i).getUser_nm());
			//setFieldValue(klass, "manager_nm", i, list, list.get(i).getManager_nm());
			//setFieldValue(klass, "address_ko", i, list, list.get(i).getAddress_ko());
			//setFieldValue(klass, "newsletter", i, list, list.get(i).getNewsletter());			
				
		}
		// 데이터를 담는 다.
		model.addAttribute("resultList", list);

		model.addAttribute("filename", "customer_info.xls");
		model.addAttribute("template_path","/excel_template/customers_template.xls");
		
		// 엑셀을 출력한다.
		return new ExcelExportView();
	}

	@RequestMapping(value = "/crm/organizer/excel_download.do", method = RequestMethod.POST)
	public View viewExcelOrganizer(
			@ModelAttribute("OrganizerVO") OrganizerVO vo, Model model)
			throws Exception {

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(999999);

		Map<String, Object> map = service.mapOrganizer(vo);

		List<OrganizerVO> list = (List<OrganizerVO>) map.get("resultList");

		for (int i = 0; i < list.size(); i++) {
			Class klass = Class.forName("com.mice.crm.service.Organizer");
			setFieldValue(klass, "tel_no", i, list, list.get(i).getTel_no());
			setFieldValue(klass, "email", i, list, list.get(i).getEmail());
			klass = Class.forName("com.mice.crm.service.OrganizerVO");
			setFieldValue(klass, "user_nm", i, list, list.get(i).getUser_nm());
		}

		// 데이터를 담는 다.
		model.addAttribute("resultList", list);
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		model.addAttribute("filename", "행사현황_" + sdf.format(date) + ".xls");
		model.addAttribute("template_path",
				"/excel_template/organizers_template.xls");
		// 엑셀을 출력한다.
		return new ExcelExportView();
	}

	@RequestMapping(value = "/crm/event/excel_download.do", method = RequestMethod.GET)
	public View viewExcelEvent(@ModelAttribute("EventVO") EventVO vo,
			Model model) throws Exception {

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(999999);

		Map<String, Object> map = service.mapEvent(vo);

		List<EventVO> list = (List<EventVO>) map.get("resultList");

		for (int i = 0; i < list.size(); i++) {
			Class klass = Class.forName("com.mice.crm.service.EventVO");
			setFieldValue(klass, "attract_staff_name", i, list, list.get(i)
					.getAttract_staff_name());
			setFieldValue(klass, "event_staff_name", i, list, list.get(i)
					.getEvent_staff_name());
			// klass = Class.forName("com.mice.crm.service.OrganizerVO");
			setFieldValue(klass, "manager_1_name", i, list, list.get(i)
					.getManager_1_name());
			setFieldValue(klass, "manager_2_name", i, list, list.get(i)
					.getManager_2_name());
			setFieldValue(klass, "facility_text_description", i, list, list.get(i)
					.getFacility_text_description());
		}

		// 데이터를 담는 다.
		model.addAttribute("resultList", list);
		
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		model.addAttribute("filename", "행사현황_" + sdf.format(date) + ".xls");
		model.addAttribute("template_path",
				"/excel_template/event_template.xls");
		// 엑셀을 출력한다.
		return new ExcelExportView();
	}
	
	@RequestMapping(value = "/crm/event/excel_download2.do", method = RequestMethod.GET)
	public View viewExcelEvent2(@ModelAttribute("EventVO") EventVO vo,
			Model model) throws Exception {

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(999999);

		

		List<EventVO> list = service.listXlsEvent(vo);

		for (int i = 0; i < list.size(); i++) {
			Class klass = Class.forName("com.mice.crm.service.EventVO");
			setFieldValue(klass, "attract_staff_name", i, list, list.get(i)
					.getAttract_staff_name());
			setFieldValue(klass, "event_staff_name", i, list, list.get(i)
					.getEvent_staff_name());
			// klass = Class.forName("com.mice.crm.service.OrganizerVO");
			setFieldValue(klass, "manager_1_name", i, list, list.get(i)
					.getManager_1_name());
			setFieldValue(klass, "manager_2_name", i, list, list.get(i)
					.getManager_2_name());
		}

		// 데이터를 담는 다.
		model.addAttribute("resultList", list);

		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		model.addAttribute("filename", "행사_통계현황_" + sdf.format(date) + ".xls");
		model.addAttribute("template_path",
				"/excel_template/event_template2.xls");
		// 엑셀을 출력한다.
		return new ExcelExportView();
	}

	public void setFieldValue(Class klass, String fieldname, int i,
			List<?> list, String ob) {
		Field field;
		try {
			field = klass.getDeclaredField(fieldname);
			field.setAccessible(true);
			field.set(list.get(i), AESGenerator.decrypt(ob));
		} catch (NoSuchFieldException x) {
			x.printStackTrace();
		} catch (IllegalArgumentException x) {
			x.printStackTrace();
		} catch (IllegalAccessException x) {
			x.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/crm/customer/excel_upload.do", method = RequestMethod.POST)
	public String customerUpload(
			final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("CustomerVO") CustomerVO vo,
			RedirectAttributes redirectAttr, 
			BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		boolean fail = false;
		vo.setReg_id(user.getId());
		if (!files.isEmpty() && files.containsKey("excel")
				&& !files.get("excel").isEmpty()) {
			HashMap<String, String> fileMap = null;
			try {
				fileMap = fileUtil.uploadFile(files.get("excel"));
			} catch (Exception ex) {
				LOGGER.error(ex.getMessage());
				redirectAttr.addFlashAttribute("resultMsg", "excel.common.failfile");
				fail = true;
			}
			String filepath = fileMap.get("filePath")
					+ fileMap.get("uploadFileName") + "."
					+ fileMap.get("fileExtension");
			File file = new File(filepath);
			
			ExcelMapping mapp = null;
			try
			{
				mapp = new ExcelMapping(service, user.getId());
				mapp.excelFileUpload(file, "customer");
			}catch(Exception ex){
				redirectAttr.addFlashAttribute("resultMsg", "excel.common.failtemplate");
				LOGGER.error(ex.getMessage());
				fail = true;
			}finally{
				mapp = null;
			}
		}

		if(fail == false)
			redirectAttr.addFlashAttribute("resultMsg", "success.common.insert");
		
		return "redirect:/crm/customer/list.do";
	}

	@RequestMapping(value = "/crm/organizer/excel_upload.do", method = RequestMethod.POST)
	public String organizerUpload(
			final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("OrganizerVO") OrganizerVO vo,
			BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		vo.setReg_id(user.getId());
		if (!files.isEmpty() && files.containsKey("excel")
				&& !files.get("excel").isEmpty()) {
			HashMap<String, String> fileMap = null;
			try {
				fileMap = fileUtil.uploadFile(files.get("excel"));
			} catch (Exception ex) {
				LOGGER.error(ex.getMessage());
			}
			String filepath = fileMap.get("filePath")
					+ fileMap.get("uploadFileName") + "."
					+ fileMap.get("fileExtension");
			File file = new File(filepath);

			ExcelMapping mapp = new ExcelMapping(service, user.getId());
			mapp.excelFileUpload(file, "organizer");
			mapp = null;
		}

		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/crm/organizer/list.do";
	}

	@RequestMapping(value = "/crm/event/excel_upload.do", method = RequestMethod.POST)
	public String eventUpload(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("EventVO") EventVO vo,
			BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		vo.setReg_id(user.getId());
		if (!files.isEmpty() && files.containsKey("excel")
				&& !files.get("excel").isEmpty()) {
			HashMap<String, String> fileMap = null;
			try {
				fileMap = fileUtil.uploadFile(files.get("excel"));
			} catch (Exception ex) {
				LOGGER.error(ex.getMessage());
			}
			String filepath = fileMap.get("filePath")
					+ fileMap.get("uploadFileName") + "."
					+ fileMap.get("fileExtension");
			File file = new File(filepath);

			ExcelMapping mapp = new ExcelMapping(service, user.getId());
			mapp.excelFileUpload(file, "event");
			mapp = null;
		}

		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/crm/event/list.do";
	}

	@RequestMapping("/crm/code/select_box.do")
	public String codeSelectBox(@ModelAttribute("CodeVO") CodeVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		model.addAttribute("name", map.get("name"));
		vo.setSearchType(map.get("type").toString());
		model.addAttribute("resultList", service.listCode(vo));
		if (map.containsKey("result") && map.get("result").hashCode() != 0)
			model.addAttribute("result", map.get("result"));
		return "mice/crm/code/select_box";
	}


	@RequestMapping("/crm/code/select_box2.do")
	public String codeSelectBox2(@ModelAttribute("CodeVO") CodeVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		model.addAttribute("name", map.get("name"));
		vo.setSearchType(map.get("type").toString());
		model.addAttribute("resultList", service.listCode(vo));
		if (map.containsKey("result") && map.get("result").hashCode() != 0)
			model.addAttribute("result", map.get("result"));
		return "mice/crm/code/select_box2";
	}
	

	
	@RequestMapping("/crm/code/check_box.do")
	public String codeCheckBox(@ModelAttribute("CodeVO") CodeVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		model.addAttribute("name", map.get("name"));
		model.addAttribute("li", map.get("li"));
		
		vo.setSearchType(map.get("type").toString());
		model.addAttribute("resultList", service.listCode(vo));
		if (map.containsKey("result") && map.get("result").hashCode() != 0){
			model.addAttribute("result", map.get("result").toString().replace("[","").replace("]","").replace(" ", ""));
			
		}
		else{
			
			model.addAttribute("result", "");
		}
		return "mice/crm/code/check_box";
	}

	@RequestMapping("/crm/code/select_box_facility.do")
	public String codeSelectBoxFacility(@RequestParam Map<String, Object> map,
			ModelMap model) throws Exception {
		model.addAttribute("name", map.get("name"));
		model.addAttribute("resultList", service.listCodeFacility());
		if (map.containsKey("result") && map.get("result").hashCode() != 0)
			model.addAttribute("result", map.get("result"));
		return "mice/crm/code/select_box";
	}

	@RequestMapping("/crm/customer/organizer_mini_list.do")
	public String customerOrganizerMiniList(@ModelAttribute OrganizerVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		model.addAttribute("resultList", service.listCustomerRelation(Integer
				.parseInt(map.get("idx").toString())));
		return "mice/crm/customer/organizer_mini_list";
	}

	@RequestMapping("/crm/event/insert.do")
	public String eventInsert(@ModelAttribute EventVO vo,
			@ModelAttribute OrganizerVO organizerVO, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		organizerVO.setFirstIndex(0);
		organizerVO.setRecordCountPerPage(9999);
		model.addAttribute("organizerList", service.listOrganizer(organizerVO));
		model.addAttribute("loginVO", user);
		return "mice/crm/event/insert";
	}

	/*
	 * @RequestMapping("/crm/event/list.do") public String
	 * eventList(@ModelAttribute EventVO vo,
	 * 
	 * @ModelAttribute OrganizerVO organizerVO, ModelMap model) throws Exception
	 * {
	 * 
	 * organizerVO.setFirstIndex(0); organizerVO.setRecordCountPerPage(9999);
	 * model.addAttribute("organizerList", service.listOrganizer(organizerVO));
	 * return "mice/crm/event/insert"; }
	 */

	@RequestMapping("/crm/manager/select_box.do")
	public String userSelectBox(@RequestParam Map<String, Object> map,
			@ModelAttribute UserDefaultVO vo, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(9999);
		model.addAttribute("name", map.get("name"));
		model.addAttribute("managerList", userService.selectUserList(vo));
		
		if(map.containsKey("result") && map.get("result").equals("myid")){
			model.addAttribute("result", user.getId());
		}
		else if (map.containsKey("result") && map.get("result").hashCode() != 0)
			model.addAttribute("result", map.get("result"));
		else
			model.addAttribute("result", new Object());
		
		return "mice/crm/manager/select_box";
	}

	/*
	 * @RequestMapping(value = "/crm/manager/organizer_member.do", method =
	 * RequestMethod.POST)
	 */
	@RequestMapping(value = "/crm/manager/organizer_member.do")
	public String organizerRelationCustomerList(
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		if(map.containsKey("organizer_idx") && !map.get("organizer_idx").equals("")){
			model.addAttribute("resultList",service.listOrganizerRelationCustomer(Integer.parseInt(map.get("organizer_idx").toString())));
			model.addAttribute("dataid",map.get("organizer_idx")) ;
			model.addAttribute("name", map.get("name"));
			model.addAttribute("target", map.get("target"));
			model.addAttribute("result", map.get("result"));
			java.util.Date date = new java.util.Date();
			SimpleDateFormat sdf = new SimpleDateFormat("hhmmss");
			model.addAttribute("hhmmss", sdf.format(date));
		}
		return "mice/crm/manager/organizer_member_list";
	}

	@RequestMapping(value = "/crm/event/insert_action.do", method = RequestMethod.POST)
	public String eventInsertAction(
		final MultipartHttpServletRequest multiRequest,
		RedirectAttributes redirectAttr, @ModelAttribute EventVO vo,
		BindingResult bindingResult, SessionStatus status, ModelMap model)
		throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		vo.setReg_id(user.getId());

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";

		service.insertEvent(vo);

		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {
			
			for (int i = 0; i < map.getValue().size(); i++) {
				result = fileUtil.parseFileInf(
						getFileMap(map.getKey(), map.getValue().get(i)),
						"FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				if(atchFileId != null && !atchFileId.equals(""))
				{
					EventAttachFile file = new EventAttachFile();
					file.setFile_id(atchFileId);
					file.setCrm_event_idx(vo.getIdx());
					file.setType(map.getKey());
					service.insertEventAttachFile(file);
				}
			}
		}

		
		
		/* 추가기관 등록 */
		EventPlusVO evo = new EventPlusVO();
		evo.setCrm_event_idx(vo.getIdx());
		
		String org_nm = "";
		String org_mem = "";
		for(int i =0; i<vo.getPlus_org().size();i++){
			org_nm = vo.getPlus_org().get(i);
			org_mem = vo.getPlus_org_member().get(i);
			if(org_nm.equals("")) org_nm = "0";
			if(org_mem.equals("")) org_mem = "0";
				
			evo.setOrganizer_idx( Integer.parseInt(org_nm));
			evo.setCustomer_idx( Integer.parseInt(org_mem) );
			
			service.insertEventPlus(evo);
		}
		

		/* 행사분야 등록 */
		EventThemeVO tvo = new EventThemeVO();
		tvo.setCrm_event_idx(vo.getIdx());
		for(int i =0; i<vo.getEvent_theme().size();i++){
			tvo.setCrm_event_idx(vo.getIdx());
			tvo.setEvent_theme( vo.getEvent_theme().get(i) );
			
			service.insertEventTheme(tvo);
		}	
		
		

		
		
		redirectAttr.addFlashAttribute("resultMsg", "success.common.insert");
		return "redirect:/crm/event/list.do";
	}

	@RequestMapping("/crm/event/list.do")
	public String eventList(@ModelAttribute EventVO vo, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();


		// 협력사의 경우 유치추진과 실패/보류를 보여주지 않음.
		if(user.getUserSe().equals("ENT"))
			vo.setCowork("1");
		
		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = service.mapEvent(vo);

		int totCnt = (int) map.get("resultListCount");

		paginationInfo.setTotalRecordCount(totCnt);

		OrganizerVO organizerVO = new OrganizerVO();
		organizerVO.setFirstIndex(0);
		organizerVO.setRecordCountPerPage(9999);
		model.addAttribute("organizerList", service.listOrganizer(organizerVO));
		
		List<EventVO> list = (List<EventVO>)map.get("resultList");
		model.addAttribute("resultList", list);
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		EventVO calculartor = service.selectSummary(vo);
		List<EventVO> lists = service.listSummary(vo);
		SummaryEventCalculator cal = new SummaryEventCalculator();
		model.addAttribute("SummaryTotalParticipant",calculartor.getJoin_personal_cnt());
		model.addAttribute("SummaryForeigner",calculartor.getJoin_foreigner_cnt());
		model.addAttribute("SummaryNational",calculartor.getJoin_nationals_cnt());
		model.addAttribute("SummaryBooth",calculartor.getBooth_cnt());
		
		model.addAttribute("SummaryRentCost",calculartor.getRent_cost());
		model.addAttribute("SummaryFoodCost",calculartor.getFood_cost());
		model.addAttribute("SummaryAVCost",calculartor.getAv_rental_cost());
		model.addAttribute("SummaryManageCost",calculartor.getManager_cost());
		model.addAttribute("SummaryExhibitionScale",calculartor.getExhibition_scale());
		model.addAttribute("SummaryEstimateCost",calculartor.getEstimate_cost());
		model.addAttribute("SummaryTotalCost",calculartor.getTotal_cost());
		CRMCodeExtVO codeVO = new CRMCodeExtVO();
		codeVO.setSearchName("면적");
		List<CRMCodeExt> codeP = service.listCodeExt(codeVO); //면적
		codeVO.setSearchName("단가");
		List<CRMCodeExt> codeV = service.listCodeExt(codeVO); //매출
		int day = 1;
		
		day = calculartor.getDiffDay();
		
		if(day == 0)
			day = 1;
		
		//float area = (cal.SummaryArea(lists, codeP) * day) / (cal.TotalRentArea() * day);
		float area = (cal.SummaryArea(lists, codeP)) / (cal.TotalRentArea() * day);
		area = area * 100;
		model.addAttribute("SummaryArea",String.format("%.2f",  area));
		float areaCost = cal.SummaryAreaCost(lists, codeV) / (cal.TotalCost() * day);
		
		areaCost = areaCost * 100;
		
		model.addAttribute("SummaryAreaCost",String.format("%.2f",areaCost));
		
		List<CRMCodeExt> codeIP = new ArrayList<CRMCodeExt>();
		for(CRMCodeExt ext : codeP){
			if(ext.getParent_idx() == 55 || ext.getParent_idx() == 56)
				codeIP.add(ext);
		}
		
		area = (cal.SummaryInnerArea(lists, codeIP)) / (cal.TotalInnerRentArea() * day);
		area = area * 100;
		model.addAttribute("SummaryInnerArea", String.format("%.2f",area));
		return "mice/crm/event/list";
	}

	@RequestMapping("/crm/event/info.do")
	public String eventInfo(@RequestParam("idx") int idx, ModelMap model)
			throws Exception {

		try {
			List arrlist = new ArrayList();
			
			Event event = service.selectEvent(idx);
			String[] strIdx = event.getRent_facility_text().split(",");
			
			for(int i=0; i < strIdx.length; i++) {
				arrlist.add(strIdx[i]);
			}
			
			HashMap map = new HashMap();
			map.put("idxList", arrlist);
			
			List<CodeVO> list = service.selectListCode(map);
			
			HashMap codeMap = new HashMap();
			
			String strValue1 = "";
			String strValue2 = "";
			String strValue3 = "";
			String strValue4 = "";
			String strValueTheme = "";
			
			for (int i = 0; i < list.size(); i++) {
				switch (list.get(i).getType()) {
				case "1층" :
					if (!"".equals(strValue1)) {
						strValue1 += ", ";
					}
					strValue1 += list.get(i).getValue();
					break;
				case "2층" :
					if (!"".equals(strValue2)) {
						strValue2 += ", ";
					}
					strValue2 += list.get(i).getValue();
					break;
				case "3층" :
					if (!"".equals(strValue3)) {
						strValue3 += ", ";
					}
					strValue3 += list.get(i).getValue();
					break;
				case "기타" :
					if (!"".equals(strValue4)) {
						strValue4 += ", ";
					}
					strValue4 += list.get(i).getValue();
					break;
				case "행사분야" :
					if (!"".equals(strValueTheme)) {
						strValueTheme += ", ";
					}
					strValueTheme += list.get(i).getValue();
					break;					
					
				}
			}
			
			codeMap.put("f1", strValue1);
			codeMap.put("f2", strValue2);
			codeMap.put("f3", strValue3);
			codeMap.put("f4", strValue4);
			codeMap.put("theme", strValueTheme);
			
	//		System.out.println("idx = " + event.getRent_facility_text());
			
			//추가기관
			EventPlusVO evo = new EventPlusVO();
			evo.setCrm_event_idx(idx);
			model.addAttribute("orgPlusList", service.listEventPlus(evo));
			
			
		
			model.addAttribute("result", event);
			model.addAttribute("codeResult", codeMap);
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}

		return "mice/crm/event/info";
	}

	@RequestMapping("/crm/event/edit.do")
	public String eventEdit(@RequestParam("idx") int idx, ModelMap model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		model.addAttribute("result", service.selectEvent(idx));
		OrganizerVO organizerVO = new OrganizerVO();
		organizerVO.setFirstIndex(0);
		organizerVO.setRecordCountPerPage(9999);
		
		//추가기관 
		EventPlusVO evo = new EventPlusVO();
		evo.setCrm_event_idx(idx);
		
		
		model.addAttribute("orgPlusList", service.listEventPlus(evo));
		model.addAttribute("organizerList", service.listOrganizer(organizerVO));
		model.addAttribute("loginVO", user);
		return "mice/crm/event/edit";
	}

	@RequestMapping(value = "/crm/event/edit_action.do", method = RequestMethod.POST)
	public String eventEditAction(
			final MultipartHttpServletRequest multiRequest,
			RedirectAttributes redirectAttr, @ModelAttribute EventVO vo,
			BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";

		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {

			for (int i = 0; i < map.getValue().size(); i++) {
				result = fileUtil.parseFileInf(
						getFileMap(map.getKey(), map.getValue().get(i)),
						"FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				if (atchFileId != null && !atchFileId.equals(""))
				{
					EventAttachFile file = new EventAttachFile();
					file.setFile_id(atchFileId);
					file.setCrm_event_idx(vo.getIdx());
					file.setType(map.getKey());
					service.insertEventAttachFile(file);
				}
			}
		}

		service.updateEvent(vo);


		
		
		/* 추가기관 등록 */
		EventPlusVO evo = new EventPlusVO();
		evo.setCrm_event_idx(vo.getIdx());
		service.deleteEventPlus(evo);
		
		String org_nm = "";
		String org_mem = "";
		for(int i =0; i<vo.getPlus_org().size();i++){
			org_nm = vo.getPlus_org().get(i);
			org_mem = vo.getPlus_org_member().get(i);
			if(org_nm.equals("")) org_nm = "0";
			if(org_mem.equals("")) org_mem = "0";
				
			evo.setOrganizer_idx( Integer.parseInt(org_nm));
			evo.setCustomer_idx( Integer.parseInt(org_mem) );
					
			service.insertEventPlus(evo);
		}
		

		/* 행사분야 등록 */
		EventThemeVO tvo = new EventThemeVO();
		tvo.setCrm_event_idx(vo.getIdx());
		service.deleteEventTheme(tvo);
		for(int i =0; i<vo.getEvent_theme().size();i++){
			tvo.setCrm_event_idx(vo.getIdx());
			tvo.setEvent_theme( vo.getEvent_theme().get(i) );
			
			service.insertEventTheme(tvo);
		}				
		
		
		
		
		
		
		redirectAttr.addFlashAttribute("resultMsg", "success.common.update");
		return "redirect:/crm/event/info.do?idx=" + vo.getIdx();
	}

	@RequestMapping("/crm/event/attach_file_list.do")
	public String eventAttachFileList(
			@RequestParam("event_idx") int event_idx,
			@RequestParam("type") String type,
			@RequestParam(value = "show_delete_btn", required = false, defaultValue = "Y") String delete,
			@ModelAttribute EventVO vo, ModelMap model) throws Exception {

		vo.setIdx(event_idx);
		vo.setSearchAttachFileType(type);
		model.addAttribute("resultList", service.listEventAttachFile(vo));
		model.addAttribute("delete", delete);
		return "mice/crm/event/attach_file_list";
	}

	@RequestMapping(value = "/crm/event/delete_attach_file.do")
	public void eventAttachFileDelete(HttpServletResponse response,
			@RequestParam("idx") int idx, RedirectAttributes redirectAttr,
			ModelMap model) throws Exception {
		OutputStream os = null;
		service.deleteEventAttachFile(idx);
		os = response.getOutputStream();
		os.write("success.common.update".getBytes());
	}

	@RequestMapping("/crm/event/delete_action.do")
	public String eventDelete(RedirectAttributes redirectAttr,
			@RequestParam("idx") int idx, @ModelAttribute EventVO vo,
			ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setExpire_id(user.getId());
		vo.setIdx(idx);
		service.deleteEvent(vo);
		redirectAttr.addFlashAttribute("resultMsg", "success.common.delete");
		return "redirect:/crm/event/list.do";
	}
	
	@RequestMapping("/crm/event/promotion_end.do")
	public String promotionEnd(ModelMap model)
			throws Exception {

		return "mice/crm/event/promotion_end";
	}

	
	@RequestMapping("/crm/event/promotion_insert.do")
	public String promotionInsert(@RequestParam("idx") int idx, @RequestParam("promotion_type") String promotion_type, ModelMap model)
			throws Exception {

		return "mice/crm/event/promotion_insert";
	}

	@RequestMapping("/crm/event/promotion_insert_action.do")
	public String promotionInsertAction(
			final MultipartHttpServletRequest multiRequest,
			RedirectAttributes redirectAttr, @ModelAttribute PromotionVO vo,
			@RequestParam Map<String, Object> param_map,
			ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String atchFileId = "";
		List<FileVO> result = null;

		vo.setReg_id(user.getId());
		service.insertPromotion(vo);

		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {
			result = fileUtil.parseFileInf(
					getFileMap(map.getKey(), map.getValue().get(0)), "FRM_", 0,
					"", "");
			atchFileId = fileMngService.insertFileInfs(result);
			if(atchFileId != null && !atchFileId.equals("")) {
				PromotionAttachFile file = new PromotionAttachFile();
				file.setFile_id(atchFileId);
				file.setPromotion_idx(vo.getIdx());
				file.setReg_id(user.getId());
				service.insertPromotionAttachFile(file);
			}
		}

		redirectAttr.addFlashAttribute("resultMsg", "success.common.insert");

		if (param_map.containsKey("redirect_url") && !param_map.get("redirect_url").equals("")){
			return "redirect:" + param_map.get("redirect_url");
		}else if(vo.getPromotion_type().equals("E")){
			return "redirect:/crm/event/info.do?idx=" + vo.getParent_idx();
		}else if(vo.getPromotion_type().equals("O")){
			return "redirect:/crm/organizer/info.do?idx=" + vo.getParent_idx();
		}else if(vo.getPromotion_type().equals("I")){
			return "redirect:/crm/invite/info.do?idx=" + vo.getParent_idx();
		}else{
			return "redirect:/";
		}		
	}

	@RequestMapping(value = "/crm/event/promotion_info.do", method = RequestMethod.GET)
	public String promotioninfo(@RequestParam("idx") int idx, ModelMap model)
			throws Exception {
		model.addAttribute("result", service.selectPromotion(idx));
		return "mice/crm/event/promotion_info";
	}

	@RequestMapping("/crm/event/promotion_edit.do")
	public String promotionEdit(@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {
		model.addAttribute("result", service.selectPromotion(Integer.valueOf(map.get("idx").toString())));
		return "mice/crm/event/promotion_edit";
	}

	@RequestMapping("/crm/event/promotion_edit_action.do")
	public String promotionEditAction(
			final MultipartHttpServletRequest multiRequest,
			RedirectAttributes redirectAttr,
			@RequestParam Map<String, Object> param_map,
			@ModelAttribute PromotionVO vo, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String atchFileId = "";
		List<FileVO> result = null;

		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {

			for (int i = 0; i < map.getValue().size(); i++) {
				result = fileUtil.parseFileInf(
						getFileMap(map.getKey(), map.getValue().get(i)),
						"FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				if(atchFileId != null && !atchFileId.equals(""))
				{
					PromotionAttachFile file = new PromotionAttachFile();
					file.setFile_id(atchFileId);
					file.setPromotion_idx(vo.getIdx());
					file.setReg_id(user.getId());
					service.insertPromotionAttachFile(file);
				}
			}
		}

		service.updatePromotion(vo);
		redirectAttr.addFlashAttribute("resultMsg", "success.common.update");
		
		if (param_map.containsKey("redirect_url") && !param_map.get("redirect_url").equals("")){
			return "redirect:" + param_map.get("redirect_url");
		}else if(vo.getPromotion_type().equals("E")){
			return "redirect:/crm/event/info.do?idx=" + vo.getParent_idx();
		}else if(vo.getPromotion_type().equals("O")){
			return "redirect:/crm/organizer/info.do?idx=" + vo.getParent_idx();
		}else if(vo.getPromotion_type().equals("I")){
			return "redirect:/crm/invite/info.do?idx=" + vo.getParent_idx();
		}else{
			return "redirect:/";
		}
		
		
		
			
	}

	@RequestMapping("/crm/event/promotion_delete_action.do")
	public String promotionDeleteAction(RedirectAttributes redirectAttr,
			@RequestParam Map<String, Object> param_map,
			@ModelAttribute PromotionVO vo, ModelMap model) throws Exception {
		service.deletePromotion(vo);
		redirectAttr.addFlashAttribute("resultMsg", "success.common.delete");
		
		if (param_map.containsKey("redirect_url") && !param_map.get("redirect_url").equals("")){
			return "redirect:" + param_map.get("redirect_url");
		}else if(vo.getPromotion_type().equals("E")){
			return "redirect:/crm/event/info.do?idx=" + vo.getParent_idx();
		}else if(vo.getPromotion_type().equals("O")){
			return "redirect:/crm/organizer/info.do?idx=" + vo.getParent_idx();
		}else if(vo.getPromotion_type().equals("I")){
			return "redirect:/crm/invite/info.do?idx=" + vo.getParent_idx();
		}else{
			return "redirect:/";
		}
	}

	@RequestMapping("/crm/event/promotion_list.do")
	public String EventPromotionList(@RequestParam Map<String, Object> map,
			@ModelAttribute PromotionVO vo, ModelMap model) throws Exception {

		vo.setParent_idx(map.get("parent_idx").toString());
		vo.setPromotion_type(map.get("promotion_type").toString());
		
		model.addAttribute("resultList",
				service.listEventRelationPromotion(vo));
		return "mice/crm/promotion/result_list";
	}

	@RequestMapping("/crm/promotion/list.do")
	public String promotionList(@ModelAttribute PromotionVO vo, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		//if(vo.getSearchCnd().equals("1")){
		//	paginationInfo.setRecordCountPerPage(9999);
		//}else
			paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = service.mapPromotion(vo);

		/*
		if(vo.getSearchCnd().equals("1")){
			List<PromotionVO> listPromotionVO = new ArrayList<PromotionVO>();
			List<PromotionVO> tmpPromotion = (List<PromotionVO>)map.get("resultList");
			for(int i=0;i<tmpPromotion.size();i++){
				if(AESGenerator.decrypt(tmpPromotion.get(i).getUser_nm()).indexOf(AESGenerator.decrypt(vo.getSearchWrd())) > -1) 
					listPromotionVO.add(tmpPromotion.get(i));
			}
						
				map.put("resultList", listPromotionVO);
				map.put("resultListCount", listPromotionVO.size());
			
		}
		*/
		
		
		
		int totCnt = (int) map.get("resultListCount");

		paginationInfo.setTotalRecordCount(totCnt);

		OrganizerVO organizerVO = new OrganizerVO();
		organizerVO.setFirstIndex(0);
		organizerVO.setRecordCountPerPage(9999);
		model.addAttribute("organizerList", service.listOrganizer(organizerVO));

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);
		
    	return "mice/crm/promotion/list";
    }
    
    @RequestMapping("/crm/promotion/attach_file_list.do")
	public String promotionAttachFileList(
			@RequestParam("promotion_idx") int promotion_idx, ModelMap model)
			throws Exception {

		model.addAttribute("resultList",
				service.listPromotionAttachFile(promotion_idx));

		return "mice/crm/promotion/attach_file_list";
	}

	@RequestMapping("/crm/promotion/delete_attach_file.do")
	public void promotionAttachFileDelete(HttpServletResponse response,
			@RequestParam("idx") String idx, ModelMap model)
			throws Exception {
		OutputStream os = null;
		service.deletePromotionAttachFile(idx);
		os = response.getOutputStream();
		os.write("success.common.update".getBytes());
	}

	@RequestMapping("/crm/event/calendar.do")
	public String eventCalendarList(@RequestParam(required = false) Map<String, Object> map, @ModelAttribute EventCalendarVO vo,
			ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String year = "";
    	String month = "";

    	if(map.containsKey("searchYear")){
    		year = map.get("searchYear").toString();
    		vo.setSearchYear(year);
    	}
    	if(map.containsKey("searchMonth")){
    		month = map.get("searchMonth").toString();
    		vo.setSearchMonth(month);
    	}
    	if(month.length() == 1){
    		vo.setSearchMonth("0" + month);
    	}
    	
    	if(map.containsKey("searchMonth") && map.get("searchMonth").equals("0")){
    		vo.setSearchYear(Integer.toString((Integer.parseInt(year) -1)));
    		vo.setSearchMonth("12");
    	}
    	if(map.containsKey("searchMonth") && map.get("searchMonth").equals("13")){
    		vo.setSearchYear(Integer.toString((Integer.parseInt(year) +1)));
    		vo.setSearchMonth("01");
    	}
    	List<EventCalendarVO> listCalendar =service.listCalendar(vo);
    	/*if(vo.getSearchPlaceIdx() == "") if(vo.getSearchPlaceIdx() == "") <-- 이거 빼면 오류남~~~*/
    	if(vo.getSearchPlaceIdx() == "")
    		vo.setSearchPlaceIdx("-1");
    	model.addAttribute("auth", user.getUserSe());
    	
    	model.addAttribute("result", vo);
    	model.addAttribute("resultList", listCalendar);
    	if(map.containsKey("pop"))
    		return "mice/crm/event/calendar_pop";
    	else
    		return "mice/crm/event/calendar";
    }

	//기관단체 검색
	@RequestMapping("/crm/event/search_organizer.do")
	public ModelAndView searchOrganizerList(@RequestParam(required = false) Map<String, Object> map, ModelMap model) throws Exception{
		String name = map.get("name").toString();
		Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("resultList", service.searchOrganizer(name));
		
	    ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    return modelAndView;
	}
	
	@RequestMapping("/crm/event/addOrganizer.do")
	public String addOrganizerView(@RequestParam(required = false) Map<String, Object> map,  @ModelAttribute OrganizerVO vo, ModelMap model) throws Exception{
		
		model.addAttribute("dataid", map.get("data-id"));
		model.addAttribute("hhmmss", map.get("hhmmss"));
		return "mice/crm/event/addOrganizer";
	}
	
	@RequestMapping("/crm/event/addCustomer.do")
	public String addCustomerView(@RequestParam(required = false) Map<String, Object> map,  @ModelAttribute CustomerVO vo, ModelMap model) throws Exception{
		
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hhmmss");
		model.addAttribute("dataid", map.get("data-id"));
		model.addAttribute("hhmmss", sdf.format(date));
		model.addAttribute("name", map.get("name"));
		model.addAttribute("target", map.get("target"));
		return "mice/crm/event/addCustomer";
	}
	
	@RequestMapping("/crm/event/addOrganizer_action.do")
	public ModelAndView addOrganizerAction(@ModelAttribute OrganizerVO vo, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try
		{
			int idx =  service.insertOrganizer(vo);
			resultMap.put("organizer", service.selectOrganizer(idx));
			resultMap.put("result", true);
		}catch(Exception ex){
			resultMap.put("result", false);
		}
	   
		ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    return modelAndView;
	}
	
	@RequestMapping("/crm/event/addCustomer_action.do")
	public ModelAndView addCustomerAction(@RequestParam(required = false) Map<String, Object> map, @ModelAttribute CustomerVO vo, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try
		{
			
			String name = (String) map.get("name");
			int idx =  service.insertCustomer(vo);
			CustomerOrganizerRelationVO oVO = new CustomerOrganizerRelationVO();
			oVO.setOrganizer_idx(Integer.parseInt(map.get("organizer_idx").toString()));
			oVO.setCustomer_idx(idx);
			service.insertCustomerNOrganizer(oVO);
			resultMap.put("customer", service.selectCustomer(idx));
			resultMap.put("name", name);
			resultMap.put("result", true);
		}catch(Exception ex){
			resultMap.put("result", false);
		}
	   
		ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    return modelAndView;
	}
	private Map<String, MultipartFile> getFileMap(String key, MultipartFile file){
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;
	}
	
	@RequestMapping("/crm/stastics/info.do")
	public String stasticsInfo(ModelMap model)
			throws Exception {
		return "mice/crm/stastics/info";
	}
}