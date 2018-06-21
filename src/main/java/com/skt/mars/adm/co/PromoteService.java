package com.skt.mars.adm.co;

import java.util.List;
import java.util.Map;

/**
 * PromoteService - 커머스 테스트
 * 
 * @author Kim Do youn
 * @version
 * @since
 * @created 2012. 02. 08.
 */

public interface PromoteService {

	public List<Promote> selectList(String sqlMapId, Map<String, String> requestMap);

	public Promote select(String sqlMapId, Map<String, String> requestMap);
	
	public Integer select(String sqlMapId, Promote promote);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int delete(String sqlMapId, Object object);
	
	public int update(String sqlMapId, Promote promote);
	
	public int update(String sqlMapId, Map<String, String> requestMap);
		
}
