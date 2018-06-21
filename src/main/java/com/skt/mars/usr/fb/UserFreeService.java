package com.skt.mars.usr.fb;

import java.util.List;
import java.util.Map;

public interface UserFreeService {

	public List<UserFree> selectList(String sqlMapId, Map<String, String> requestMap);

	public UserFree select(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, UserFree user);
	
	public Object insert(String sqlMapId, Map requestMap);

	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int update(String sqlMapId, UserFree user);
	
	public int replyupdate(String sqlMapId, Map<String, String> requestMap);
	
	public Object selectFile(String sqlMapId, Map<String, String> requestMap);

}
