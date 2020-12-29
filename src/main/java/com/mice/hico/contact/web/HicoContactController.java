package com.mice.hico.contact.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mice.hico.contact.service.ContactService;
import com.mice.hico.contact.service.ContactVO;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class HicoContactController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);
	
	@Resource(name = "ContactService")
	ContactService contactService;
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
	// ########################################### RFP #############################################
	@RequestMapping("/hico/form/contact_list.do")
	public String list(@ModelAttribute("contactVO") ContactVO vo, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();


		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		Map<String, Object> map = contactService.list(vo);
		int totCnt = (int)map.get("resultListCount");
		
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		
		return "mice/form/contact_list";
	    
	}

	@RequestMapping("/hico/form/contact_info.do")
	public String info(@RequestParam("idx") String idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		ContactVO vo = contactService.select(Integer.parseInt(idx));
		model.addAttribute("result", vo);
		return "mice/form/contact_info";
	}
		
	@RequestMapping("/hico/form/contact_edit.do")
	public String edit(@RequestParam("idx") String idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		ContactVO vo = contactService.select(Integer.parseInt(idx));
		model.addAttribute("result", vo);
		return "mice/form/contact_edit";
	}
	
	@RequestMapping("/hico/form/contact_edit_action.do")
	public String editaction(@ModelAttribute("contactVO") ContactVO vo,  BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		try
	    {
	    	
	    	if(!vo.getConfirm_status().equals("대기")){
	    		vo.setConfirm_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date()));
	    		vo.setConfirm_id(user.getId());
	    	}else
	    		vo.setConfirm_date(null);
			contactService.update(vo);
	    }catch(Exception ex){
	    	LOGGER.error("eventRegistAction : " + ex.getMessage());
	    	model.addAttribute("resultMsg", "fail.common.insert");
	    	return "forward:/cvb/form/rfp_edit.do?idx=" + vo.getIdx();
	    }
		
		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/hico/form/contact_edit.do?idx=" + vo.getIdx();
	}
	
	@RequestMapping("/hico/form/contact_delete.do")
	public String delete(@RequestParam("idx") int idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		ContactVO vo = new ContactVO();
		vo.setExpire_id(user.getId());
		vo.setIdx(idx);
		contactService.delete(vo);
		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/hico/form/contact_list.do";
	}

}
