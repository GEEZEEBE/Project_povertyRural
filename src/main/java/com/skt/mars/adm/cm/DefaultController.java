package com.skt.mars.adm.cm;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * <pre>
 * 상위 controller
 * 모든 controller 는 DefaultController 를 extends 해야한다.
 * </pre>
 * 
 * @author Sanghun oh
 * @created 2013. 01. 20.
 */
public class DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

    /**
     * 생성자
     */
    public DefaultController() {
        // default constructor
    }

    /**
     * debug 로그
     * 
     * @param message 로그 메세지
     */
    protected void debugLogger(Object message) {
    }

    /**
     * info 로그
     * 
     * @param message 로그 메세지
     */
    protected void infoLogger(Object message) {
//        Logger.info(getClass(), message);
    }

    /**
     * error 로그
     * 
     * @param message 로그 메세지
     */
    protected void errorLoger(Object message) {
    }

    /**
     * error 로그
     * 
     * @param message 로그 메세지
     * @param throwable 예외
     */
    protected void errorLgger(Object message, Throwable throwable) {
    }

    /**
     * warn 로그
     * 
     * @param message 로그 메세지
     */
    protected void warnLogger(Object message) {
    }

    /**
     * fatal 로그
     * 
     * @param message 로그 메세지
     */
    protected void fatalLogger(Object message) {
//        Logger.fatal(getClass(), message);
    }

    /**
     * 파라미터 정보 및 세션 정보 설정
     * 
     * @param request 파라미터
     * @return Map 객체
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	protected Map getParameterMap(HttpServletRequest request) {
        Map pMap = new HashMap();

        // 파라미터 정보 설정
        Map parameterMap = request.getParameterMap();
        Iterator itr = parameterMap.keySet().iterator();

        String key = null;
        while (itr.hasNext()) {
            key = (String)itr.next();

            String[] value = (String[])parameterMap.get(key);
            logger.info("getParameterMap"+key + ", " + value);
            
            if (value.length == 1) {
                pMap.put(key, value[0]);
                
            } else {
                pMap.put(key, value);
            }
        }

        return pMap;
    }

}
