package com.skt.mars.adm.co;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;


/**
 * PromoteServiceImpl - 커머스 테스트
 * 
 * @author Kim Do youn
 * @version
 * @since
 * @created 2012. 02. 08.
 */


@Service("promoteService")
public class PromoteServiceImpl implements PromoteService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Promote select(String sqlMapId, Map<String, String> requestMap) {
		return (Promote) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}
	
	public Integer select(String sqlMapId, Promote promote) {
		
		return (Integer)commonDao.selectByCategoryID(sqlMapId, promote);
	}

	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int delete(String sqlMapId, Object object) {
		return commonDao.delete(sqlMapId, object);
	}

	@SuppressWarnings("unchecked")
	public List<Promote> selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List<Promote>)commonDao.selectList(sqlMapId, requestMap);	
	}
	
	public int update(String sqlMapId, Promote promote) {
		return commonDao.update(sqlMapId, promote);
	}
	
	public int update(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.update(sqlMapId, requestMap);
	}
}
