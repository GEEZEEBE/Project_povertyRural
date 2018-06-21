package com.skt.mars.adm.bm;

import java.util.List;
import java.util.Map;

public interface PriceService {

    public List selectList(String sqlMapId, Map<String, String> requestMap);

    public Price select(String sqlMapId, Price board);

    public Object insert(String sqlMapId, Map<String, String> requestMap);

    public int delete(String sqlMapId, Price board);

    public int update(String sqlMapId, Map<String, String> requestMap);
}
