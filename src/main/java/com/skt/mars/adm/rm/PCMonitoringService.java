package com.skt.mars.adm.rm;

import java.util.List;
import java.util.Map;

/**
 * PC 모니터링
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 29.
 */

public interface PCMonitoringService {

	public List selectList(String sqlMapId, Map<String, String> requestMap);
}