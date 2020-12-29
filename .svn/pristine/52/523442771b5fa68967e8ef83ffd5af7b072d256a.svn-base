package com.mice.common.banner.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mice.common.banner.service.BannerService;
import com.mice.common.banner.service.BannerVO;
import com.mice.cvb.archive.service.ArchiveCodeVO;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BannerController {

	@Resource(name = "BannerService")
	private BannerService bannerService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
    
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;
    
    @RequestMapping("/{site}/banner/{type}/banner_list.do")
    public String bannerList(@PathVariable String site, @PathVariable String type, @ModelAttribute("BannerVO") BannerVO vo, ModelMap model ) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		vo.setSite(site);
		vo.setBanner_kind(type);
		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bannerService.list(vo);
		
		int totCnt = (int)map.get("resultListCount");
		
		paginationInfo.setTotalRecordCount(totCnt);

		ArchiveCodeVO codeVO = new ArchiveCodeVO();

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("site", site);
		model.addAttribute("type", type);
		model.addAttribute("paginationInfo", paginationInfo);		
    	return "mice/banner/list";
    }
    
    @RequestMapping("/{site}/banner/{type}/banner_info.do")
    public String bannerInfo(@RequestParam("idx") String idx, @PathVariable String site, @PathVariable String type, @ModelAttribute("BannerVO") BannerVO vo, ModelMap model) throws Exception{
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	vo.setIdx(Integer.parseInt(idx));
    	model.addAttribute("result", bannerService.select(vo));
    	model.addAttribute("site", site);
    	model.addAttribute("type", type);
    	return "mice/banner/info";
    }
    
    @RequestMapping("/{site}/banner/{type}/banner_edit.do")
    public String bannerEdit(@PathVariable String site, @PathVariable String type, @RequestParam("idx") String idx, @ModelAttribute("BannerVO") BannerVO vo, ModelMap model) throws Exception{
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	vo.setIdx(Integer.parseInt(idx));
    	model.addAttribute("result", bannerService.select(vo));
    	model.addAttribute("site", site);
    	model.addAttribute("type", type);
    	return "mice/banner/edit";
    }
    
    @RequestMapping("/{site}/banner/{type}/banner_edit_action.do")
    public String bannerEditAction(final MultipartHttpServletRequest multiRequest, @PathVariable String site, @PathVariable String type, @ModelAttribute("BannerVO") BannerVO vo, BindingResult bindingResult, 
		SessionStatus status, ModelMap model) throws Exception{
    	
    	final Map<String, MultipartFile> files = multiRequest.getFileMap();
    	List<FileVO> result = null;
		String atchFileId = "";
		
    	if (!files.isEmpty()) {
			if (files.containsKey("image_file_id") && !files.get("image_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(getFileMap("image_file_id",files.get("image_file_id")), "FRM_", 0,"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setImage_file_id(atchFileId);
			}
			
			if (files.containsKey("image_file_id_en") && !files.get("image_file_id_en").isEmpty()) {
				result = fileUtil.parseFileInf(getFileMap("image_file_id_en",files.get("image_file_id_en")), "FRM_", 0,"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setImage_file_id_en(atchFileId);
			}
    	}
			
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	bannerService.update(vo);
    	bannerService.updateSortNo(vo);
    	model.addAttribute("resultMsg", "success.common.update");
    	return "redirect:/" + site + "/banner/" + type + "/banner_edit.do?idx=" + vo.getIdx();
    }
    
    @RequestMapping("/{site}/banner/{type}/banner_insert.do")
    public String bannerInsert(@PathVariable String site, @PathVariable String type, @ModelAttribute("BannerVO") BannerVO vo, ModelMap model) throws Exception{
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	vo.setSite(site);
    	vo.setBanner_kind(type);
    	model.addAttribute("site", site);
    	model.addAttribute("sortNo", bannerService.getSortNo(vo));
    	model.addAttribute("type", type);
    	return "mice/banner/insert";
    }
    
    
    @RequestMapping("/{site}/banner/{type}/banner_insert_action.do")
    public String bannerInsertAction(final MultipartHttpServletRequest multiRequest, @PathVariable String site, @PathVariable String type, @ModelAttribute("BannerVO") BannerVO vo, BindingResult bindingResult, 
		SessionStatus status, ModelMap model) throws Exception{
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	vo.setReg_id(user.getId());
    	
    	final Map<String, MultipartFile> files = multiRequest.getFileMap();
    	List<FileVO> result = null;
		String atchFileId = "";
		
    	if (!files.isEmpty()) {
			if (files.containsKey("image_file_id") && !files.get("image_file_id").isEmpty()) {
				result = fileUtil.parseFileInf(getFileMap("image_file_id",files.get("image_file_id")), "FRM_", 0,"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setImage_file_id(atchFileId);
			}
			
			if (files.containsKey("image_file_id_en") && !files.get("image_file_id_en").isEmpty()) {
				result = fileUtil.parseFileInf(getFileMap("image_file_id_en",files.get("image_file_id_en")), "FRM_", 0,"", "");
				atchFileId = fileMngService.insertFileInfs(result);
				vo.setImage_file_id_en(atchFileId);
			}
    	}
    	
    	bannerService.insert(vo);
    	model.addAttribute("resultMsg", "success.common.insert");
    	return "redirect:/" + site + "/banner/" + type + "/banner_list.do";
    }
    
    @RequestMapping("/{site}/banner/{type}/banner_delete_action.do")
    public String bannerDeleteaction(@RequestParam("idx") String idx,@PathVariable String site, @PathVariable String type, @ModelAttribute("BannerVO") BannerVO vo, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	vo.setIdx(Integer.parseInt(idx));
    	vo.setExpire_id(user.getId());
    	bannerService.delete(vo);
    	model.addAttribute("resultMsg", "success.common.delete");
    	return "redirect:/" + site + "/banner/" + type + "/banner_list.do";
    }
    
    private Map<String, MultipartFile> getFileMap(String key, MultipartFile file) {
    	HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
    	map.put(key, file);
    	return map;
    }
}
