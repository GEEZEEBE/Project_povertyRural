package com.skt.mars.adm.lg;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoCacheFilter implements Filter {

	public void init(FilterConfig config) throws ServletException {
		this.filterConfig = config;
	}

	private FilterConfig filterConfig;

	public FilterConfig getFilterConfig() {
		return this.filterConfig;
	}

	public void setFilterConfig(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}

	public void destroy() {
		this.filterConfig = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) {
		try {
			HttpServletRequest httpRequest = (HttpServletRequest) request;   
			
//			httpRequest.getAttribute("");
			
//			if(httpRequest.getMethod().equalsIgnoreCase("GET")){
				if (response instanceof HttpServletResponse) {
					HttpServletResponse httpresponse = (HttpServletResponse) response;

					// Set the Cache-Control and Expires header
//					httpresponse.setHeader("Cache-Control", "no-cache");
//					httpresponse.setHeader("Expires", "0");
				    httpresponse.addHeader("Pragma", "no-cache");
				    httpresponse.addHeader("Cache-Control", "no-cache");

				    httpresponse.addHeader("Cache-Control", "no-store");
				    httpresponse.addHeader("Cache-Control", "must-revalidate");
				    
				    // expires on some date in the past
				    httpresponse.addHeader("Expires", "Mon, 8 Aug 2006 10:00:00 GMT");
				    
					// Print out the URL we're filtering
					String name = httpRequest.getRequestURI();
					
//					System.out.println("No Cache Filtering: " + name);
				}
//			}
			chain.doFilter(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} catch (ServletException e) {

			e.printStackTrace();
		}
	}
}
