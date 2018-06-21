package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

public interface AssetService {

    public List<Asset> selectList(String sqlMapId, Map<String, String> requestMap);

    public List<Asset> selectListNoPage(String sqlMapId, Map<String, String> requestMap);

    public Asset select(String sqlMapId, Map<String, String> requestMap);

    public Object insert(String sqlMapId, Asset asset);

    public Object childInsert(String sqlMapId, Map<String, String> requestMap);

    public int delete(String sqlMapId, Object obj);

    public int update(String sqlMapId, Asset asset);

	public int update(String sqlMapId, Object obj);

	public void insert(String sqlMapId, Object obj);

	public Object selectByCategoryID(String sqlMapId,
			Map<String, String> requestMap);
}
