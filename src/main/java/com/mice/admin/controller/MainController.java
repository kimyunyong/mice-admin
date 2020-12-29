package com.mice.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uss.umt.service.EgovEntrprsManageService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.com.uss.umt.service.EntrprsManageVO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserManageVO;
import egovframework.com.sec.rgm.service.AuthorGroup;
import egovframework.com.sec.rgm.service.EgovAuthorGroupService;
@Controller
public class MainController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);

	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Resource(name = "egovAuthorGroupService")
    private EgovAuthorGroupService egovAuthorGroupService;
	
	/** userManageService */
	@Resource(name = "userManageService")
	private EgovUserManageService userManageService;
	
	/** entrprsManageService */
	@Resource(name = "entrprsManageService")
	private EgovEntrprsManageService entrprsManageService;
	
	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;
	
	@RequestMapping("/member/userRegist.do")
	public String userRegist(ModelMap model) {
		return "mice/member/memberInsert";
	}
	
	@RequestMapping("/member/userRegistAction.do")
	public String userRegistAction(@ModelAttribute("userManageVO") UserManageVO userManageVO, BindingResult bindingResult, Model model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		beanValidator.validate(userManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", "fail.common.insert");
			return "redirect:/member/userRegist.do?action=adminRegist";
		} else {
			String permission = userManageVO.getPermission();
			userManageVO.setEmplyrSttusCode("P");
			userManageService.insertUser(userManageVO);
			String uniqueId = userManageVO.getUniqId();
			userManageVO = userManageService.selectUser(uniqueId);
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(uniqueId);
    		authorGroup.setAuthorCode(permission);
    		authorGroup.setMberTyCode(userManageVO.getMberTy());// 2011.08.04 수정 부분
    		
    		egovAuthorGroupService.insertAuthorGroup(authorGroup);
			//Exception 없이 진행시 등록성공메시지
			model.addAttribute("resultMsg", "success.common.insert");
		}
		return "forward:/uss/umt/EgovUserManage.do?action=adminRegist";
		
	}
	
	@RequestMapping("/member/entRegistAction.do")
	public String entRegistAction(@ModelAttribute("entrprsManageVO") EntrprsManageVO entrprsManageVO, BindingResult bindingResult, Model model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		beanValidator.validate(entrprsManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", "fail.common.insert");
			return "redirect:/member/userRegist.do?action=entRegist";
		} else {
			entrprsManageVO.setEntrprsMberSttus("P");
			entrprsManageService.insertEntrprsmber(entrprsManageVO);
			String uniqueId = entrprsManageVO.getUniqId();
			entrprsManageVO = entrprsManageService.selectEntrprsmber(uniqueId);
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(uniqueId);
    		authorGroup.setAuthorCode("ROLE_COWORK");
    		authorGroup.setMberTyCode(null);// 2011.08.04 수정 부분
    		
    		egovAuthorGroupService .insertAuthorGroup(authorGroup);
			//Exception 없이 진행시 등록성공메시지
			model.addAttribute("resultMsg", "success.common.insert");
		}
		return "forward:/uss/umt/EgovEntrprsMberManage.do?action=entRegist";
		
	}
	
	@RequestMapping("/member/nomalRegistAction.do")
	public String nomalRegistAction(@ModelAttribute("mberManageVO") MberManageVO mberManageVO, BindingResult bindingResult, Model model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		beanValidator.validate(mberManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", "fail.common.insert");
			return "redirect:/member/userRegist.do?action=nomalRegist";
		} else {
			mberManageVO.setMberSttus("P");
			mberManageService.insertMber(mberManageVO);
			
			String uniqueId = mberManageVO.getUniqId();
			mberManageVO = mberManageService.selectMber(uniqueId);
			AuthorGroup authorGroup = new AuthorGroup();
			authorGroup.setUniqId(uniqueId);
    		authorGroup.setAuthorCode("ROLE_ALLIANCE");
    		authorGroup.setMberTyCode(null);// 2011.08.04 수정 부분
    		
    		egovAuthorGroupService .insertAuthorGroup(authorGroup);
			//Exception 없이 진행시 등록성공메시지
			model.addAttribute("resultMsg", "success.common.insert");
		}
		return "forward:/uss/umt/EgovMberManage.do?action=entRegist";
		
	}
	
	@RequestMapping("/member/idDuplicate.do")
	@ResponseBody
	public String idDuplicate(@RequestParam("id") String id, ModelMap model) throws Exception{
		int res = userManageService.checkIdDplct(id);
	    return res == 0 ? "Y": "N";
	}
}
