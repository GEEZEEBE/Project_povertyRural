package com.skt.mars.adm.rm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

/**
 * PC 모니터링
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 29.
 */

@Service("pcMonitoringService")
public class PCMonitoringServiceImpl implements PCMonitoringService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	@SuppressWarnings("unchecked")
	public List selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List) commonDao.selectListForNoPage(sqlMapId, requestMap);
	}
}
