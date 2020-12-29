package com.mice.hico.form.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mice.hico.form.service.Form;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("FormDAO")
public class FormDAO  extends EgovComAbstractDAO  {

	public List<Form> list(){
		return (List<Form>)list("FormDAO.list",null);
	}
	
	public void update(Form vo){
		update("FormDAO.update", vo);
	}
}
