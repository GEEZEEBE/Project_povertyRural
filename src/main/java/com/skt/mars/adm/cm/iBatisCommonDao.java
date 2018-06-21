package com.skt.mars.adm.cm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.skt.mars.adm.cm.tld.PageList;

@Repository(value = "commonDAO")
public class iBatisCommonDao extends SqlMapClientDaoSupport implements CommonDefultDao {

	/** Logger for this class and subclasses */
	protected final Log logger = LogFactory.getLog(getClass());

    @Resource(name = "sqlMapClient")
    public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
        super.setSqlMapClient(sqlMapClient);
    }

    @Value("#{commonProperty['list.count.per.page']}") 
    private int listCountPerPage; 
    
    @SuppressWarnings("rawtypes")
	public List selectList(String sqlMapId, Map requestMap) {
		logger.info("Getting selectList!");

        String paramPageNo = (String)requestMap.get("currentPage");
        String paramListSize = (String)requestMap.get("listSize");

        int pageNo = (paramPageNo == null) ? 1 : Integer.parseInt(paramPageNo);
        int listSize = ((paramListSize == null) ? listCountPerPage
                                              : Integer.parseInt(paramListSize));
//        int listSize = (paramListSize == null) ? 10 : Integer.parseInt(paramListSize);

        int totalCount = (Integer)getSqlMapClientTemplate().queryForObject(sqlMapId + ".TotalCount",requestMap);

        int topSize = totalCount - (listSize * (pageNo - 1));
        requestMap.put("topSize", new Integer(topSize));
        requestMap.put("listSize", new Integer(listSize));
        requestMap.put("totalCount", new Integer(totalCount));

        List objects = new PageList(getSqlMapClientTemplate().queryForList(sqlMapId, requestMap),
                                    totalCount,
                                    pageNo,
                                    listSize);
		return objects;
	}

	/*
	 * Don't need paging
	 */
	@SuppressWarnings("rawtypes")
	public List selectListForNoPage(String sqlMapId, Object requestMap) {
		logger.info("Getting selectList!");

        List objects = getSqlMapClientTemplate().queryForList(sqlMapId, requestMap);
                                  
		return objects;
	}
	@SuppressWarnings("rawtypes")
	public List selectList(String sqlMapId, Object object) {
		logger.info("Getting objects!");

		List objects = getSqlMapClientTemplate()
				.queryForList(sqlMapId,object);
		return objects;
	}

	public Object selectByCategoryID(String sqlMapId, Object Object) {
		return getSqlMapClientTemplate().queryForObject(
				sqlMapId, Object);
	}

	public Object insert(String sqlMapId, Object object) {
		Object resultObj = null;
		resultObj = getSqlMapClientTemplate().insert(sqlMapId,
				object);
		return resultObj;
	}

	public int delete(String sqlMapId, Object Object) {
		logger.info("deleting Object: " + Object);

		int count = getSqlMapClientTemplate().delete(sqlMapId, Object);

		logger.info("Rows affected: " + count);

		return count;
	}

	public int update(String sqlMapId, Object Object) {
		return getSqlMapClientTemplate().update(sqlMapId, Object);
	}

	@Override
	public Object selectByCategoryID(String sqlMapId,
			Map<String, String> requestMap) {
		return getSqlMapClientTemplate().queryForObject(
				sqlMapId, requestMap);
	}

	@Override
	public int delete(String sqlMapId, Map<String, String> requestMap) {
		return getSqlMapClientTemplate().update(sqlMapId, requestMap);
	}

	public Object selectByObject(String sqlMapId, Object object) {
		return getSqlMapClientTemplate().queryForObject(
				sqlMapId, object);
	}
	
}
