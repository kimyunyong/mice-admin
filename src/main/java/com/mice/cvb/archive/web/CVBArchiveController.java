package com.mice.cvb.archive.web;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.mice.cvb.archive.service.ArchiveCodeVO;
import com.mice.cvb.archive.service.ArchiveDownloadLogVO;
import com.mice.cvb.archive.service.ArchiveInfoVO;
import com.mice.cvb.archive.service.ArchiveRelation;
import com.mice.cvb.archive.service.ArchiveService;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CVBArchiveController {
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);
	@Resource(name = "ArchiveService")
	ArchiveService archiveService;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
    
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;
    
	@RequestMapping("/cvb/archive/code_list.do")
	public String archiveCode(@ModelAttribute("ArchiveCodeVO") ArchiveCodeVO vo, ModelMap model ) throws Exception{
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

		
		Map<String, Object> map = archiveService.codeList(vo);
		
		int totCnt = (int)map.get("resultListCount");
		
		paginationInfo.setTotalRecordCount(totCnt);

		ArchiveCodeVO codeVO = new ArchiveCodeVO();

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("sort_no", archiveService.lastSortCodeNo());
		model.addAttribute("paginationInfo", paginationInfo);
		return "mice/archive/code_list"; 
	}
	
	@RequestMapping("/cvb/archive/code_insert.do")
	public String archiveCodeRegist(@ModelAttribute("ArchiveCodeVO") ArchiveCodeVO vo, ModelMap model ) throws Exception{
		archiveService.codeInsert(vo);
		return "redirect:/cvb/archive/code_list.do"; 
	}
	
	@RequestMapping("/cvb/archive/code_edit.do")
	public String archiveCodeEdit(@ModelAttribute("ArchiveCodeVO") ArchiveCodeVO vo, ModelMap model ) throws Exception{
		archiveService.codeUpdate(vo);
		return "redirect:/cvb/archive/code_list.do";
	}
	
	@RequestMapping("/cvb/archive/code_delete.do")
	public String archiveCodeDelete(@ModelAttribute("ArchiveCodeVO") ArchiveCodeVO vo, ModelMap model ) throws Exception{
		archiveService.codeDelete(vo);
		return "redirect:/cvb/archive/code_list.do";
	}
	
	@RequestMapping("/cvb/archive/info_list.do")
	public String archiveInfoList(@ModelAttribute("ArchiveInfoVO") ArchiveInfoVO vo, ModelMap model ) throws Exception{
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

		
		Map<String, Object> map = archiveService.infoList(vo);
		
		int totCnt = (int)map.get("resultListCount");
		
		paginationInfo.setTotalRecordCount(totCnt);

		ArchiveCodeVO codeVO = new ArchiveCodeVO();
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("resultCodeList", archiveService.codeList(codeVO).get("resultList"));
		model.addAttribute("vo", vo);
		model.addAttribute("sort_no", archiveService.lastSortCodeNo());
		model.addAttribute("paginationInfo", paginationInfo);
		return "mice/archive/info_list"; 
	}

	@RequestMapping("/cvb/archive/info_info.do")
	public String archiveInfoInfo(@RequestParam(value = "idx", required = false, defaultValue="0") int idx, 
			@ModelAttribute("ArchiveInfoVO") ArchiveInfoVO vo, BindingResult bindingResult, 
			SessionStatus status, ModelMap model) throws Exception {
		ArchiveCodeVO codeVO = new ArchiveCodeVO();
		vo.setIdx(idx);
		List<ArchiveRelation> lst =  archiveService.relationList(idx);
		List<ArchiveCodeVO> codelst = (List<ArchiveCodeVO>)archiveService.codeList(codeVO).get("resultList");
		
		boolean allCheck = true;
		for(int i=0;i<codelst.size();i++){
			for(int j=0;j<lst.size();j++){
				if(codelst.get(i).getIdx() == lst.get(j).getCode_idx()){
					codelst.get(i).setChecked(true);;
					allCheck = false;
				}	
			}
		}
		model.addAttribute("result", archiveService.infoDetail(vo));
		model.addAttribute("resultCodeList", codelst);
		model.addAttribute("allCheck", allCheck);
		
		List<java.lang.Integer> relationIdxList = new ArrayList<java.lang.Integer>();
		
		for(int i=0;i<lst.size();i++){
			relationIdxList.add(lst.get(i).getCode_idx());
		}
		model.addAttribute("resultRelationIdxList", lst);
		return "mice/archive/info_info";
	}
	
	@RequestMapping("/cvb/archive/info_insert.do")
	public String archiveInfoRegist(@RequestParam("mode") String mode, 
			@RequestParam(value = "idx", required = false, defaultValue="0") int idx, 
			@ModelAttribute("ArchiveInfoVO") ArchiveInfoVO vo, BindingResult bindingResult, 
			SessionStatus status, ModelMap model ) throws Exception{
		
		ArchiveCodeVO codeVO = new ArchiveCodeVO();
		if(mode.equals("insert")){
			model.addAttribute("resultCodeList", archiveService.codeList(codeVO).get("resultList"));
		}
		else if(mode.equals("edit"))
		{
			
			vo.setIdx(idx);
			List<ArchiveRelation> lst =  archiveService.relationList(idx);
			List<ArchiveCodeVO> codelst = (List<ArchiveCodeVO>)archiveService.codeList(codeVO).get("resultList");
			
			boolean allCheck = true;
			for(int i=0;i<codelst.size();i++){
				for(int j=0;j<lst.size();j++){
					if(codelst.get(i).getIdx() == lst.get(j).getCode_idx()){
						codelst.get(i).setChecked(true);;
						allCheck = false;
					}	
				}
			}
			model.addAttribute("result", archiveService.infoDetail(vo));
			model.addAttribute("resultCodeList", codelst);
			model.addAttribute("allCheck", allCheck);
			
			List<java.lang.Integer> relationIdxList = new ArrayList<java.lang.Integer>();
			
			for(int i=0;i<lst.size();i++){
				relationIdxList.add(lst.get(i).getCode_idx());
			}
			model.addAttribute("resultRelationIdxList", lst);
		}
		return "mice/archive/info_edit";
	}
	
	@RequestMapping("/cvb/archive/info_insert_action.do")
	public String archiveInfoRegistAction(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("ArchiveInfoVO") ArchiveInfoVO vo, BindingResult bindingResult, 
			SessionStatus status, ModelMap model ) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		vo.setWriter_id(user.getId());
		if(!files.isEmpty() && files.containsKey("file") && !files.get("file").isEmpty()){
		
			HashMap<String, String> fileMap =null;
			try
			{
				fileMap = fileUtil.uploadFile(files.get("file"));
			}catch(Exception ex){
				LOGGER.error(ex.getMessage());
			}
			
			
			vo.setFile_name(fileMap.get("uploadFileName").toString());
			vo.setFile_ext(fileMap.get("fileExtension").toString());
			String thumbnail_path = com.mice.common.image.Thumbnail.generateThumbnail(fileMap.get("filePath").toString(), fileMap.get("uploadFileName").toString(), fileMap.get("fileExtension"), 236, 237);
			vo.setThumb_min_file_path(thumbnail_path);
			thumbnail_path = com.mice.common.image.Thumbnail.generateThumbnail(fileMap.get("filePath").toString(), fileMap.get("uploadFileName").toString(), fileMap.get("fileExtension"), 500, 500);
			vo.setThumb_max_file_path(thumbnail_path);
			vo.setComment_ko((vo.getComment_ko()));
			vo.setComment_en((vo.getComment_en()));
		}
		try
		{
			archiveService.infoInsert(vo);
		}catch(Exception ex){
			LOGGER.error(ex.getMessage());
		}
		model.addAttribute("resultMsg", "success.common.insert");
		return "redirect:/cvb/archive/info_insert.do?mode=insert";
	}
	
	@RequestMapping("/cvb/archive/info_edit_action.do")
	public String archiveInfoEditAction(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("ArchiveInfoVO") ArchiveInfoVO vo, BindingResult bindingResult, 
			SessionStatus status, ModelMap model ) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		vo.setWriter_id(user.getId());
		if(!files.isEmpty() && files.containsKey("file") && !files.get("file").isEmpty()){
		
			HashMap<String, String> fileMap = fileUtil.uploadFile(files.get("file"));

			vo.setFile_name(fileMap.get("uploadFileName").toString());
			vo.setFile_ext(fileMap.get("fileExtension").toString());
			String thumbnail_path = com.mice.common.image.Thumbnail.generateThumbnail(fileMap.get("filePath").toString(), fileMap.get("uploadFileName").toString(), fileMap.get("fileExtension"), 236, 237);
			vo.setThumb_min_file_path(thumbnail_path);
			thumbnail_path = com.mice.common.image.Thumbnail.generateThumbnail(fileMap.get("filePath").toString(), fileMap.get("uploadFileName").toString(), fileMap.get("fileExtension"), 500, 500);
			vo.setThumb_max_file_path(thumbnail_path);
			vo.setComment_ko((vo.getComment_ko()));
			vo.setComment_en((vo.getComment_en()));
		}
		String codes = vo.getCodes();
		
		if(codes.endsWith(","))
			codes = codes.substring(0, codes.length() - 1);
		if(vo.getCodes_idx().equals(""))
			vo.setCodes_idx(null);
		
		vo.setCodes(codes);
		archiveService.infoUpdate(vo);
		model.addAttribute("resultMsg", "success.common.insert");
		
		return "redirect:/cvb/archive/info_insert.do?mode=edit&idx=" + vo.getIdx();
	}
	
	@RequestMapping("/cvb/archive/info_delete_action.do")
	public String archiveInfoDeleteAction(@ModelAttribute("ArchiveInfoVO") ArchiveInfoVO vo, ModelMap model) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setExpire_id(user.getId());
		archiveService.infoDelete(vo);
		return "redirect:/cvb/archive/info_list.do";
	}
	
	@RequestMapping("/cvb/archive/log_list.do")
	public String archiveDownloadLogList(@ModelAttribute("ArchiveDownloadLogVO") ArchiveDownloadLogVO vo, ModelMap model ) throws Exception{
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

		
		Map<String, Object> map = archiveService.logList(vo);
		
		int totCnt = (int)map.get("resultListCount");
		
		paginationInfo.setTotalRecordCount(totCnt);

		ArchiveCodeVO codeVO = new ArchiveCodeVO();
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);
		return "mice/archive/log_list"; 
	}
}
