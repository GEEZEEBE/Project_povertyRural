package com.skt.mars.adm.bm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("priceService")
public class PriceServiceImpl implements PriceService {

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public Price select(String sqlMapId, Price price) {
        return (Price)commonDao.selectByCategoryID(sqlMapId, price);
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
    public int delete(String sqlMapId, Price price) {
        return commonDao.delete(sqlMapId, price);
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
}
