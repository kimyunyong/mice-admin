package com.mice.common.log.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibm.icu.text.SimpleDateFormat;
import com.mice.common.log.service.LogVO;
import com.mice.common.log.service.LogWService;

@Controller
public class LogController {

	@Resource(name = "LogWService")
	private LogWService logService;
	
	@RequestMapping("/log/info.do")
	public String LogList(LogVO vo, ModelMap model) throws Exception{
		
		if(!vo.getSearchEndDate().equals(""))
			vo.setSearchEndDate(vo.getSearchEndDate().replace("-", ""));
		if(!vo.getSearchStartDate().equals(""))
			vo.setSearchStartDate(vo.getSearchStartDate().replace("-", ""));
		model.addAttribute("vo",logService.selectLog(vo));
		
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		
		vo.setSearchStartDate(sdf.format(date) + "0101");
		vo.setSearchEndDate(sdf.format(date) + "0131");
		model.addAttribute("JAN",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0201");
		vo.setSearchEndDate(sdf.format(date) + "0231");
		model.addAttribute("FEB",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0301");
		vo.setSearchEndDate(sdf.format(date) + "0331");
		model.addAttribute("MAR",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0401");
		vo.setSearchEndDate(sdf.format(date) + "0431");
		model.addAttribute("APR",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0501");
		vo.setSearchEndDate(sdf.format(date) + "0531");
		model.addAttribute("MAY",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0601");
		vo.setSearchEndDate(sdf.format(date) + "0631");
		model.addAttribute("JUN",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0701");
		vo.setSearchEndDate(sdf.format(date) + "0731");
		model.addAttribute("JUL",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0801");
		vo.setSearchEndDate(sdf.format(date) + "0831");
		model.addAttribute("AUG",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "0901");
		vo.setSearchEndDate(sdf.format(date) + "0931");
		model.addAttribute("SEP",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "1001");
		vo.setSearchEndDate(sdf.format(date) + "1031");
		model.addAttribute("OCT",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "1101");
		vo.setSearchEndDate(sdf.format(date) + "1131");
		model.addAttribute("NOV",logService.selectLog(vo));
		vo.setSearchStartDate(sdf.format(date) + "1201");
		vo.setSearchEndDate(sdf.format(date) + "1231");
		model.addAttribute("DEC",logService.selectLog(vo));
		return "mice/log/webLogList";
	}
}
