package com.skt.mars.adm.sample;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.CommonDefultDao;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "commonDAO")
	private CommonDefultDao commonDao;

	public Board select(String sqlMapId, Board board) {
		return (Board) commonDao.selectByCategoryID(null, board);
	}

	public Object insert(String sqlMapId, Board board) {
		long randomCategory = DateFormatUtil.getRandomCategoryID();
//		board.setCategoryID(randomCategory);
//		board.setLeftCategoryID(randomCategory);
//		board.setRightCategoryID(randomCategory);
		return commonDao.insert(sqlMapId, board);
	}

	public int delete(String sqlMapId, Board board) {
		return commonDao.delete(sqlMapId, board);
	}

	public int update(String sqlMapId, Board board) {
		return commonDao.update(sqlMapId, board);
	}

	@SuppressWarnings("unchecked")
	public List selectList(String sqlMapId, Map<String, String> requestMap) {
		return (List)commonDao.selectList(sqlMapId, requestMap);
	}
}
