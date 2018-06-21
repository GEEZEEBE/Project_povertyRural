package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

public interface CostService {

	public List<Cost> selectList(String sqlMapId, Map<String, String> requestMap);

	public Cost select(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, Cost cost);
	
	public int delete(String sqlMapId, Object obj);
	
	public int update(String sqlMapId, Cost cost);

	public int update(String sqlMapId, Object obj);}
