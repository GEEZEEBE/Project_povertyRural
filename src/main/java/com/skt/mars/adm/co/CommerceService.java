package com.skt.mars.adm.co;

import java.util.List;
import java.util.Map;

/**
 * CommerceService - 커머스 테스트
 * 
 * @author Kim Do youn
 * @version
 * @since
 * @created 2012. 01. 22.
 */

public interface CommerceService {

	public List<Commerce> selectList(String sqlMapId, Map<String, String> requestMap);

	public Commerce select(String sqlMapId, Map<String, String> requestMap);
	
	public List selectListNoPage(String sqlMapId, Map requestMap);
	
	public Integer select(String sqlMapId, Commerce commerce);		
	
	public Object insert(String sqlMapId, Commerce commerce);
	
	public Object insert(String sqlMapId, Map requestMap);
	
	public int delete(String sqlMapId, Map<String, String> requestMap);
	
	public int delete(String sqlMapId, Object object);
	
	public int update(String sqlMapId, Commerce commerce);
	
	public int update(String sqlMapId, Map requestMap);

}
