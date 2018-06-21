package com.skt.mars.usr.sc;

import java.util.List;
import java.util.Map;

public interface SmartClassService {

    public List selectList(String sqlMapId, Map requestMap);

    public List selectListNoPage(String sqlMapId, Map requestMap);

    public Object select(String sqlMapId, Map requestMap);

    public Object insert(String sqlMapId, Map requestMap);

    public int delete(String sqlMapId, SmartClass smartClass);

    public int update(String sqlMapId, Map requestMap);
}
