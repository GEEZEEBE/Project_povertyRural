package com.skt.mars.adm.im;

import java.util.List;
import java.util.Map;

/**
 * 상품관리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 29.
 */

public interface GodsService {

    public List selectList(String sqlMapId, Map<String, String> requestMap);

    public Gods select(String sqlMapId, Map<String, String> requestMap);

    public Object insert(String sqlMapId, Map<String, String> requestMap);

    public int delete(String sqlMapId, Object object);

    public int update(String sqlMapId, Map<String, String> requestMap);
}
