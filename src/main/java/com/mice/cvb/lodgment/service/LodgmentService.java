package com.mice.cvb.lodgment.service;

import java.util.Map;

public interface LodgmentService {
	
	public void delete(LodgmentVO vo);
	public void update(LodgmentVO vo);
	public LodgmentVO select(LodgmentVO vo);
	public Map<String, Object> list(LodgmentVO vo);
	public int listCount(LodgmentVO vo);
	public void insert(LodgmentVO vo);
}
