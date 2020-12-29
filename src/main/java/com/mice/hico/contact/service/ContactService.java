package com.mice.hico.contact.service;

import java.util.Map;

public interface ContactService {
	
	public void delete(ContactVO vo) throws Exception;
	
	public void update(ContactVO vo) throws Exception;
	
	public ContactVO select(int idx) throws Exception;
	
	public Map<String, Object> list(ContactVO vo) throws Exception;
	
	public int listCnt(ContactVO vo) throws Exception;
}
