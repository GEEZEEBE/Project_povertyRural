package com.skt.mars.usr.mp;

import java.util.Map;

public interface MyPageService {

    public MyPage select(String sqlMapId, Map<String, String> requestMap);

    public int update(String sqlMapId, Map<String, String> requestMap);
}
