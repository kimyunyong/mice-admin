package com.mice.hico.contact.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;






import org.springframework.stereotype.Service;

import com.mice.hico.contact.service.ContactService;
import com.mice.hico.contact.service.ContactVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ContactService")
public class ContactServiceImpl  extends EgovAbstractServiceImpl implements ContactService {

	@Resource(name = "ContactDAO")
	private ContactDAO dao;

	@Override
	public void delete(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteContact(vo);
	}

	@Override
	public void update(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateContact(vo);
	}

	@Override
	public ContactVO select(int idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectContact(idx);
	}

	@Override
	public Map<String, Object> list(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		List<ContactVO> lst = dao.listContact(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", lst);
		map.put("resultListCount", listCnt(vo));
		return map;
	}

	@Override
	public int listCnt(ContactVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCnt(vo);
	}
	

}
