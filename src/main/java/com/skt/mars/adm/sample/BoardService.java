package com.skt.mars.adm.sample;

import java.util.List;
import java.util.Map;

public interface BoardService {

	public List selectList(String sqlMapId, Map<String, String> requestMap);

	public Board select(String sqlMapId, Board board);
	
	public Object insert(String sqlMapId, Board board);
	
	public int delete(String sqlMapId, Board board);
	
	public int update(String sqlMapId, Board board);}
