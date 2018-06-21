package com.skt.mars.usr.mh;

import java.util.List;
import java.util.Map;

public interface MyUsePageService {

    public List selectList(String sqlMapId, Map<String, String> requestMap);

    public MyUsePage select(String sqlMapId, Map<String, String> requestMap);

    public int update(String sqlMapId, Map<String, String> requestMap);
}
