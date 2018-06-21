package com.skt.mars.adm.ui;

import java.util.List;
import java.util.Map;

public interface OperatorService {

	public List<Operator> selectList(String sqlMapId, Map<String, String> requestMap);

	public Operator select(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, Operator operator);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int delete(String sqlMapId, Object object);
	
	public int update(String sqlMapId, Operator operator);}
