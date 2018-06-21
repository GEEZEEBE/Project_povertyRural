package com.skt.mars.usr.ev;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("englishVillageService")
public class EnglishVillageServiceImpl implements EnglishVillageService {

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public Object select(String sqlMapId, Map requestMap) {
        return commonDao.selectByCategoryID(sqlMapId, requestMap);
    }

    @Override
    public Object insert(String sqlMapId, Map requestMap) {
        long randomCategory = DateFormatUtil.getRandomCategoryID();
        //		board.setCategoryID(randomCategory);
        //		board.setLeftCategoryID(randomCategory);
        //		board.setRightCategoryID(randomCategory);
        return commonDao.insert(sqlMapId, requestMap);
    }

    @Override
    public int delete(String sqlMapId, EnglishVillage board) {
        return commonDao.delete(sqlMapId, board);
    }

    @Override
    public int update(String sqlMapId, Map requestMap) {
        return commonDao.update(sqlMapId, requestMap);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List selectList(String sqlMapId, Map requestMap) {
        return commonDao.selectList(sqlMapId, requestMap);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List selectListNoPage(String sqlMapId, Map requestMap) {
        return commonDao.selectListForNoPage(sqlMapId, requestMap);
    }
}
