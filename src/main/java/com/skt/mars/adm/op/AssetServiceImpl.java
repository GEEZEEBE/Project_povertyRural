package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("AssetService")
// modify here
public class AssetServiceImpl implements AssetService { // modify here

    protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "commonDAO")
    private CommonDefultDao commonDao;

    @Override
    public Asset select(String sqlMapId, Map<String, String> requestMap) {
        return (Asset)commonDao.selectByCategoryID(sqlMapId, requestMap);
    }

    @Override
    public Object insert(String sqlMapId, Asset asset) {
        String randomCategory = DateFormatUtil.getRandomID();
        //user.setUserID(randomCategory);
        commonDao.insert(sqlMapId, asset);
        return randomCategory;
    }

    @Override
    public Object childInsert(String sqlMapId, Map<String, String> requestMap) {
        String randomCategory = DateFormatUtil.getRandomID();
        commonDao.insert(sqlMapId, requestMap);
        return randomCategory;
    }

    @Override
    public int delete(String sqlMapId, Object obj) {
        return commonDao.delete(sqlMapId, obj);
    }

    @Override
    public int update(String sqlMapId, Asset asset) {
        return commonDao.update(sqlMapId, asset);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Asset> selectList(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectList(sqlMapId, requestMap);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Asset> selectListNoPage(String sqlMapId, Map<String, String> requestMap) {
        return commonDao.selectListForNoPage(sqlMapId, requestMap);
    }

    @Override
    public int update(String sqlMapId, Object obj) {
        // TODO Auto-generated method stub
        return commonDao.update(sqlMapId, obj);
    }

	@Override
	public void insert(String sqlMapId, Object obj) {
		// TODO Auto-generated method stub
		commonDao.insert(sqlMapId, obj);
	}

	@Override
	public Object selectByCategoryID(String sqlMapId,
			Map<String, String> requestMap) {
		// TODO Auto-generated method stub
		return (Object)commonDao.selectByCategoryID(sqlMapId, requestMap);

	}

}
