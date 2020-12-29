package com.mice.cvb.brochure.service;

import java.util.Map;

public interface BrochureService {
	public Map<String, Object> list(BrochureVO vo);
	public BrochureVO info(int idx);
	public void update(BrochureVO vo);
	public void delete(BrochureVO vo);
	public void insert(BrochureVO vo);
}
