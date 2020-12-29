package com.mice.hico.form.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.hico.form.service.Form;
import com.mice.hico.form.service.FormService;
import java.util.List;

@Service("FormService")
public class FormServiceImpl implements FormService{

	@Resource(name = "FormDAO")
	FormDAO dao;
	
	@Override
	public List<Form> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void update(Form vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

}
