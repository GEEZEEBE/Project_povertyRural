package com.skt.mars.adm.cm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("commonCodesService")
// modify here
public class CommonCodeServiceImpl implements CommonCodeService { // modify here

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public CommonCode select(String sqlMapId, Map<String, String> requestMap) {
        return (CommonCode)commonDao.selectByCategoryID(sqlMapId, requestMap);
    }

    @Override
    public Object selectByObject(String sqlMapId, Object object) {
        return commonDao.selectByObject(sqlMapId, object);
    }

    @Override
    public Object insert(String sqlMapId, CommonCode commonCode) {
        String randomCategory = DateFormatUtil.getRandomID();
        commonCode.setCodeID(randomCategory);
        commonDao.insert(sqlMapId, commonCode);
        return randomCategory;
    }

    @Override
	public Object insert(String sqlMapId, Object object){
        commonDao.insert(sqlMapId, object);
        return 1;
    }

    @Override
    public int delete(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.delete(sqlMapId, requestMap);
    }

    @Override
    public int update(String sqlMapId, CommonCode commonCode) {
        return commonDao.update(sqlMapId, commonCode);
    }

    @Override
    public int update(String sqlMapId, Object object) {
        return commonDao.update(sqlMapId, object);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List selectList(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectListForNoPage(sqlMapId, requestMap);
    }
    
}
