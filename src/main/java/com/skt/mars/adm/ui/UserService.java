package com.skt.mars.adm.ui;

import java.util.List;
import java.util.Map;

public interface UserService {

	public List selectList(String sqlMapId, Map<String, String> requestMap);
	
	public List selectListForNoPage(String sqlMapId, Map<String, String> requestMap);

	public User select(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, User user);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int update(String sqlMapId, User user);
}
