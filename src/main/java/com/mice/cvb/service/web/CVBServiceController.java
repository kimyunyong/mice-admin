package com.mice.cvb.service.web;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.mice.cvb.service.service.PromotionService;
import com.mice.cvb.service.service.PromotionVO;
import com.mice.cvb.service.service.RFPService;
import com.mice.cvb.service.service.RFPVO;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CVBServiceController {
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);
	
	@Resource(name = "RFPService")
	RFPService rfpService;

	@Resource(name = "PromotionService")
	PromotionService promotionService;
	
    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
    
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
	// ########################################### RFP #############################################
	@RequestMapping("/cvb/form/rfp_list.do")
	public String rlist(@ModelAttribute("rfpVO") RFPVO vo, ModelMap model) throws Exception {
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
		Map<String, Object> map = rfpService.selectRFPList(vo);
		int totCnt = (int)map.get("resultListCount");
		
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		
		return "mice/form/rfp_list";
	    
	}

	@RequestMapping("/cvb/form/rfp_info.do")
	public String rinfo(@RequestParam("idx") String idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		RFPVO vo = rfpService.selectRFP(Integer.parseInt(idx));
		model.addAttribute("result", vo);
		return "mice/form/rfp_info";
	}
		
	@RequestMapping("/cvb/form/rfp_edit.do")
	public String redit(@RequestParam("idx") String idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		RFPVO vo = rfpService.selectRFP(Integer.parseInt(idx));
		model.addAttribute("result", vo);
		return "mice/form/rfp_edit";
	}
	
	@RequestMapping("/cvb/form/rfp_edit_action.do")
	public String reditaction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("rfpVO") RFPVO vo,  BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
	    String atchFileId = "";
		try
	    {
	    	if(!files.isEmpty())
	    	{
		    	if(files.containsKey("checkin_file") && !files.get("checkin_file").isEmpty()){
		    		result = fileUtil.parseFileInf(getFileMap("checkin_file", files.get("checkin_file")), "FRM_",0,"","");
		    		atchFileId = fileMngService.insertFileInfs(result);
		    		vo.setCheckin_file_id(atchFileId);
		    	}
	    	}
	    	
	    	if(!vo.getConfirm_status().equals("대기")){
	    		vo.setConfirm_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date()));
	    		vo.setConfirm_id(user.getId());
	    	}else
	    		vo.setConfirm_date(null);
			rfpService.updateRFP(vo);
	    }catch(Exception ex){
	    	LOGGER.error("eventRegistAction : " + ex.getMessage());
	    	model.addAttribute("resultMsg", "fail.common.update");
	    	return "forward:/cvb/form/rfp_edit.do?idx=" + vo.getIdx();
	    }
		
		model.addAttribute("resultMsg", "success.common.update");
		return "forward:/cvb/form/rfp_edit.do?idx=" + vo.getIdx();
	}
	
	@RequestMapping("/cvb/form/rfp_delete.do")
	public String rdelete(@RequestParam("idx") int idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		RFPVO vo = new RFPVO();
		vo.setExpire_id(user.getId());
		vo.setIdx(idx);
		rfpService.deleteRFP(vo);
		model.addAttribute("resultMsg", "success.common.delete");
		return "redirect:/cvb/form/rfp_list.do";
	}
	
	// ########################################### Promotion #############################################
	@RequestMapping("/cvb/form/promotion_list.do")
	public String plist(@ModelAttribute("promotionVO") PromotionVO vo, ModelMap model) throws Exception {
		
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

		Map<String, Object> map = promotionService.selectPromotionList(vo);
		int totCnt = (int)map.get("resultListCount");
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		
		return "mice/form/promotion_list";
	    
	}

	@RequestMapping("/cvb/form/promotion_info.do")
	public String pinfo(@RequestParam("idx") String idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		PromotionVO vo = promotionService.selectPromotion(Integer.parseInt(idx));
		model.addAttribute("result", vo);
		return "mice/form/promotion_info";
	}
		
	@RequestMapping("/cvb/form/promotion_edit.do")
	public String pedit(@RequestParam("idx") String idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		PromotionVO vo = promotionService.selectPromotion(Integer.parseInt(idx));
		model.addAttribute("result", vo);
		return "mice/form/promotion_edit";
	}
	
	@RequestMapping("/cvb/form/promotion_edit_action.do")
	public String peditaction( @ModelAttribute("promotionVO") PromotionVO vo,  BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		try
	    {
	    	if(!vo.getConfirm_status().equals("대기")){
	    		vo.setConfirm_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date()));
	    		vo.setConfirm_id(user.getId());
	    	}else
	    		vo.setConfirm_date(null);
			promotionService.updatePromotion(vo);
	    }catch(Exception ex){
	    	LOGGER.error("peditaction : " + ex.getMessage());
	    	model.addAttribute("resultMsg", "fail.common.update");
	    	return "forward:/cvb/form/promotion_edit.do?idx=" + vo.getIdx();
	    }
		
		model.addAttribute("resultMsg", "success.common.update");
		return "redirect:/cvb/form/promotion_edit.do?idx=" + vo.getIdx();
	}
	
	@RequestMapping("/cvb/form/promotion_delete.do")
	public String pdelete(@RequestParam("idx") int idx, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		PromotionVO vo = new PromotionVO();
		vo.setIdx(idx);
		vo.setExpire_id(user.getId());
		promotionService.deletePromotion(vo);
		model.addAttribute("resultMsg", "success.common.delete");
		return "redirect:/cvb/form/promotion_list.do";
	}
	
	private Map<String, MultipartFile> getFileMap(String key, MultipartFile file){
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;  
	}
}
