package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("CostService")	// modify here
public class CostServiceImpl implements CostService {	// modify here

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Cost select(String sqlMapId, Map<String, String> requestMap) {
		return (Cost) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}

	public Object insert(String sqlMapId, Cost cost) {
		String randomCategory = DateFormatUtil.getRandomID();
		cost.setCostpricID(randomCategory);
		commonDao.insert(sqlMapId, cost);
		return randomCategory; 
	}

	public int delete(String sqlMapId, Object obj) {
		return commonDao.delete(sqlMapId, obj);
	}

	public int update(String sqlMapId, Cost cost) {
		return commonDao.update(sqlMapId, cost);
	}

	@SuppressWarnings("unchecked")
	public List<Cost> selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List<Cost>)commonDao.selectList(sqlMapId, requestMap);
	}

	@Override
	public int update(String sqlMapId, Object obj) {
		// TODO Auto-generated method stub
		return commonDao.update(sqlMapId, obj);
	}

	
}
