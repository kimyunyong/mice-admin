package com.mice.common.banner.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mice.common.banner.service.BannerService;
import com.mice.common.banner.service.BannerVO;

@Service("BannerService")
public class BannerServiceImpl implements BannerService {

	@Resource(name = "BannerDAO")
	BannerDAO dao;
	
	@Override
	public Map<String, Object> list(BannerVO vo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", dao.list(vo));
		map.put("resultListCount", dao.listCount(vo));
		return map;
	}

	@Override
	public BannerVO select(BannerVO vo) {
		// TODO Auto-generated method stub
		return dao.select(vo);
	}

	@Override
	public void insert(BannerVO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void update(BannerVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(BannerVO vo) {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public int getSortNo(BannerVO vo) {
		// TODO Auto-generated method stub
		return dao.getSortNo(vo);
	}

	@Override
	public void updateSortNo(BannerVO vo) {
		// TODO Auto-generated method stub
		dao.updateSortNo(vo);
	}

}
