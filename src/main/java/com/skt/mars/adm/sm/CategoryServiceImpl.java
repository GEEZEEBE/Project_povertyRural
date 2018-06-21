package com.skt.mars.adm.sm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;

/**
 * CategoryServiceImpl - 서비스관리>서비스카테고리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public List selectCategoryList(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectListForNoPage(sqlMapId, requestMap);
    }

    @Override
    public Map select(String sqlMapId, Map<String, String> requestMap) {
        return (Map)commonDao.selectByCategoryID(sqlMapId, requestMap);
    }
}
