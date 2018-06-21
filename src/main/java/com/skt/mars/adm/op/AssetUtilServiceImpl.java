package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("AssetUtilService")	// modify here
public class AssetUtilServiceImpl implements AssetUtilService {	// modify here

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public AssetUtil select(String sqlMapId, Map<String, String> requestMap) {
		return (AssetUtil) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}

	public Object insert(String sqlMapId,  AssetUtil assetUtil) {
		String randomCategory = DateFormatUtil.getRandomID();
		assetUtil.setUseHsNmbrID(randomCategory);
		commonDao.insert(sqlMapId, assetUtil);
		return randomCategory; 
	}

	public int delete(String sqlMapId, Object obj) {
		return commonDao.delete(sqlMapId, obj);
	}

	public int update(String sqlMapId,  AssetUtil assetUtil) {
		return commonDao.update(sqlMapId, assetUtil);
	}

	@SuppressWarnings("unchecked")
	public List selectList(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.selectList(sqlMapId, requestMap);
	}

	

	
}
