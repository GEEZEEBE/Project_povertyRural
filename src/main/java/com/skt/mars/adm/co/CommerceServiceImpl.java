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
 * CommerceServiceImpl - 커머스 테스트
 * 
 * @author Kim Do youn
 * @version
 * @since
 * @created 2012. 01. 22.
 */


@Service("commerceService")
public class CommerceServiceImpl implements CommerceService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Commerce select(String sqlMapId, Map<String, String> requestMap) {
		return (Commerce) commonDao.selectByCategoryID(sqlMapId, requestMap);
	}
	
	public Integer select(String sqlMapId, Commerce commerce) {
		
		return (Integer)commonDao.selectByCategoryID(sqlMapId, commerce);
	}
   
	@Override
    @SuppressWarnings("unchecked")
    public List selectListNoPage(String sqlMapId, Map requestMap) {
        return commonDao.selectListForNoPage(sqlMapId, requestMap);
    }
	
	public Object insert(String sqlMapId, Commerce commerce) {
//		long randomCategory = DateFormatUtil.getRandomCategoryID();
//		board.setCategoryID(randomCategory);
//		board.setLeftCategoryID(randomCategory);
//		board.setRightCategoryID(randomCategory);
		
		return commonDao.insert(sqlMapId, commerce);
	}

	public Object insert(String sqlMapId, Map requestMap) {
		commonDao.insert(sqlMapId, requestMap);
		return 1; 
	}
	
	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return commonDao.delete(sqlMapId, requestMap);
	}

	public int delete(String sqlMapId, Object object) {
		return commonDao.delete(sqlMapId, object);
	}

	@SuppressWarnings("unchecked")
	public List<Commerce> selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List<Commerce>)commonDao.selectList(sqlMapId, requestMap);	
	}
	
	public int update(String sqlMapId, Commerce commerce) {
		return commonDao.update(sqlMapId, commerce);
	}
	
	@Override
    public int update(String sqlMapId, Map requestMap) {
        return commonDao.update(sqlMapId, requestMap);
    }
}
