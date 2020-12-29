package com.mice.cvb.lodgment.web;

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

import com.mice.cvb.lodgment.service.LodgmentService;
import com.mice.cvb.lodgment.service.LodgmentVO;
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
public class CVBLodgmentController {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComIndexController.class);

	@Resource(name = "LodgmentService")
	LodgmentService lodgmentService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@RequestMapping("/cvb/lodgment/list.do")
	public String list(@ModelAttribute("lodgmentVO") LodgmentVO vo,
			ModelMap model) throws Exception {
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
		Map<String, Object> map = lodgmentService.list(vo);
		int totCnt = (int) map.get("resultListCount");

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		return "mice/lodgment/list";
	}

	@RequestMapping("/cvb/lodgment/insert.do")
	public String insertView(ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		return "mice/lodgment/insert";
	}

	@RequestMapping("/cvb/lodgment/insert_action.do")
	public String insertAction(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("lodgmentVO") LodgmentVO vo,
			BindingResult bindingResult, SessionStatus status, ModelMap model) {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setReg_id(user.getId());

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";

		try {
			if (!files.isEmpty()) {
				if (files.containsKey("image_file_path1")
						&& !files.get("image_file_path1").isEmpty()) {
					result = fileUtil.parseFileInf(
							getFileMap("image_file_path1",
									files.get("image_file_path1")), "FRM_", 0,
							"", "");
					atchFileId = fileMngService.insertFileInfs(result);
					vo.setImage_file_path1(atchFileId);
				}

				if (files.containsKey("image_file_path2")
						&& !files.get("image_file_path2").isEmpty()) {
					result = fileUtil.parseFileInf(
							getFileMap("image_file_path2",
									files.get("image_file_path2")), "FRM_", 0,
							"", "");
					atchFileId = fileMngService.insertFileInfs(result);
					vo.setImage_file_path2(atchFileId);
				}

				if (files.containsKey("image_file_path3")
						&& !files.get("image_file_path3").isEmpty()) {
					result = fileUtil.parseFileInf(
							getFileMap("image_file_path3",
									files.get("image_file_path3")), "FRM_", 0,
							"", "");
					atchFileId = fileMngService.insertFileInfs(result);
					vo.setImage_file_path3(atchFileId);
				}
			}

			lodgmentService.insert(vo);
			model.addAttribute("resultMsg", "success.common.insert");
		} catch (Exception ex) {
			LOGGER.error(ex.getMessage());
			model.addAttribute("resultMsg", "fail.common.insert");
		}
		return "redirect:/cvb/lodgment/list.do";
	}

	@RequestMapping("/cvb/lodgment/edit.do")
	public String updateView(@RequestParam("idx") String idx, ModelMap model)
			throws Exception {
		LodgmentVO vo = new LodgmentVO();
		vo.setIdx(Integer.parseInt(idx));
		model.addAttribute("result", lodgmentService.select(vo));
		return "mice/lodgment/edit";
	}

	@RequestMapping("/cvb/lodgment/edit_action.do")
	public String updateAction(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("lodgmentVO") LodgmentVO vo,
			BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		List<FileVO> result = null;
		String atchFileId = "";

		try {
			if (!files.isEmpty()) {
				if (files.containsKey("image_file_path1")
						&& !files.get("image_file_path1").isEmpty()) {
					result = fileUtil.parseFileInf(
							getFileMap("image_file_path1",
									files.get("image_file_path1")), "FRM_", 0,
							"", "");
					atchFileId = fileMngService.insertFileInfs(result);
					vo.setImage_file_path1(atchFileId);
				}

				if (files.containsKey("image_file_path2")
						&& !files.get("image_file_path2").isEmpty()) {
					result = fileUtil.parseFileInf(
							getFileMap("image_file_path2",
									files.get("image_file_path2")), "FRM_", 0,
							"", "");
					atchFileId = fileMngService.insertFileInfs(result);
					vo.setImage_file_path2(atchFileId);
				}

				if (files.containsKey("image_file_path3")
						&& !files.get("image_file_path3").isEmpty()) {
					result = fileUtil.parseFileInf(
							getFileMap("image_file_path3",
									files.get("image_file_path3")), "FRM_", 0,
							"", "");
					atchFileId = fileMngService.insertFileInfs(result);
					vo.setImage_file_path3(atchFileId);
				}
			}

			lodgmentService.update(vo);
			model.addAttribute("resultMsg", "success.common.update");
		} catch (Exception ex) {
			LOGGER.error(ex.getMessage());
		}
		return "redirect:/cvb/lodgment/edit.do?idx=" + vo.getIdx();
	}

	@RequestMapping("/cvb/lodgment/delete_action.do")
	public String deleteAction(@RequestParam("idx") String idx, ModelMap model)
			throws Exception {
		LodgmentVO vo = new LodgmentVO();
		vo.setIdx(Integer.parseInt(idx));
		lodgmentService.delete(vo);
		model.addAttribute("resultMsg", "success.common.delete");
		return "redirect:/cvb/lodgment/list.do";
	}

	@RequestMapping("/cvb/lodgment/info.do")
	public String infoView(@RequestParam("idx") String idx, ModelMap model)
			throws Exception {
		LodgmentVO vo = new LodgmentVO();
		vo.setIdx(Integer.parseInt(idx));
		model.addAttribute("result", lodgmentService.select(vo));
		return "mice/lodgment/info";
	}

	private Map<String, MultipartFile> getFileMap(String key, MultipartFile file) {
		HashMap<String, MultipartFile> map = new HashMap<String, MultipartFile>();
		map.put(key, file);
		return map;
	}
}
