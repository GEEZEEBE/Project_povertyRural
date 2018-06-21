package com.skt.mars.adm.im;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

/**
 * 상품관리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 29.
 */

@Service("godsService")
public class GodsServiceImpl implements GodsService {

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public Gods select(String sqlMapId, Map<String, String> requestMap) {
        return (Gods)commonDao.selectByCategoryID(sqlMapId, requestMap);
    }

    @Override
    public Object insert(String sqlMapId, Map<String, String> requestMap) {
        long randomCategory = DateFormatUtil.getRandomCategoryID();
        //		board.setCategoryID(randomCategory);
        //		board.setLeftCategoryID(randomCategory);
        //		board.setRightCategoryID(randomCategory);
        return commonDao.insert(sqlMapId, requestMap);
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
    public List selectList(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectList(sqlMapId, requestMap);
    }
}
