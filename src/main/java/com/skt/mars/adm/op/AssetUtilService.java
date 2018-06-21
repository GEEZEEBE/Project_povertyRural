package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

public interface AssetUtilService {

	public List selectList(String sqlMapId, Map<String, String> requestMap);

	public AssetUtil select(String sqlMapId, Map<String, String> requestMap);
	
	public Object insert(String sqlMapId, AssetUtil assetUtil);
	
	public int delete(String sqlMapId, Object obj);
	
	public int update(String sqlMapId, AssetUtil assetUtil);}
