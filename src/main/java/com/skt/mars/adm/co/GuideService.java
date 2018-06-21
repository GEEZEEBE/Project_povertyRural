package com.skt.mars.adm.co;

import java.util.List;
import java.util.Map;

/**
 * GuideService - 커머스 테스트
 * 
 * @author Kim Do youn
 * @version
 * @since
 * @created 2012. 01. 22.
 */

public interface GuideService {

	public List<Guide> selectList(String sqlMapId, Map<String, String> requestMap);

	public Guide select(String sqlMapId, Map<String, String> requestMap);
	
	public Integer select(String sqlMapId, Guide guide);
	
	public Object insert(String sqlMapId, Guide guide);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int delete(String sqlMapId, Object object);
	
	public int update(String sqlMapId, Guide guide);

}
