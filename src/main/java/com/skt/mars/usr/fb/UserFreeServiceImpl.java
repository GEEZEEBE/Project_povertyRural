package com.skt.mars.usr.fb;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("UserFreeService")	// modify here
public class UserFreeServiceImpl implements UserFreeService {	// modify here

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public UserFree select(String sqlMapId, Map<String, String> requestMap) {
		return (UserFree) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}

	public Object insert(String sqlMapId, UserFree user) {
//		String randomCategory = DateFormatUtil.getRandomID();
		//user.setUserID(randomCategory);
		commonDao.insert(sqlMapId, user);
		return user.getBoardID(); 
	}

	public Object insert(String sqlMapId, Map requestMap) {
		commonDao.insert(sqlMapId, requestMap);
		return 1; 
	}

	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int update(String sqlMapId, UserFree user) {
		return commonDao.update(sqlMapId, user);
	}
	
	public int replyupdate(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.update(sqlMapId, requestMap);
	}

	@SuppressWarnings("unchecked")
	public List<UserFree> selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List<UserFree>)commonDao.selectList(sqlMapId, requestMap);
	}
	
	@Override
	public Object selectFile(String sqlMapId, Map<String, String> requestMap) {
		// TODO Auto-generated method stub
		return commonDao.selectListForNoPage(sqlMapId, requestMap);
	}
}
