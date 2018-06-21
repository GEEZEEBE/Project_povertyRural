package com.skt.mars.usr.mh;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;

@Service("MyUsePageService")
// modify here
public class MyUsePageServiceImpl implements MyUsePageService { // modify here

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public MyUsePage select(String sqlMapId, Map<String, String> requestMap) {
        return (MyUsePage)commonDao.selectByCategoryID(sqlMapId, requestMap);
    }

    @Override
    public int update(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.update(sqlMapId, requestMap);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List selectList(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectListForNoPage(sqlMapId, requestMap);
    }

}
