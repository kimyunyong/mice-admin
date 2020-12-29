package com.mice.crm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mice.crm.service.CRMService;
import com.mice.crm.service.CodeVO;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
/**
 *  
 * 	@이름 : 시설 관리 컨트롤러
 * 	@최초생성일 : 20171012
 * 	@최초작성자 : 푸른들 김윤용
 * 	@설명 : 시설 관리 CRUD 컨트롤러
 * 
**/

@Controller
public class CRMFacilityController {
	@Resource(name = "CRMService")
	CRMService service;
	
	/* 시설 리스트 */
	@RequestMapping("/crm/fac/listFacility.do")
	public String listFacility(@ModelAttribute("CodeVO") CodeVO vo, Model model){
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		/* 사용자가 선택한 시설 타입에 의해 시설 정보를 가져온다. */
		if(vo.getSearchType() == "" && vo.getType() != ""){
			vo.setSearchType(vo.getType());
		}else if(vo.getSearchType() == "" && vo.getType() == ""){
			vo.setSearchType("null");
		}
		
		List<CodeVO> getCodeVoes = service.listCode(vo);
		model.addAttribute("resultList", getCodeVoes);
		
		List<CodeVO> codes = service.listCodeType();			
		List<CodeVO> refinedCodes = new ArrayList<CodeVO>();
		
		/*가져온 코드 타입에서 '대관시설'만 분류해 refinedCode에 넣는다.*/
		for(CodeVO code : codes){
			if(code.getType().equals("1층") || code.getType().equals("2층") || code.getType().equals("3층")|| code.getType().equals("기타")){
				
				refinedCodes.add(code);
			}
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("codes", refinedCodes);
		
		return "mice/crm/fac/list";
	}
	
	/* 시설 추가 */
	@RequestMapping("/crm/fac/insert.do")
	public String insertFacility(RedirectAttributes redirectAttr,
			@ModelAttribute("CodeVO") CodeVO vo, ModelMap model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		service.insertCode(vo);
		model.addAttribute("CodeVO", vo);
		redirectAttr.addFlashAttribute("CodeVO", vo);
		
		return "redirect:/crm/fac/listFacility.do";
	}
	
	/* 시설 삭제 */
	@RequestMapping("/crm/fac/delete.do")
	public String deleteFacility(RedirectAttributes redirectAttr,
			@ModelAttribute("CodeVO") CodeVO vo, ModelMap model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		service.deleteCode(vo);
		redirectAttr.addFlashAttribute("CodeVO", vo);
		redirectAttr.addFlashAttribute("resultMsg", "success.common.delete");
		
		return "redirect:/crm/fac/listFacility.do";
	}
	
	/* 시설 수정 */
	@RequestMapping("/crm/fac/update.do")
	public String updateFacility(RedirectAttributes redirectAttr,
			@ModelAttribute("CodeVO") CodeVO vo, ModelMap model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/Main.do";
		}
		
		service.updateCode(vo);
		redirectAttr.addFlashAttribute("CodeVO", vo);
		return "redirect:/crm/fac/listFacility.do";
	}
}
