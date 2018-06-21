package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	public List<Notice> selectList(String sqlMapId, Map<String, String> requestMap);

	public Notice select(String sqlMapId, Map<String, String> requestMap);
	public Object selectFile(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, Notice user);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int update(String sqlMapId, Notice user);

	public void insert(String sqlMapId, Map requestMap);
	
}
