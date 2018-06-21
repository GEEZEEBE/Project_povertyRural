package com.skt.mars.adm.sm;

import java.util.List;
import java.util.Map;

/**
 * CategoryService - 서비스관리>서비스카테고리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

public interface CategoryService {

    public List selectCategoryList(String sqlMapId, Map<String, String> requestMap);

    public Map select(String sqlMapId, Map<String, String> requestMap);
}
