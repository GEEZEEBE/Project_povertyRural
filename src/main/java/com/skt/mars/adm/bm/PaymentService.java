package com.skt.mars.adm.bm;

import java.util.List;
import java.util.Map;

public interface PaymentService {

	public List selectList(String sqlMapId, Map<String, String> requestMap);

	public List selectListForNoPage(String sqlMapId, Object requestMap);

	public Object select(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, Object object);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int delete(String sqlMapId, Object object);

	public int update(String sqlMapId, Object object);
}
