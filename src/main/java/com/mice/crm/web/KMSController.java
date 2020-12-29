package com.mice.crm.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mice.crm.service.CRMService;
import com.mice.crm.service.CodeVO;
import com.mice.crm.service.KMSEvaluateCurrVO;
import com.mice.crm.service.KMSEvaluateSearchVO;
import com.mice.crm.service.KMSEvaluateVO;
import com.mice.crm.service.KMSInsertVO;
import com.mice.crm.service.KMSLogVO;
import com.mice.crm.service.KMSMemberVO;
import com.mice.crm.service.KMSSearchVO;
import com.mice.crm.service.KMSService;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uss.umt.service.UserManageVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 
 * @이름 : KMSController
 * @최초생성일 : 2018-05-15
 * @최초작성자 : 푸른들 소프트 - 김윤용
 * @설명 : KMS
 * 
 **/

@Controller
public class KMSController {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComIndexController.class);

	@Resource(name = "KMSService")
	private  KMSService service;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "CRMService")
	   CRMService crmService;
	
	@RequestMapping("/crm/code/select_box3.do")
	public String codeSelectBox3(@ModelAttribute("CodeVO") CodeVO vo,
			@RequestParam Map<String, Object> map, ModelMap model)
			throws Exception {

		model.addAttribute("name", map.get("name"));
		vo.setSearchType(map.get("type").toString());
		model.addAttribute("resultList", crmService.listCode(vo));
		
		if (map.containsKey("result") && map.get("result").hashCode() != 0)
			model.addAttribute("result", map.get("result"));
		
		return "mice/crm/code/select_box3";
	}
	
	@RequestMapping("/crm/kms/deleteFileAsync.do")
	public ModelAndView deleteFileAsync(KMSSearchVO vo, Model model){
		// 삭제
		service.deleteFile(vo);
		
		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mav.addObject("startPage", paginationInfo.getFirstPageNoOnPageList());
		mav.addObject("endPage", paginationInfo.getLastPageNoOnPageList());
		mav.addObject("totalRecordCount", paginationInfo.getTotalRecordCount());
		mav.addObject("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}

	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
	
	@RequestMapping("/crm/kms/downloadFileLog.do")
	public ModelAndView downloadFileLog(KMSLogVO vo){				
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setDownload_id(user.getId());
		System.out.println("들어왔음...");
		service.logInsertAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("/crm/kms/downloadFile.do")
	public ModelAndView downloadFile(KMSLogVO vo, Model model, @RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{				
		String atchFileId = (String) commandMap.get("atchFileId");
		String fileSn = (String) commandMap.get("fileSn");
		
		System.out.println("test : " + atchFileId);
		
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(atchFileId);
			fileVO.setFileSn(fileSn);
			
			FileVO fvo = service.selectFileInf(fileVO);
			
			File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
			long fSize = uFile.length();
	
			if (fSize > 0) {
				String mimetype = "application/x-msdownload";
				
				response.setContentType(mimetype);
				setDisposition(fvo.getOrignlFileNm(), request, response);

				BufferedInputStream in = null;
				BufferedOutputStream out = null;

				try {
					in = new BufferedInputStream(new FileInputStream(uFile));
					out = new BufferedOutputStream(response.getOutputStream());

					FileCopyUtils.copy(in, out);
					out.flush();
				} catch (IOException ex) {
					// 다음 Exception 무시 처리
					// Connection reset by peer: socket write error
					EgovBasicLogger.ignore("IO Exception", ex);
				} finally {
					EgovResourceCloseHelper.close(in, out);
				}

			} else {
				response.setContentType("application/x-msdownload");

				PrintWriter printwriter = response.getWriter();
				
				printwriter.println("<html>");
				printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fvo.getOrignlFileNm() + "</h2>");
				printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
				printwriter.println("<br><br><br>&copy; webAccess");
				printwriter.println("</html>");
				
				printwriter.flush();
				printwriter.close();
			}
		}
	
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping("/crm/kms/deleteFile.do")
	public String deleteFile(KMSSearchVO vo, Model model) {
		
		service.deleteFile(vo);
		
		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getTeamList = service.getAllTeam();
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		model.addAttribute("getFileList", getFileList);
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
	    
		UserManageVO getUserInfo = service.teamPositionById(user.getId());
		model.addAttribute("getUserInfo", getUserInfo);	    
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		model.addAttribute("getTeamList", getTeamList);
		model.addAttribute("count", count);
		
		return "mice/crm/kms/list";
	}
	@RequestMapping("/crm/kms/asyncList.do")
	public ModelAndView syncListFile(KMSSearchVO vo, Model model) {
		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("count", count);
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mav.addObject("startPage", paginationInfo.getFirstPageNoOnPageList());
		mav.addObject("endPage", paginationInfo.getLastPageNoOnPageList());
		mav.addObject("totalRecordCount", paginationInfo.getTotalRecordCount());
		mav.addObject("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		mav.addObject("lastIndex", paginationInfo.getLastPageNo());
		mav.addObject("firstIndex", paginationInfo.getFirstPageNo());
		
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping("/crm/kms/list.do")
	public String listFile(KMSSearchVO vo, Model model, HttpSession session) {
		
		if(session.getAttribute("position").equals("") ){
	    	return "redirect:/Main.do";
	    }
		
		int count = service.getFileCount(vo);
				
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getTeamList = service.getAllTeam();
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
	    		
		UserManageVO getUserInfo = service.teamPositionById(user.getId());
		model.addAttribute("getUserInfo", getUserInfo);	    
	    
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		model.addAttribute("getFileList", getFileList);
	
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		model.addAttribute("getTeamList", getTeamList);
		model.addAttribute("count", count);
	
		
		
		return "mice/crm/kms/list";
	}
	
	
	@RequestMapping("/crm/kms/getEmp.do")
	public ModelAndView getEmp(int team_idx, Model model) {		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		user.getId();
	    KMSMemberVO vo = new KMSMemberVO();
	
	     vo.setTeam_idx(team_idx);
	     vo.setUserId(user.getId());
	     
		List<KMSSearchVO> getEmpList = service.getEmpByTeam(vo);
		
		//System.out.println(getEmpList.get(0).toString());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("getEmpList", getEmpList);
		mav.setViewName("jsonView");

		return mav;
	}
	
	@RequestMapping("/crm/kms/folder.do")
	public String teamlist(Model model, HttpSession session) {
		
		if(session.getAttribute("position").equals("")){
	    	return "redirect:/Main.do";
	    }
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		 KMSMemberVO vo = new KMSMemberVO();
			
		List<KMSSearchVO> getTeamList = service.getTeam(user.getId());
		
		model.addAttribute("getTeamList", getTeamList);
		
		 vo.setTeam_idx(Integer.parseInt(getTeamList.get(0).getTeam_idx()));
	     vo.setUserId(user.getId());
		
		List<KMSSearchVO> getEmpList = service.getEmpByTeam(vo);
		model.addAttribute("getEmpList", getEmpList);
	    
		return "mice/crm/kms/folder";
	}
	
	@RequestMapping("/crm/kms/getFolder.do")
	public ModelAndView getFolder(@ModelAttribute("KMSSearchVO") KMSSearchVO vo, Model model) {
		//System.out.println(team_idx);
		List<KMSSearchVO> getFolderList = service.getAllFolder(vo);
		
		//System.out.println(getEmpList.get(0).toString());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("getFolderList", getFolderList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/getEmpByTeam.do")
	public ModelAndView getEmpByTeam(KMSSearchVO vo, Model model) {

		int count = service.getFileCount(vo);
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		UserManageVO getUserInfo = service.teamPositionById(user.getId());
		
		List<KMSSearchVO> getEmpList = service.getEmpByTeam(Integer.parseInt(vo.getTeam_idx()));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("getUserInfo", getUserInfo);
		mav.addObject("getEmpList", getEmpList);
		mav.addObject("count", count);
		
		mav.setViewName("jsonView");

		return mav;
	}
	
	@RequestMapping("/crm/kms/getPro.do")
	public ModelAndView getPro(KMSSearchVO vo, Model model) {
		List<KMSSearchVO> getProList = service.getProByEmp(vo);
		
		vo.setProject_code("0");
		vo.setCategory_code("0");
		vo.setYears_code("0");
		vo.setFolder_1_code("0");
		vo.setFolder_2_code("0");
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		System.out.println("size : " + getFileList.size());
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("getProList", getProList);
		
		mav.setViewName("jsonView");

		return mav;
	}
	@RequestMapping("/crm/kms/getCate.do")
	public ModelAndView getCate(KMSSearchVO vo, Model model) {
		List<KMSSearchVO> getCateList = service.getCateByPro(vo);
		vo.setCategory_code("0");
		vo.setYears_code("0");
		vo.setFolder_1_code("0");
		vo.setFolder_2_code("0");
				
		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("count", count);
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("getCateList", getCateList);
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mav.addObject("startPage", paginationInfo.getFirstPageNoOnPageList());
		mav.addObject("endPage", paginationInfo.getLastPageNoOnPageList());
		mav.addObject("totalRecordCount", paginationInfo.getTotalRecordCount());
		mav.addObject("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		mav.addObject("lastIndex", paginationInfo.getLastPageNo());
		mav.addObject("firstIndex", paginationInfo.getFirstPageNo());
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/getYears.do")
	public ModelAndView getYears(KMSSearchVO vo, Model model) {
		List<KMSSearchVO> getYearsList = service.getYearsByCate(vo);
		
		vo.setYears_code("0");
		vo.setFolder_1_code("0");
		vo.setFolder_2_code("0");
		
		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		mav.addObject("getFileList", getFileList);
		mav.addObject("getYearsList", getYearsList);
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mav.addObject("startPage", paginationInfo.getFirstPageNoOnPageList());
		mav.addObject("endPage", paginationInfo.getLastPageNoOnPageList());
		mav.addObject("totalRecordCount", paginationInfo.getTotalRecordCount());
		mav.addObject("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		mav.addObject("lastIndex", paginationInfo.getLastPageNo());
		mav.addObject("firstIndex", paginationInfo.getFirstPageNo());
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/getFolder1.do")
	public ModelAndView getFolder_1(KMSSearchVO vo, Model model) {
		List<KMSSearchVO> getFolder_1List = service.getFolder_1ByYears(vo);
		vo.setFolder_1_code("0");
		vo.setFolder_2_code("0");
		
		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mav.addObject("startPage", paginationInfo.getFirstPageNoOnPageList());
		mav.addObject("endPage", paginationInfo.getLastPageNoOnPageList());
		mav.addObject("totalRecordCount", paginationInfo.getTotalRecordCount());
		mav.addObject("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		mav.addObject("lastIndex", paginationInfo.getLastPageNo());
		mav.addObject("firstIndex", paginationInfo.getFirstPageNo());
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("getFolder_1List", getFolder_1List);
		mav.setViewName("jsonView");

		return mav;
	}
	@RequestMapping("/crm/kms/getFolder2.do")
	public ModelAndView getFolder_2(KMSSearchVO vo, Model model) {
		List<KMSSearchVO> getFolder_2List = service.getFolder_2ByFolder_1(vo);
		vo.setFolder_2_code("0");
		
		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mav.addObject("startPage", paginationInfo.getFirstPageNoOnPageList());
		mav.addObject("endPage", paginationInfo.getLastPageNoOnPageList());
		mav.addObject("totalRecordCount", paginationInfo.getTotalRecordCount());
		mav.addObject("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		mav.addObject("lastIndex", paginationInfo.getLastPageNo());
		mav.addObject("firstIndex", paginationInfo.getFirstPageNo());
		
		
		mav.addObject("getFileList", getFileList);
		mav.addObject("getFolder_2List", getFolder_2List);
		
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/getFolderLast.do")
	public ModelAndView getFolderLast(KMSSearchVO vo, Model model) {

		int count = service.getFileCount(vo);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		paginationInfo.setTotalRecordCount(count);
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KMSSearchVO> getFileList = service.getFileList(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		
		mav.addObject("getFileList", getFileList);
		
		mav.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mav.addObject("startPage", paginationInfo.getFirstPageNoOnPageList());
		mav.addObject("endPage", paginationInfo.getLastPageNoOnPageList());
		mav.addObject("totalRecordCount", paginationInfo.getTotalRecordCount());
		mav.addObject("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		mav.addObject("lastIndex", paginationInfo.getLastPageNo());
		mav.addObject("firstIndex", paginationInfo.getFirstPageNo());
		
		mav.addObject("getFileList", getFileList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/uploadFile.do")
	public ModelAndView uploadFile(KMSSearchVO vo, MultipartHttpServletRequest multiRequest) throws Exception{
		List<FileVO> result = null;
		String atchFileId = "";
		
		for (Entry<String, List<MultipartFile>> map : multiRequest
				.getMultiFileMap().entrySet()) {
			for (int i = 0; i < map.getValue().size(); i++) {
				result = fileUtil.parseFileInf(
						getFileMap(map.getKey(), map.getValue().get(i)),
						"FRM_", 0, "", "");
				
				vo.setAtchFileId(result.get(0).getAtchFileId());
				vo.setFileStreCours(result.get(0).getFileStreCours());
				vo.setStreFileNm(result.get(0).getStreFileNm());
				vo.setOrignlFileNm(result.get(0).getOrignlFileNm());
				vo.setFileExtsn(result.get(0).getFileExtsn());
				vo.setFileCn(result.get(0).getFileCn());
				vo.setFileMg(result.get(0).getFileMg());
								
				atchFileId = service.insertFileInf(vo);
				
				if(atchFileId != null && !atchFileId.equals("")) {
				
					// 업로드를 한뒤 남길 로그 코드 삽입
				}
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", "success");
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping("/crm/kms/upload.do")
	public String uploadFile(KMSSearchVO vo, Model model, HttpSession session){
		
		if(session.getAttribute("position").equals("")){
	    	return "redirect:/Main.do";
	    }
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		KMSMemberVO vo1 = new KMSMemberVO();
	    List<KMSSearchVO> getTeamList = service.getTeam(user.getId());
	      
	    model.addAttribute("getTeamList", getTeamList);
		
	    vo1.setTeam_idx(Integer.parseInt(getTeamList.get(0).getTeam_idx()));
	     vo1.setUserId(user.getId());
		
		List<KMSSearchVO> getEmpList = service.getEmpByTeam(vo1);
		model.addAttribute("getEmpList", getEmpList);
	    
		return "mice/crm/kms/upload";
	}
	
	private Map<String, MultipartFile> getFileMap(String key, MultipartFile file){
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;
	}
	
	@RequestMapping("/crm/kms/project_insert_action.do")
	public ModelAndView projectInsertAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		System.out.println("projectInsertAction"+vo.getTeam_idx()+vo.getEmp_name()+vo.getName());
		model.addAttribute("team_idx",vo.getTeam_idx());
		model.addAttribute("emp_name",vo.getEmp_name());
		service.projectInsertAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	@RequestMapping("/crm/kms/category_insert_action.do")
	public ModelAndView categoryInsertAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.categoryInsertAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/years_insert_action.do")
	public ModelAndView yearsInsertAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.yearsInsertAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/folder_1_insert_action.do")
	public ModelAndView folder1InsertAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.folder1InsertAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/folder_2_insert_action.do")
	public ModelAndView folder2InsertAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.folder2InsertAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/project_update_action.do")
	public ModelAndView projectUpdateAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.projectUpdateAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/category_update_action.do")
	public ModelAndView categoryUpdateAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.categoryUpdateAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/years_update_action.do")
	public ModelAndView yearsUpdateAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.yearsUpdateAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/folder_1_update_action.do")
	public ModelAndView folder1UpdateAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.folder1UpdateAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/folder_2_update_action.do")
	public ModelAndView folder2UpdateAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.folder2UpdateAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	@RequestMapping("/crm/kms/project_delete_action.do")
	public ModelAndView projectDeleteAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.projectDeleteAction(vo);
		service.fileDeleteAction(vo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/category_delete_action.do")
	public ModelAndView categoryDeleteAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.categoryDeleteAction(vo);
		service.fileDeleteAction(vo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/years_delete_action.do")
	public ModelAndView yearsDeleteAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.yearsDeleteAction(vo);
		service.fileDeleteAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/folder_1_delete_action.do")
	public ModelAndView folder1DeleteAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.folder1DeleteAction(vo);
		service.fileDeleteAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping("/crm/kms/folder_2_delete_action.do")
	public ModelAndView folder2DeleteAction(@ModelAttribute("KMSInsertVO") KMSInsertVO vo, Model model){
		
		service.folder2DeleteAction(vo);
		service.fileDeleteAction(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping("/crm/kms/evaluate.do")
	public String evaluate(@ModelAttribute("KMSEvaluateVO") KMSEvaluateVO vo, Model model, HttpSession session) {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		user.getId();
		
		List<KMSSearchVO> getTeamList = service.getTeam(user.getId());
		
		if(getTeamList.size() != 0){
		vo.setTeam_idx(getTeamList.get(0).getTeam_idx());
		}
		List<KMSEvaluateSearchVO> getEvaluateList = service.getEvaluateList(vo);
	    if(getEvaluateList != null){
	    	
	    model.addAttribute("vo",vo);	
		model.addAttribute("getEvaluateList", getEvaluateList);
	    }
		
		//List<KMSSearchVO> getTeamList = service.getAllTeam();
		
		//model.addAttribute("getTeamList", getTeamList);
		
	    if(session.getAttribute("position").equals("") || session.getAttribute("position").equals("237")){
	    	return "redirect:/Main.do";
	    }
	    
		return "mice/crm/kms/evaluate";
	}
	
	@RequestMapping("/crm/kms/evaluate_insert_action.do")
	public String evaluateInsertAction( @ModelAttribute("KMSEvaluateCurrVO")KMSEvaluateCurrVO vo2){
		
		
		if(vo2.getCurr_point() == ""){
		service.evaluateInsertAction(vo2);
		}else{
		service.evaluateUpdateAction(vo2);	
		}
		
		KMSEvaluateVO vo1 = new KMSEvaluateVO();
		
		vo1.setYears(vo2.getYears());
		vo1.setTeam_idx(vo2.getTeam_idx());
		vo1.setEmp_id(vo2.getEmp_id());
		
		return "redirect:/crm/kms/evaluate.do?years="+vo2.getYears()+"&team_idx="+vo2.getTeam_idx()+"&emp_id="+vo2.getEmp_id();
	}
	@RequestMapping("/crm/kms/getLog.do")
	public ModelAndView getLog(String atchFileId, Model model) {
		System.out.println(atchFileId);
		 
		List<KMSLogVO> getLogList = service.getFileLog(atchFileId);
		
		//System.out.println(" getLogList[0] " + getLogList.get(0).getAtchFileId());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("getLogList", getLogList);
		mav.setViewName("jsonView");
		
		return mav;
	}

}