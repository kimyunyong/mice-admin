package com.mice.crm.web;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.mice.common.encrypt.AESGenerator;
import com.mice.crm.service.CRMInviteService;
import com.mice.crm.service.CRMService;
import com.mice.crm.service.CustomerOrganizerRelationVO;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.EventAttachFile;
import com.mice.crm.service.EventPlusVO;
import com.mice.crm.service.EventThemeVO;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.FileVO;
import com.mice.crm.service.InviteOpinionVO;
import com.mice.crm.service.InvitePersonVO;
import com.mice.crm.service.InviteSupportVO;
import com.mice.crm.service.InviteVO;
import com.mice.crm.service.OrganizerVO;
import com.mice.crm.service.PromotionAttachFile;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 *  
 * 	@이름 : 유치활동관리
 * 	@최초생성일 : 20171219
 * 	@최초작성자 : 푸른들 김윤용
 * 	@설명 : 유치활동관리 - 리스트, 세부 정보, 등록, 수정 외 controller
 *
**/
   
@Controller
public class CRMInviteController {
	
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComIndexController.class);
	
	@Resource(name = "CRMService")
	CRMService crmService;
	
	@Resource(name = "CRMInviteService")
	private CRMInviteService service;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "userManageService")
	private EgovUserManageService userService;
	
	@RequestMapping("/crm/invite/list.do")
	public String list(@ModelAttribute("vo") InviteVO vo, Model model){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		int cnt = service.getCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(cnt);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<InviteVO> getList = service.getAll(vo);
		model.addAttribute("getList", getList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		return "mice/crm/invite/list";
	}
	
	
	@RequestMapping(value="/crm/invite/insertForm.do", method=RequestMethod.GET)
	public String insertForm(@ModelAttribute("OrganizerVO") OrganizerVO vo, ModelMap model){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(10000);
		model.addAttribute("resultList", crmService.listOrganizer(vo));
		
		return "mice/crm/invite/insert";
	}
	
	@RequestMapping("/crm/invite/insertTemp.do")
	public ModelAndView insertTemp(@RequestParam String event_idx, @RequestParam String event_name, @RequestParam String implementation_status, 
			@RequestParam String place, @RequestParam String event_division_idx, @ModelAttribute("personVO") InvitePersonVO personVO, @RequestParam String flag){
		
		ModelAndView mav = new ModelAndView();
		InviteVO vo = new InviteVO();
		
		if(flag.equals("0")){
			vo.setName_ko(event_name);
			vo.setImplementation_status(implementation_status);
			vo.setPlace(place);
			vo.setEvent_division_idx(event_division_idx);
			
			service.insert(vo); // 행사 저장 (dao를 통해 마지막 idx 를 넣어 두었다. )
		}
				
		if(event_idx.equals("-1")){
			personVO.setInvite_idx(vo.getIdx());	// 행사 인덱스			
			mav.addObject("idx", vo.getIdx());
		}else{
			personVO.setInvite_idx(Integer.parseInt(event_idx));
			mav.addObject("idx", event_idx);
		}
		
		service.insertPerson(personVO);
		
		mav.addObject("flag", new String("1"));
		mav.setViewName("jsonView");
		return mav;
		
		
	}
	
	@RequestMapping("/crm/invite/insert.do")
	public String insert(@RequestParam String flag, @ModelAttribute("vo") InviteVO vo, 
			final MultipartHttpServletRequest multiRequest, Model model, @ModelAttribute InviteSupportVO ISVO) throws Exception{		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		
		if(flag.equals("0")){
			service.insert(vo);
		}else{
			service.update(vo);
		}
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<egovframework.com.cmm.service.FileVO> result = null;
		String atchFileId = "";
		
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
					file.setCrm_event_idx(service.getLastIndex());
					file.setType(map.getKey());
					crmService.insertEventAttachFile(file);
				}
			}
		}		
		
		EventThemeVO tvo = new EventThemeVO();
		tvo.setCrm_event_idx(vo.getIdx());
		for(int i =0; i<vo.getEvent_theme().size();i++){
			tvo.setCrm_event_idx(vo.getIdx());
			tvo.setEvent_theme( vo.getEvent_theme().get(i) );
			tvo.setReg_id(user.getId());
			service.insertInviteTheme(tvo);
		}
		
		List<String> costList = ISVO.getInvite_cost_list();
		List<String> etcList = ISVO.getInvite_cost_etc_list();
		List<String> typeList = ISVO.getInvite_cost_type_list();
		
		
		if(costList != null){
			for(int i=0; i<costList.size(); i++){
				InviteSupportVO setISVO = new InviteSupportVO();
				setISVO.setInvite_idx(vo.getIdx());
				setISVO.setInvite_cost(costList.get(i));
				setISVO.setInvite_cost_etc(etcList.get(i));
				setISVO.setInvite_cost_type(typeList.get(i));
				service.insertInviteSupport(setISVO);
			}
		}
		
		return "redirect:/crm/invite/list.do";
	}
		
	@RequestMapping(value="/crm/invite/modify.do", method=RequestMethod.GET)
	public String updateForm(@ModelAttribute("vo") InviteVO vo, Model model, @ModelAttribute("OrganizerVO") OrganizerVO organizerVO){
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		InviteVO getInvite = service.get(vo.getIdx());
		List<CustomerVO> getCustomer = service.getPersonList(vo.getIdx());
		
		FileVO fileVO = new FileVO();
		fileVO.setCrm_event_idx(vo.getIdx());
		
		fileVO.setType("event_attach_file");
		List<FileVO> getEventFile = service.getFile(fileVO);
		fileVO.setType("offer_attach_file");
		List<FileVO> getOfferFile = service.getFile(fileVO);		
		fileVO.setType("stats_attach_file");
		List<FileVO> getStatsFile = service.getFile(fileVO);
				
		EventThemeVO themeVO = new EventThemeVO();
		themeVO.setCrm_event_idx(vo.getIdx());
		
		List<EventThemeVO> getThemeList = service.listInviteTheme(themeVO);
		List<String> themeList = new ArrayList<String>();
		
		for(EventThemeVO list : getThemeList){
			themeList.add(list.getEvent_theme());
		}
		
		getInvite.setEvent_theme(themeList);
		
		InviteSupportVO vo1 = new InviteSupportVO();
		vo1.setInvite_idx(vo.getIdx());
		vo1.setInvite_cost_type("support");
		List<InviteSupportVO> getInviteSupport = service.getInviteSupport(vo1);
		
		InviteSupportVO vo2 = new InviteSupportVO();
		vo2.setInvite_idx(vo.getIdx());
		vo2.setInvite_cost_type("promotion");
		List<InviteSupportVO> getInvitePromotion = service.getInviteSupport(vo2);
		
		InviteSupportVO vo3 = new InviteSupportVO();
		vo3.setInvite_idx(vo.getIdx());
		vo3.setInvite_cost_type("open");
		List<InviteSupportVO> getInviteOpen = service.getInviteSupport(vo3);
		
		organizerVO.setFirstIndex(0);
		organizerVO.setRecordCountPerPage(10000);
		model.addAttribute("resultList", crmService.listOrganizer(organizerVO));
		
		model.addAttribute("getSupport", getInviteSupport);
		model.addAttribute("getPromotion", getInvitePromotion);
		
		model.addAttribute("getTheme", themeList);
		model.addAttribute("getEventFile", getEventFile);
		model.addAttribute("getOfferFile", getOfferFile);
		model.addAttribute("getStatsFile", getStatsFile);
		
		model.addAttribute("getCustomer", getCustomer);	
		model.addAttribute("getInvite", getInvite);
		model.addAttribute("getOpen", getInviteOpen);
		
		return "mice/crm/invite/modify";
	}
	
	@RequestMapping(value="/crm/invite/modify.do", method=RequestMethod.POST)
	public String update(@ModelAttribute("vo") InviteVO vo, @ModelAttribute("customerVO") CustomerVO customerVO, 
			@ModelAttribute InviteSupportVO ISVO, final MultipartHttpServletRequest multiRequest) throws Exception{		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		
		List<InvitePersonVO> personList = new ArrayList<InvitePersonVO>();
		
		if(customerVO.getIdx_Arr() != null){
			int idxArr[] = customerVO.getIdx_Arr();
		
			for(int i=0; i<idxArr.length; i++){
				InvitePersonVO personVO = new InvitePersonVO();
				personVO.setCustomer_idx(idxArr[i]);
				personVO.setInvite_idx(vo.getIdx());
				personList.add(personVO);
			}
		}
		
		service.update(vo, personList);
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<egovframework.com.cmm.service.FileVO> result = null;
		String atchFileId = "";
		
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
					file.setCrm_event_idx(service.getLastIndex());
					file.setType(map.getKey());
					crmService.insertEventAttachFile(file);
				}
			}
		}
		
		service.deleteInviteTheme(vo.getIdx());
		
		EventThemeVO tvo = new EventThemeVO();
		tvo.setCrm_event_idx(vo.getIdx());
		for(int i =0; i<vo.getEvent_theme().size();i++){
			tvo.setCrm_event_idx(vo.getIdx());
			tvo.setEvent_theme( vo.getEvent_theme().get(i) );
			tvo.setReg_id(user.getId());
			service.insertInviteTheme(tvo);
		}	
		
		service.deleteInviteSupport(vo.getIdx());
		
		List<String> costList = ISVO.getInvite_cost_list();
		List<String> etcList = ISVO.getInvite_cost_etc_list();
		List<String> typeList = ISVO.getInvite_cost_type_list();
		
		
		if(costList != null){
			for(int i=0; i<costList.size(); i++){
				InviteSupportVO setISVO = new InviteSupportVO();
				setISVO.setInvite_idx(vo.getIdx());
				setISVO.setInvite_cost(costList.get(i));
				setISVO.setInvite_cost_etc(etcList.get(i));
				setISVO.setInvite_cost_type(typeList.get(i));
				service.insertInviteSupport(setISVO);
			}
		}
		
		return "redirect:/crm/invite/info.do?idx=" + vo.getIdx();
	}
	
	@RequestMapping("/crm/invite/info.do")
	public String get(@RequestParam int idx, Model model){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		InviteVO getInvite = service.get(idx);
		List<CustomerVO> getCustomer = service.getPersonList(idx);
		
		FileVO fileVO = new FileVO();
		fileVO.setCrm_event_idx(idx);
		
		fileVO.setType("event_attach_file");
		List<FileVO> getEventFile = service.getFile(fileVO);
		fileVO.setType("offer_attach_file");
		List<FileVO> getOfferFile = service.getFile(fileVO);		
		fileVO.setType("stats_attach_file");
		List<FileVO> getStatsFile = service.getFile(fileVO);
		
		EventThemeVO themeVO = new EventThemeVO();
		themeVO.setCrm_event_idx(idx);
		
		List<EventThemeVO> getThemeList = service.listInviteTheme(themeVO);
		List<String> themeList = new ArrayList<String>();
				
		for(EventThemeVO list : getThemeList){
			themeList.add(list.getEvent_theme());
		}
		
		getInvite.setEvent_theme(themeList);
		
		InviteSupportVO vo1 = new InviteSupportVO();
		vo1.setInvite_idx(idx);
		vo1.setInvite_cost_type("support");
		List<InviteSupportVO> getInviteSupport = service.getInviteSupport(vo1);
		
		InviteSupportVO vo2 = new InviteSupportVO();
		vo2.setInvite_idx(idx);
		vo2.setInvite_cost_type("promotion");
		List<InviteSupportVO> getInvitePromotion = service.getInviteSupport(vo2);
		
		InviteSupportVO vo3 = new InviteSupportVO();
		vo3.setInvite_idx(idx);
		vo3.setInvite_cost_type("open");
		List<InviteSupportVO> getInviteOpen = service.getInviteSupport(vo3);
		
		
		model.addAttribute("getTheme", themeList);
		model.addAttribute("getThemeList", getThemeList);
		
		model.addAttribute("getEventFile", getEventFile);
		model.addAttribute("getOfferFile", getOfferFile);
		model.addAttribute("getStatsFile", getStatsFile);
		
		model.addAttribute("getInvite", getInvite);
		model.addAttribute("getCustomer", getCustomer);
		
		model.addAttribute("getSupport", getInviteSupport);
		model.addAttribute("getPromotion", getInvitePromotion);
		model.addAttribute("getOpen", getInviteOpen);
		
		return "mice/crm/invite/info";
	}	
	
	@RequestMapping("/crm/invite/customer.do")
	public String customer(){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		return "mice/crm/invite/customer";
	}
	
	@RequestMapping(value="/crm/invite/customerSearch.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String customerSearch(@ModelAttribute("customerVO") CustomerVO customerVO) throws ClassNotFoundException{
		List<CustomerVO> getCustomerList = service.getCustomerList(customerVO);
		
      for (int i = 0; i < getCustomerList.size(); i++) {
          Class klass = Class.forName("com.mice.crm.service.Customer");
          setFieldValue(klass, "phone_no", i, getCustomerList, getCustomerList.get(i).getPhone_no());
          setFieldValue(klass, "tel_no", i, getCustomerList, getCustomerList.get(i).getTel_no());
          setFieldValue(klass, "address", i, getCustomerList, getCustomerList.get(i).getAddress());
          setFieldValue(klass, "email", i, getCustomerList, getCustomerList.get(i).getEmail());
       }
		
		Gson g = new Gson();
		String customerList = g.toJson(getCustomerList);
		
		return customerList;
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
	
	@RequestMapping("/crm/invite/delete.do")
	public String delete(@RequestParam int idx){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		service.deleteInviteTheme(idx);
		
		service.deleteAllOpinion(idx);
		service.deletePerson(idx);
		service.delete(idx);
		service.deleteInviteSupport(idx);
		
		return "redirect:/crm/invite/list.do";
	}
	
	@RequestMapping("/crm/invite/insertOpinion.do")
	public String insertOpinion(RedirectAttributes redirectAttr, @ModelAttribute("opinionVO") InviteOpinionVO vo, 
			Model model, final MultipartHttpServletRequest multiRequest, @RequestParam Map<String, Object> param_map) throws Exception{
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		vo.setReg_id(user.getId());
		
		if(vo.getOpinion_type().equals("DM")){
			vo.setPromotion_type("IA");
		}else if(vo.getOpinion_type().equals("TM")){
			vo.setPromotion_type("IB");
		}else if(vo.getOpinion_type().equals("방문")){
			vo.setPromotion_type("IC");
		}else if(vo.getOpinion_type().equals("답사")){
			vo.setPromotion_type("ID");
		}
		
		service.insertOpinion(vo);
		int lastIdx = service.getLastOpinionIdx();
		
		String atchFileId = "";
		List<egovframework.com.cmm.service.FileVO> result = null;

		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {
			for (int i = 0; i < map.getValue().size(); i++) {
				result = fileUtil.parseFileInf(
						getFileMap(map.getKey(), map.getValue().get(i)),
						"FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				if(atchFileId != null && !atchFileId.equals("")){
					PromotionAttachFile file = new PromotionAttachFile();
					file.setFile_id(atchFileId);
					file.setPromotion_idx(lastIdx);
					file.setReg_id(user.getId());
					crmService.insertPromotionAttachFile(file);
				}
			}
		}
		
		return "redirect:/crm/invite/detail.do?idx="+vo.getParent_idx()+"&customer_idx="+vo.getCustomer_idx();
	}
	
	@RequestMapping("/crm/invite/detail.do")
	public String detail(@RequestParam int idx, @RequestParam int customer_idx, Model model){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		InvitePersonVO personVO = new InvitePersonVO();
		personVO.setInvite_idx(idx);
		personVO.setCustomer_idx(customer_idx);
		
		List<InvitePersonVO> getOpinionList = service.getOpinionList(personVO);	
		
		model.addAttribute("opinionList", getOpinionList);
		model.addAttribute("idx", idx);
		
		return "mice/crm/invite/detail";
	}
	
	@RequestMapping("/crm/invite/insertCustomerForm.do")
	public String insertCustomerForm(Model model, @ModelAttribute("OrganizerVO") OrganizerVO vo){
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(10000);
		model.addAttribute("resultList", crmService.listOrganizer(vo));
		return "mice/crm/invite/insertCustomer";
	}
	
	@RequestMapping("/crm/invite/insertDeptForm.do")
	public String insertDeptForm(@RequestParam("idx") int idx,
			@ModelAttribute("OrganizerVO") OrganizerVO vo, ModelMap model){
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(10000);

		model.addAttribute("resultList", crmService.listOrganizer(vo));
		
		return "mice/crm/invite/dept";
	}

	@RequestMapping("/crm/invite/insertDept.do")
	public ModelAndView insertDept(@ModelAttribute("CustomerOrganizerRelationVO") CustomerOrganizerRelationVO vo){
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		
		ModelAndView mav = new ModelAndView();
		
		try {
			crmService.insertCustomerNOrganizer(vo);
			String name_ko = service.getCustomerName(vo.getCustomer_idx());
			mav.addObject("msg", new String("success"));
			mav.addObject("name_ko", new String(name_ko));
		} catch (org.springframework.dao.DuplicateKeyException ex) {
			mav.addObject("msg", new String("duplicate"));
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	@RequestMapping("/crm/invite/insertCustomer.do")
	public ModelAndView insertCustomer(@ModelAttribute("CustomerVO") CustomerVO vo, @ModelAttribute("CustomerOrganizerRelationVO") CustomerOrganizerRelationVO oranizerVO){
				
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		oranizerVO.setReg_id(user.getId());
		
		crmService.insertCustomer(vo);
		oranizerVO.setCustomer_idx(vo.getIdx());
		if( oranizerVO.getOrganizer_idx() != 0 ){
			crmService.insertCustomerNOrganizer(oranizerVO);
		}
		String name_ko = service.getCustomerName(vo.getIdx());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", new String("success"));
		mav.addObject("name_ko", new String(name_ko));
		mav.setViewName("jsonView");
		
		//System.out.println("oranizerVO.getOrganizer_idx()="+oranizerVO.getOrganizer_idx());
		
				
		return mav;
	}
	
	
	@RequestMapping("/crm/invite/deleteOpinion.do")
	public ModelAndView deleteOpinion(@RequestParam int idx){		
		service.deleteOpinion(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("test", new String("test"));
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping("/crm/invite/insertOrganizerForm.do")
	public String insertOrganizerForm(ModelMap model) {
		
		return "mice/crm/invite/insertOrganizer";
	}
	
	@RequestMapping("/crm/invite/insertOrganizer.do")
	public ModelAndView insertOrganizer(@ModelAttribute("OrganizerVO") OrganizerVO vo)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		
		crmService.insertOrganizer(vo);
		int idx = service.getMaxOrganizerIdx();
		String name_ko = service.getOrganizerName(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", new String("success"));
		mav.addObject("name_ko", new String(name_ko));
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	private Map<String, MultipartFile> getFileMap(String key, MultipartFile file){
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;
	}
	
	@RequestMapping("/crm/invite/deleteFile.do")
	public ModelAndView deleteFile(@RequestParam String file_id) throws Exception {		
		service.deleteFile(file_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("test", new String("test"));
		mav.setViewName("jsonView");
		
		return mav;
	}
}