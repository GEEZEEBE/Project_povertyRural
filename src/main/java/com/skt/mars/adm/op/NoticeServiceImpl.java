package com.skt.mars.adm.op;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("NoticeService")	// modify here
public class NoticeServiceImpl implements NoticeService {	// modify here

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Notice select(String sqlMapId, Map<String, String> requestMap) {
		return (Notice) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}

	public Object insert(String sqlMapId, Notice user) {
		String randomCategory = DateFormatUtil.getRandomID();
		//user.setUserID(randomCategory);
		commonDao.insert(sqlMapId, user);
		return randomCategory; 
	}

	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int update(String sqlMapId, Notice user) {
		return commonDao.update(sqlMapId, user);
	}

	@SuppressWarnings("unchecked")
	public List<Notice> selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List<Notice>)commonDao.selectList(sqlMapId, requestMap);
	}

	@Override
	public void insert(String sqlMapId, Map requestMap) {
		// TODO Auto-generated method stub
		commonDao.insert(sqlMapId, requestMap);
	}

	@Override
	public Object selectFile(String sqlMapId, Map<String, String> requestMap) {
		// TODO Auto-generated method stub
		return commonDao.selectListForNoPage(sqlMapId, requestMap);
	}
}
