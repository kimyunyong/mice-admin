package com.mice.common.migration.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mice.common.encrypt.AESGenerator;
import com.mice.common.migration.service.MigVO;
import com.mice.common.migration.service.MigrationService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class MigrationController {

	@Resource(name = "MigrationService")
	MigrationService service;
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@RequestMapping("com/mig/list.do")
	@ResponseBody
	public String MigList(@RequestParam("idxn") String idxName, @RequestParam("tb") String searchTable, @RequestParam("fn") String fieldName) throws Exception{
		
		MigVO vo = new MigVO();
		vo.setSearchTable(searchTable);
		vo.setSearchFieldName(fieldName);
		vo.setIdxName(idxName);
		List<MigVO> list = service.listMig(vo);
		for(int i=0;i<list.size();i++){
			MigVO setVO = list.get(i);
			setVO.setSearchTable(searchTable);
			setVO.setSearchFieldName(fieldName);
			setVO.setIdxName(idxName);
			setVO.setData(AESGenerator.decrypt(setVO.getData()));
			service.setMig(setVO);
		}
		
		return "OK";
	}
}
