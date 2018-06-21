package com.skt.mars.adm.cm;

import java.util.List;
import java.util.Map;

public interface CommonCodeService {

    public List selectList(String sqlMapId, Map<String, String> requestMap);

    public CommonCode select(String sqlMapId, Map<String, String> requestMap);

    public Object insert(String sqlMapId, CommonCode user);

    public int delete(String sqlMapId, Map<String, String> requestMap);

    public int update(String sqlMapId, CommonCode user);

	public Object insert(String sqlMapId, Object object);

    public int update(String sqlMapId, Object object);

	public Object selectByObject(String sqlMapId, Object object);
}
