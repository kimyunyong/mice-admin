package com.mice.crm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mice.common.encrypt.AESGenerator;
import com.mice.crm.service.CRMService;
import com.mice.crm.service.CodeVO;
import com.mice.crm.service.CustomerOrganizerRelationVO;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.OrganizerVO;
import com.mice.crm.service.ManagerEventService;
import com.mice.crm.service.ManagerEventVO;
import com.mice.crm.service.ManagerEvent;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ManagerEventController {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComIndexController.class);

	@Resource(name = "ManagerEventService")
	ManagerEventService service;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "userManageService")
	private EgovUserManageService userService;

	
	
	@RequestMapping("/crm/manager_event/list.do")
	public String managerList(@ModelAttribute("ManagerEventVO") ManagerEventVO vo,
			ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		model.addAttribute("resultList", service.listManagerCategoryListAll(vo));
		model.addAttribute("vo", vo);
		
		return "mice/crm/manager_event/list";
	}

	@RequestMapping("/crm/manager_event/info.do")
	public String managerInfo(@ModelAttribute("ManagerEventVO") ManagerEventVO vo, ModelMap model)
			throws Exception {
		
		model.addAttribute("result", service.selectManagerCategory(vo));
		model.addAttribute("vo", vo);
		
		return "mice/crm/customer/info";
		
	}

	

	@RequestMapping("/crm/manager_event/insert.do")
	public String managerInsert(
			@ModelAttribute("ManagerEventVO") ManagerEventVO vo, ModelMap model) 
			throws Exception {
		
		model.addAttribute("vo", vo);
		return "mice/crm/manager_event/insert";
	}

	@RequestMapping("/crm/manager_event/insert_action.do")
	public ModelAndView managerInsertAction(
			@ModelAttribute("ManagerEventVO") ManagerEventVO vo, ModelMap model)
			throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		
		try
		{
			ManagerEventVO num =  service.selectManagerCategorySortNum(vo);
			
			vo.setCate_no(num.getCate_no());
			vo.setSort(num.getSort());
			
			int idx =  service.insertManagerCategory(vo);
			
			resultMap.put("crm_event_idx", vo.getCrm_event_idx());
			resultMap.put("cate_code", vo.getCate_code());
			resultMap.put("result", true);
		}catch(Exception ex){
			resultMap.put("result", false);
		}
	   
		ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    return modelAndView;		
		
		
	}


	
	@RequestMapping("/crm/manager_event/edit.do")
	public String managerEdit(@ModelAttribute("ManagerEventVO") ManagerEventVO vo, ModelMap model)
			throws Exception {
		
		model.addAttribute("result", service.selectManagerCategory(vo) );
		model.addAttribute("vo", vo);
		
		return "mice/crm/manager_event/edit";
	}

	@RequestMapping("/crm/manager_event/edit_action.do")
	public ModelAndView managerEditAction(
			@ModelAttribute("ManagerEventVO") ManagerEventVO vo, ModelMap model)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());
		
		try
		{
			service.updateManagerCategory(vo);
			resultMap.put("crm_event_idx", vo.getCrm_event_idx());
			resultMap.put("cate_code", vo.getCate_code());
			resultMap.put("result", true);
		}catch(Exception ex){
			resultMap.put("result", false);
		}
	   
		ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    return modelAndView;		
		
		
	}

	
	@RequestMapping("/crm/manager_event/delete_action.do")
	public ModelAndView managerDeleteAction(@RequestParam("idx") int idx,
			@ModelAttribute("ManagerEventVO") ManagerEventVO vo, ModelMap model)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setExpire_id(user.getId());
		
		try
		{
			vo.setIdx(idx);
			service.deleteManagerCategory(vo);

			resultMap.put("crm_event_idx", vo.getCrm_event_idx());
			resultMap.put("cate_code", vo.getCate_code());
			resultMap.put("result", true);
		}catch(Exception ex){
			resultMap.put("result", false);
		}
	   
		ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    return modelAndView;		
		
		
		
		
	}

	
	@RequestMapping("/crm/manager_event/sort_up.do")
	public ModelAndView managerSortUp(
			@ModelAttribute("ManagerEventVO") ManagerEventVO vo, ModelMap model) 
			throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		try
		{
			int cur_idx = vo.getIdx();
			int cur_sort = vo.getSort();


			ManagerEventVO preVo;
			if(vo.getSearchSort().equals("up")){
				preVo = service.selectManagerCategorySortUpIdx(vo);	//위로
			}else{
				preVo = service.selectManagerCategorySortDownIdx(vo);//아래로
			}
			int pre_idx = preVo.getIdx();
			int pre_sort = preVo.getSort();
			

			//현재꺼 수정
			vo.setIdx(cur_idx);
			vo.setSort(pre_sort);
			service.updateManagerCategorySortChange(vo);


			//이전꺼 수정
			vo.setIdx(pre_idx);
			vo.setSort(cur_sort);
			service.updateManagerCategorySortChange(vo);
			


			resultMap.put("crm_event_idx", vo.getCrm_event_idx());
			resultMap.put("cate_code", vo.getCate_code());
			resultMap.put("result", true);

		}catch(Exception ex){
			resultMap.put("result", false);
		}
	   
		ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    return modelAndView;		
				
		
		
	}	
	
	
	@RequestMapping("/crm/manager_event/select_box.do")
	public String codeSelectBox(@ModelAttribute("ManagerEventVO") ManagerEventVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {


		model.addAttribute("name", map.get("name"));
		model.addAttribute("li", map.get("li"));
		model.addAttribute("input_type", map.get("input_type"));
		model.addAttribute("input_name", map.get("input_name"));
		
		
		model.addAttribute("resultList", service.listManagerCategoryListAll(vo));
		if (map.containsKey("result") && map.get("result").hashCode() != 0){
			model.addAttribute("result", map.get("result").toString().replace("[","").replace("]","").replace(" ", ""));
		}else{
			model.addAttribute("result", "");
		}
		model.addAttribute("vo", vo);
		
		
		
		return "mice/crm/manager_event/select_box";
	}	
	

	@RequestMapping("/crm/manager_event/check_box.do")
	public String codeCheckBox(@ModelAttribute("ManagerEventVO") ManagerEventVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		
		model.addAttribute("name", map.get("name"));
		model.addAttribute("li", map.get("li"));
		model.addAttribute("input_type", map.get("input_type"));
		model.addAttribute("input_name", map.get("input_name"));
		
		model.addAttribute("resultList", service.listManagerCategoryListAll(vo));
		if (map.containsKey("result") && map.get("result").hashCode() != 0){
			model.addAttribute("result", map.get("result").toString().replace("[","").replace("]","").replace(" ", ""));
		}else{
			model.addAttribute("result", "");
		}
		model.addAttribute("vo", vo);
		
		
		
		
		return "mice/crm/manager_event/check_box";
	}	
	
		
	
	@RequestMapping("/crm/manager_event/select_event_list.do")
	public String codeSelectEventList(@ModelAttribute("ManagerEventVO") ManagerEventVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		model.addAttribute("name", map.get("name"));
		model.addAttribute("li", map.get("li"));
		model.addAttribute("input_type", map.get("input_type"));
		model.addAttribute("input_name", map.get("input_name"));
		
		model.addAttribute("resultList", service.listManagerCategoryListAll(vo));
		if (map.containsKey("result") && map.get("result").hashCode() != 0){
			model.addAttribute("result", map.get("result").toString().replace("[","").replace("]","").replace(" ", ""));
		}else{
			model.addAttribute("result", "");
		}		
		model.addAttribute("resultList", service.listManagerEvent(vo));
		model.addAttribute("vo", vo);
		
		return "mice/crm/manager_event/select_event_list";
	}	
	
	
}
