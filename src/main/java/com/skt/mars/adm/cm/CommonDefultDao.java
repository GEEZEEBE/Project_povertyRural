package com.skt.mars.adm.cm;

import java.util.List;
import java.util.Map;

public interface CommonDefultDao {

    @SuppressWarnings("rawtypes")
    public List selectList(String sqlMapId, Map<String, String> requestMap);

    public List selectListForNoPage(String sqlMapId, Object requestMap);

    @SuppressWarnings("rawtypes")
    public List selectList(String sqlMapId, Object object);

    public Object selectByCategoryID(String sqlMapId, Object object);

    public Object selectByCategoryID(String sqlMapId, Map<String, String> requestMap);

    public Object insert(String sqlMapId, Object object);

    public int delete(String sqlMapId, Object object);

    public int delete(String sqlMapId, Map<String, String> requestMap);

    public int update(String sqlMapId, Object object);

    public Object selectByObject(String sqlMapId, Object object);
}
