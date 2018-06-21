package com.skt.mars.usr.mp;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;

@Service("MyPageService")
// modify here
public class MyPageServiceImpl implements MyPageService { // modify here

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public MyPage select(String sqlMapId, Map<String, String> requestMap) {
        return (MyPage)commonDao.selectByCategoryID(sqlMapId, requestMap);
    }

    @Override
    public int update(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.update(sqlMapId, requestMap);
    }

}
