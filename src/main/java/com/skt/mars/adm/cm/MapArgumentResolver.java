package com.skt.mars.adm.cm;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import com.skt.mars.adm.lg.CustomUser;

/**
 * Controller 클래스가 로드되기 전 파라미터 값에 따라 특정 작업을 수행하기 위한 클래스이다.
 * 
 */
public class MapArgumentResolver implements WebArgumentResolver {

    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest) throws Exception {

        Class<?> clazz = methodParameter.getParameterType();
        String paramName = methodParameter.getParameterName();

        if (clazz.equals(Map.class) && paramName.equals("requestMap")) {
            Map<String, Object> requestMap = new HashMap<String, Object>();
            HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();
            Enumeration<?> enumeration = request.getParameterNames();

            while (enumeration.hasMoreElements()) {
                String key = (String)enumeration.nextElement();
                String[] values = request.getParameterValues(key);
                if (values != null) {
                    requestMap.put(key, (values.length > 1) ? values : values[0]);
                }
            }

            // set Session information
    		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    		
    		if(auth != null){
    		
    			if(auth.getPrincipal() != null && !"anonymousUser".equals(auth.getPrincipal())){
        			String userID = null;

    				CustomUser customUser = (CustomUser) auth.getPrincipal();

    				userID = customUser.getUserID();
    			
    	    		requestMap.put("frstRgstUserID", userID); //get logged in username
    	    		requestMap.put("latCrctUserID", userID); //get logged in username

    			}
    		}

    		// check to search word
    		/*
    		if(!"Y".equals(requestMap.get("searchCheck"))){
    			requestMap.put("serTxt", null);
    		}
    		*/

            return requestMap;
        }
        return UNRESOLVED;
    }

}
