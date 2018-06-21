package com.skt.mars.adm.st;

import java.util.List;
import java.util.Map;

public interface StatesService {

	public List selectList(String sqlMapId, Map<String, String> requestMap);

	public List selectListForNoPage(String sqlMapId, Map<String, String> requestMap);

	public Object select(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, Object object);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int delete(String sqlMapId, Object object);

	public int update(String sqlMapId, Object object);
}
