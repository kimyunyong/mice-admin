package com.mice.cvb.brochure.web;

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

import com.mice.cvb.brochure.service.BrochureService;
import com.mice.cvb.brochure.service.BrochureVO;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CVBBrochureController {

	@Resource(name = "BrochureService")
	private BrochureService service;
	
	@Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
    
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;
    
    @Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
    
    @RequestMapping("/cvb/brochure/list.do")
    public String brochureList(@ModelAttribute("brochureVO") BrochureVO vo, ModelMap model) throws Exception {
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

		// Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO,
		// vo.getBbsAttrbCode());
		Map<String, Object> map = service.list(vo);
		int totCnt = (int) map.get("resultListCount");

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);
		
    	return "mice/brochure/list";
    }
    
    @RequestMapping("/cvb/brochure/info.do")
    public String brochureInfo(@RequestParam("idx") String idx, ModelMap model) throws Exception {
    	
    	model.addAttribute("result", service.info(Integer.parseInt(idx)));
    	return "mice/brochure/info";
    }
    
    @RequestMapping("/cvb/brochure/insert.do")
    public String brochureInsert(ModelMap model) throws Exception {
    	return "mice/brochure/insert";    
    }
    
    @RequestMapping("/cvb/brochure/insert_action.do")
    public String brochureInsertAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("brochureVO") BrochureVO vo,
    		BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception{
    	
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";
		
		if (!files.isEmpty()) {
			if (files.containsKey("image_file_id") && !files.get("image_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(
						getFileMap("image_file_id",
								files.get("image_file_id")), "FRM_", 0,
						"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setImage_file_id(atchFileId);
			}
			
			if (files.containsKey("attach_file_id") && !files.get("attach_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(
						getFileMap("attach_file_id", files.get("attach_file_id")), "FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setAttach_file_id(atchFileId);
			}
		}
		
		service.insert(vo);
		model.addAttribute("resultMsg", "success.common.insert");
    	return "redirect:/cvb/brochure/list.do";
    }

    @RequestMapping("/cvb/brochure/edit.do")
    public String brochureUpdate(@RequestParam("idx") String idx, ModelMap model) throws Exception {
    	
    	model.addAttribute("result", service.info(Integer.parseInt(idx)));
    	return "/mice/brochure/edit";
    }
    
    @RequestMapping("/cvb/brochure/edit_action.do")
    public String borchureUpdateAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("brochureVO") BrochureVO vo,
    		BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception{
    	
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";
		
		if (!files.isEmpty()) {
			if (files.containsKey("image_file_id") && !files.get("image_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(
						getFileMap("image_file_id",
								files.get("image_file_id")), "FRM_", 0,
						"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setImage_file_id(atchFileId);
			}
			
			if (files.containsKey("attach_file_id") && !files.get("attach_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(
						getFileMap("attach_file_id", files.get("attach_file_id")), "FRM_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setAttach_file_id(atchFileId);
			}
		}
		
		service.update(vo);
		model.addAttribute("resultMsg", "success.common.update");
		return "redirect:/cvb/brochure/edit.do?idx=" + vo.getIdx();
    }
    
    @RequestMapping("/cvb/brochure/delete_action.do")
    public String brochureDeleteAction(@ModelAttribute("brochureVO") BrochureVO vo, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
    	vo.setExpire_id(user.getId());
    	service.delete(vo);
    	model.addAttribute("resultMsg", "success.common.delete");
    	return "redirect:/cvb/brochure/list.do";
    }
    
	private Map<String, MultipartFile> getFileMap(String key, MultipartFile file) {
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;
	}		
}
