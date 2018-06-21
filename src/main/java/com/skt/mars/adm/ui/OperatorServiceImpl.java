package com.skt.mars.adm.ui;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("operatorService")	// modify here
public class OperatorServiceImpl implements OperatorService {	// modify here

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Operator select(String sqlMapId, Map<String, String> requestMap) {
		return (Operator) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}

	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int delete(String sqlMapId, Object object) {
		return commonDao.delete(sqlMapId, object);
	}

	@SuppressWarnings("unchecked")
	public List<Operator> selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List<Operator>)commonDao.selectList(sqlMapId, requestMap);
	}

	@Override
	public Object insert(String sqlMapId, Operator operator) {
		String randomCategory = DateFormatUtil.getSequenceID(operator.getAuthority());
		operator.setUserID(randomCategory);
		commonDao.insert(sqlMapId, operator);
		return randomCategory;
	}

	@Override
	public int update(String sqlMapId, Operator operator) {
		// TODO Auto-generated method stub
		return commonDao.update(sqlMapId, operator);
	}
}
