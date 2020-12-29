package com.mice.hico.form.web;

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

import com.mice.hico.form.service.Form;
import com.mice.hico.form.service.FormService;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;

@Controller
public class HICOFormController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);
	
	@Resource(name = "FormService")
	FormService service;
	
	@Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
    
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;
    
    @RequestMapping("/hico/form/list.do")
    public String formList(ModelMap model ) throws Exception{
    	model.addAttribute("resultList", service.list());
    	return "mice/form/hico_form_list";
    }
    
    @RequestMapping("/hico/form/update.do")
    /*public String formUpdate(final MultipartHttpServletRequest multiRequest, @RequestParam("title") String title, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {*/
    public String formUpdate(final MultipartHttpServletRequest multiRequest, @ModelAttribute("Form") Form frm, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	final Map<String, MultipartFile> files = multiRequest.getFileMap();
    	
    	if(!files.isEmpty() && files.containsKey("form_file_id") && !files.get("form_file_id").isEmpty()){
    		List<FileVO> result = null;
    		String atchFileId = "";
    		result = fileUtil.parseFileInf(getFileMap("form_file_id", files.get("form_file_id")), "FRM_",0,"","");
	    	atchFileId = fileMngService.insertFileInfs(result);
    			
    		
    		
    		frm.setForm_file_id(atchFileId);
    		service.update(frm);
    	}
    	
    	return "redirect:/hico/form/list.do";
    }
    
    private Map<String, MultipartFile> getFileMap(String key, MultipartFile file){
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;  
	}
}
