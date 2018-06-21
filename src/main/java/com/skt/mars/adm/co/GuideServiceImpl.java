package com.skt.mars.adm.co;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.ui.User;


/**
 * GuideServiceImpl - 커머스 테스트
 * 
 * @author Kim Do youn
 * @version
 * @since
 * @created 2012. 01. 22.
 */


@Service("guideService")
public class GuideServiceImpl implements GuideService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Guide select(String sqlMapId, Map<String, String> requestMap) {
		return (Guide) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}
	
	public Integer select(String sqlMapId, Guide guide) {
		
		return (Integer)commonDao.selectByCategoryID(sqlMapId, guide);
	}

	public Object insert(String sqlMapId, Guide guide) {
//		long randomCategory = DateFormatUtil.getRandomCategoryID();
//		board.setCategoryID(randomCategory);
//		board.setLeftCategoryID(randomCategory);
//		board.setRightCategoryID(randomCategory);
		
		return commonDao.insert(sqlMapId, guide);
	}

	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int delete(String sqlMapId, Object object) {
		return commonDao.delete(sqlMapId, object);
	}

	@SuppressWarnings("unchecked")
	public List<Guide> selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List<Guide>)commonDao.selectList(sqlMapId, requestMap);	
	}
	
	public int update(String sqlMapId, Guide guide) {
		return commonDao.update(sqlMapId, guide);
	}
}
