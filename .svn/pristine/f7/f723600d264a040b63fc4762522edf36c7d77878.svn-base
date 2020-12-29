package com.mice.cvb.event.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.mice.cvb.event.service.Event;
import com.mice.cvb.event.service.EventService;
import com.mice.cvb.event.service.EventVO;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class CVBEventController {

		private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);
		
		@Resource(name = "EventService")
		EventService eventService;
		
	    @Resource(name = "EgovFileMngUtil")
	    private EgovFileMngUtil fileUtil;
	    
	    @Resource(name = "EgovFileMngService")
	    private EgovFileMngService fileMngService;
	    
	    @Resource(name = "propertiesService")
	    protected EgovPropertyService propertyService;
	    
		@RequestMapping("/cvb/form/event_list.do")
		public String eventList(@ModelAttribute("eventVO") EventVO vo, ModelMap model) throws Exception {
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
			Map<String, Object> map = eventService.selectEventList(vo);
			int totCnt = (int)map.get("resultListCnt");
			
			paginationInfo.setTotalRecordCount(totCnt);

			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultListCnt", map.get("resultListCnt"));
			model.addAttribute("vo", vo);
			model.addAttribute("paginationInfo", paginationInfo);

			
			return "mice/form/event_list";
		    
		}
		
		@RequestMapping("/cvb/form/event_info.do")
		public String eventInfo(@RequestParam("idx") String idx, ModelMap model) throws Exception {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			EventVO vo = new EventVO();
			vo.setIdx(Integer.parseInt(idx));
			vo = eventService.selectEvent(vo);
			model.addAttribute("result", vo);
			return "mice/form/event_info";
		}
		
		@RequestMapping("/cvb/form/event_edit.do")
		public String eventEdit(@RequestParam("idx") String idx, ModelMap model) throws Exception {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			EventVO vo = new EventVO();
			vo.setIdx(Integer.parseInt(idx));
			vo = eventService.selectEvent(vo);
			model.addAttribute("result", vo);
			return "mice/form/event_edit";
		}
		
		@RequestMapping("/cvb/form/event_edit_action.do")
		public String eventEditAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("eventVO") EventVO vo,  BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			List<FileVO> result = null;
		    String atchFileId = "";
			try
		    {
		    	if(!files.isEmpty())
		    	{
			    	if(files.containsKey("image_file") && !files.get("image_file").isEmpty()){
			    		result = fileUtil.parseFileInf(getFileMap("image_file", files.get("image_file")), "FRM_",0,"","");
			    		atchFileId = fileMngService.insertFileInfs(result);
			    		vo.setImage_file_id(atchFileId);
			    	}
			    	
			    	if(files.containsKey("event_doc_file") && !files.get("event_doc_file").isEmpty()){
			    		result = fileUtil.parseFileInf(getFileMap("event_doc_file", files.get("event_doc_file")), "FRM_",0,"","");
			    		atchFileId = fileMngService.insertFileInfs(result);
			    		vo.setEvent_doc_file_id(atchFileId);
			    	}
		    	}
		    	
		    	if(!vo.getConfirm_status().equals("대기")){
		    		vo.setConfirm_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date()));
		    	}else
		    		vo.setConfirm_date(null);
		    	
				eventService.updateEvent(vo);
		    }catch(Exception ex){
		    	LOGGER.error("eventRegistAction : " + ex.getMessage());
		    	model.addAttribute("resultMsg", "fail.common.update");
		    	return "forward:/cvb/form/event_edit.do?idx=" + vo.getIdx();
		    }
			
			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/cvb/form/event_edit.do?idx=" + vo.getIdx();
		}
		
		@RequestMapping("/cvb/form/event_delete.do")
		public String rdelete(@RequestParam("idx") String idx, ModelMap model) throws Exception {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			
			EventVO vo = new EventVO();
			vo.setIdx(Integer.parseInt(idx));
			vo.setExpire_id(user.getId());
			eventService.deleteEvent(vo);
			model.addAttribute("resultMsg", "success.common.delete");
			return "redirect:/cvb/form/event_list.do";
		}
		
		private Map<String, MultipartFile> getFileMap(String key, MultipartFile file){
			HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
			map.put(key, file);
			return map;  
		}
}