package com.skt.mars.adm.sm;

import java.util.List;
import java.util.Map;

/**
 * ItemService - 서비스관리>아이템관리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

public interface ItemService {

    public List selectList(String sqlMapId, Map<String, String> requestMap);

    public List selectListNoPage(String sqlMapId, Map<String, String> requestMap);

    public Object select(String sqlMapId, Map<String, String> requestMap);

    public Object insert(String sqlMapId, Item item);

    public int delete(String sqlMapId, Object object);

    public int update(String sqlMapId, Map<String, String> requestMap);
}
