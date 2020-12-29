package com.mice.cvb.organizer.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;



import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mice.cvb.organizer.service.OrganizerService;
import com.mice.cvb.organizer.service.OrganizerVO;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CVBOrganizerController {

	@Resource(name = "OrganizerService")
	private OrganizerService service;
	
	@Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
    
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;
    
    @Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
    
    @RequestMapping("/cvb/organizer/list.do")
    public String organizerList(@RequestParam("org_tp") String tp, @ModelAttribute("organizerVO") OrganizerVO vo, ModelMap model) throws Exception{
    	
    	if(tp.equals("0"))
    		vo.setType("");
    	else if(tp.equals("4"))
    		vo.setType("얼라이언스");
    	
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		
		System.out.println("구분 : " + vo.getSearchCnd());
		System.out.println("검색어 : " + vo.getSearchWrd());
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO,
		// vo.getBbsAttrbCode());
		Map<String, Object> map = service.list(vo);
		int totCnt = (int) map.get("resultListCount");

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);
		
    	return "mice/organizer/list";
    }
    
    @RequestMapping("/cvb/organizer/info.do")
    public String organizerInfo(@RequestParam("org_tp") String tp, @RequestParam("idx") String idx, ModelMap model) throws Exception{
    	
    	model.addAttribute("result", service.info(Integer.parseInt(idx)));
    	return "mice/organizer/info";
    }
    
    @RequestMapping("/cvb/organizer/edit.do")
    public String organizerEdit(@RequestParam("org_tp") String tp, @RequestParam("idx") String idx, ModelMap model) throws Exception{
    	
    	model.addAttribute("result", service.info(Integer.parseInt(idx)));
    	return "mice/organizer/edit";
    }
    
    @RequestMapping("/cvb/organizer/insert.do")
    public String organizerInsert(@RequestParam("org_tp") String tp, ModelMap model) throws Exception{
    	
    	return "mice/organizer/insert";
    }
    
    @RequestMapping("/cvb/organizer/insert_action.do")
    public String organizerInsertAction(final MultipartHttpServletRequest multiRequest,@RequestParam("org_tp") String tp, @ModelAttribute("organizerVO") OrganizerVO vo,
    		BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception{
    	
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";
		
		if (!files.isEmpty()) {
			if (files.containsKey("logo_file_id") && !files.get("logo_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(getFileMap("logo_file_id",files.get("logo_file_id")), "FRM_", 0,"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setLogo_file_id(atchFileId);
			}
		}
		
		service.insert(vo);
		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/cvb/organizer/list.do?org_tp=" + tp;
    }
    
    @RequestMapping("/cvb/organizer/edit_action.do")
    public String organizerEditAction(final MultipartHttpServletRequest multiRequest, @RequestParam("org_tp") String tp, @ModelAttribute("organizerVO") OrganizerVO vo,
    		BindingResult bindingResult, SessionStatus status, RedirectAttributes redirectAttr, ModelMap model) throws Exception{
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";
		
		if (!files.isEmpty()) {
			if (files.containsKey("logo_file_id") && !files.get("logo_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(getFileMap("logo_file_id",files.get("logo_file_id")), "FRM_", 0,"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setLogo_file_id(atchFileId);
			}
		}
		
    	service.edit(vo);
    	redirectAttr.addFlashAttribute("resultMsg", "success.common.update");
    	return "redirect:/cvb/organizer/edit.do?idx=" + vo.getIdx() + "&org_tp=" + tp;
    }
    
    @RequestMapping("/cvb/organizer/delete_action.do")
    public String organizerDeleteAction(@RequestParam("org_tp") String tp, @ModelAttribute("organizerVO") OrganizerVO vo, ModelMap model) throws Exception{
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	vo.setExpire_id(user.getId());
    	service.delete(vo);
    	model.addAttribute("resultMsg", "success.common.delete");
    	return "redirect:/cvb/organizer/list.do?org_tp=" + tp;
    }
    
    private Map<String, MultipartFile> getFileMap(String key, MultipartFile file) {
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;
	}
}
