package com.skt.mars.adm.cm.ut;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.skt.mars.adm.lg.CustomUser;

public class MenuPreparer implements ViewPreparer {

	public void execute(TilesRequestContext tilesContext,
			AttributeContext attributeContext) {
		
		// Get Context Path for which way
		HttpServletRequest request = (HttpServletRequest) tilesContext.getRequest();

		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		
		// display Menu
		String controllerPath = uri.substring(contextPath.length(), uri.lastIndexOf('/'));
		
		// in case Nothing value insert ""
		if(controllerPath.length() <= 0){
			controllerPath = uri.replaceAll(contextPath, "");
		}
		
		tilesContext.getRequestScope().put("controllerPath", controllerPath);
		tilesContext.getRequestScope().put("uri", uri);

		// for display current page
        String[] arrCurrentPage = null;
        arrCurrentPage = uri.substring(contextPath.length()+1).split("/");

		List<String> menuList = new ArrayList<String>();
		for(int i=0; i<arrCurrentPage.length; i++){
			menuList.add(arrCurrentPage[i]);
		}
//		tilesContext.getRequestScope().put("arrCurrentPage", arrCurrentPage);
		tilesContext.getRequestScope().put("menuList", menuList);
        
		// security information by spring
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = null;
		String userID = null;
		
		if(auth != null){
			username = auth.getName(); //get logged in username
			tilesContext.getRequestScope().put("username", username);			
			
			if(auth.getPrincipal() != null && !"anonymousUser".equals(auth.getPrincipal())){
				CustomUser customUser = (CustomUser) auth.getPrincipal();
				userID = customUser.getUserID();
			
			}
			tilesContext.getRequestScope().put("userID", userID);
		}
		// title time
		Locale locale = new Locale("en");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		tilesContext.getRequestScope().put("serverTime", formattedDate );		
	}

}
