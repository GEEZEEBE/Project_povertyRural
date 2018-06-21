package com.skt.mars.adm.ui;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("userService")	// modify here
public class UserServiceImpl implements UserService {	// modify here

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public User select(String sqlMapId, Map<String, String> requestMap) {
		return (User) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}

	public Object insert(String sqlMapId, User user) {
		String randomCategory = DateFormatUtil.getSequenceID(user.getAuthority());
		user.setUserID(randomCategory);
		commonDao.insert(sqlMapId, user);
		return randomCategory;
	}

	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int update(String sqlMapId, User user) {
		return commonDao.update(sqlMapId, user);
	}

	@SuppressWarnings("unchecked")
	public List selectList(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.selectList(sqlMapId, requestMap);
	}
	
    public List selectListForNoPage(String sqlMapId, Map<String, String> requestMap){
		return commonDao.selectListForNoPage(sqlMapId, requestMap);
	}
}
