package com.skt.mars.adm.st;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("statesService")	// modify here
public class StatesServiceImpl implements StatesService {	// modify here

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Object select(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.selectByCategoryID(sqlMapId, requestMap);
	}

	public Object insert(String sqlMapId, Object object) {
		Object resultObject = commonDao.insert(sqlMapId, object);
		return resultObject;
	}

	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int delete(String sqlMapId, Object object) {
		return commonDao.delete(sqlMapId, object);
	}

	public int update(String sqlMapId, Object object) {
		return commonDao.update(sqlMapId, object);
	}

	@SuppressWarnings("unchecked")
	public List selectList(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.selectList(sqlMapId, requestMap);
	}

	@SuppressWarnings("unchecked")
	public List selectListForNoPage(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.selectListForNoPage(sqlMapId, requestMap);
	}
	
}
