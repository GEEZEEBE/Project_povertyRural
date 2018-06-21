package com.skt.mars.adm.sm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

/**
 * ItemServiceImpl - 서비스관리>아이템관리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

@Service("itemService")
public class ItemServiceImpl implements ItemService {

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public Object select(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectByCategoryID(sqlMapId, requestMap);
    }

    @Override
    public Object insert(String sqlMapId, Item item) {
        long randomCategory = DateFormatUtil.getRandomCategoryID();

        return commonDao.insert(sqlMapId, item);
    }

    @Override
    public int delete(String sqlMapId, Object object) {
        return commonDao.delete(sqlMapId, object);
    }

    @Override
    public int update(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.update(sqlMapId, requestMap);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List selectList(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectList(sqlMapId, requestMap);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List selectListNoPage(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectListForNoPage(sqlMapId, requestMap);
    }
}
